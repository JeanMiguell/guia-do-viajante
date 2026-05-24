package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.linhadotempo.dtos.ActivityProgressDTO;
import project.linhadotempo.dtos.AnswerResponseDTO;
import project.linhadotempo.dtos.GenericResponseDTO;
import project.linhadotempo.dtos.fullQuestions.*;
import project.linhadotempo.dtos.timeline.TimelineEvaluationDTO;
import project.linhadotempo.dtos.questions.ActivityDTO;
import project.linhadotempo.dtos.questions.ActivityResultResponseDTO;
import project.linhadotempo.dtos.questions.AlternativeDTO;
import project.linhadotempo.dtos.questions.AnswerRequestDTO;
import project.linhadotempo.dtos.questions.QuestionDTO;
import project.linhadotempo.enums.ActivityType;
import project.linhadotempo.enums.QuestionType;
import project.linhadotempo.exceptions.BadRequestException;
import project.linhadotempo.exceptions.ConflictException;
import project.linhadotempo.exceptions.ResourceNotFoundException;
import project.linhadotempo.exceptions.UnauthorizedException;
import project.linhadotempo.mappers.ActivityMapper;
import project.linhadotempo.models.*;
import project.linhadotempo.models.HistoryEvent;
import project.linhadotempo.models.Timeline;
import project.linhadotempo.projections.TimelineEvaluationProjection;
import project.linhadotempo.repositories.ActivityRepository;
import project.linhadotempo.repositories.UserTimelineRepository;
import project.linhadotempo.utils.ActivityUnitOfWork;
import project.linhadotempo.utils.CurrentUserProvider;

import java.time.LocalDateTime;
import java.util.*;

@Service
@RequiredArgsConstructor
public class ActivityService {

    private final QuestionService questionService;
    private final ActivityMapper activityMapper;
    private final AnswerService answerService;
    private final UserAnswerService userAnswerService;
    private final ActivityResultService activityResultService;
    private final CurrentUserProvider currentUserProvider;
    private final ActivityQueryService activityQueryService;
    private final UserUnitProgressService userUnitProgressService;
    private final ActivityRepository activityRepository;
    private final UnitService unitService;
    private final ActivityUnitOfWork activityUnitOfWork;
    private final UserTimelineRepository userTimelineRepository;

    public Page<ActivityFullDTO> findActivitiesByTimeline(
            UUID timelineId,
            ActivityType type,
            Pageable pageable
    ) {
        Page<Activity> page = type != null
                ? activityRepository.findActivitiesByTimelineAndType(timelineId, type, pageable)
                : activityRepository.findActivitiesByTimeline(timelineId, pageable);

        return page.map(this::mapToFullDTO);
    }

    @Transactional
    public List<GenericResponseDTO> createFullActivitiesBatch(List<ActivityFullCreateDTO> dtos) {
        return dtos.stream()
                .map(this::createFullActivity)
                .toList();
    }

    @Transactional
    public GenericResponseDTO createFullActivity(
            ActivityFullCreateDTO dto
    ) {

        User user =
                currentUserProvider.getAuthenticatedUser();

        Activity activity =
                new Activity();

        activity.setTitle(dto.getTitle());

        activity.setType(dto.getType());

        activity.setMinimumScore(
                dto.getMinimumScore()
        );

        if (dto.getType() == ActivityType.FIXATION) {

            Unit unit =
                    activityUnitOfWork.unitRepository()
                            .findById(dto.getUnitId())
                            .orElseThrow(() ->
                                    new ResourceNotFoundException(
                                            "Não há unidade encontrada com o ID fornecido."
                                    )
                            );

            validateTimelineAccess(
                    unit.getHistoryEvent()
                            .getTimeline(),
                    user
            );

            activity.setUnit(unit);

        } else {

            HistoryEvent historyEvent =
                    activityUnitOfWork.historyEventRepository()
                            .findById(dto.getHistoryEventId())
                            .orElseThrow(() ->
                                    new ResourceNotFoundException(
                                            "Não há evento encontrado com o ID fornecido."
                                    )
                            );

            validateTimelineAccess(
                    historyEvent.getTimeline(),
                    user
            );

            activity.setHistoryEvent(
                    historyEvent
            );
        }

        activityUnitOfWork.activityRepository()
                .save(activity);

        for (QuestionCreateDTO questionDTO :
                dto.getQuestions()) {

            Question question =
                    new Question();

            question.setStatement(
                    questionDTO.getStatement()
            );

            question.setType(
                    questionDTO.getType()
            );

            question.setActivity(activity);

            activityUnitOfWork.questionRepository()
                    .save(question);

            for (AnswerCreateDTO answerDTO :
                    questionDTO.getAnswers()) {

                Answer answer =
                        new Answer();

                answer.setText(
                        answerDTO.getText()
                );

                answer.setIsCorrect(
                        answerDTO.getIsCorrect()
                );

                answer.setQuestion(question);

                activityUnitOfWork.answerRepository()
                        .save(answer);
            }
        }

        return new GenericResponseDTO(
                "Atividade cadastrada com sucesso!",
                activity.getId()
        );
    }

    public Page<TimelineEvaluationDTO> getEvaluationsByTimeline(
            UUID timelineId,
            Pageable pageable,
            User user
    ) {

        Page<TimelineEvaluationProjection> page =
                activityRepository.findEvaluationsByTimeline(timelineId, pageable);

        return page.map(projection -> {

            boolean available = isEventCompleted(
                    projection.getEventId(),
                    user
            );

            Optional<ActivityResult> existingResult =
                    activityResultService.findByUserAndActivity(
                            user.getId(),
                            projection.getActivityId()
                    );

            return activityMapper.toDTO(projection, available, existingResult);
        });
    }

    @Transactional
    public GenericResponseDTO updateFullActivity(
            UUID activityId,
            ActivityFullCreateDTO dto
    ) {

        User user =
                currentUserProvider.getAuthenticatedUser();

        Activity activity =
                activityUnitOfWork.activityRepository()
                        .findById(activityId)
                        .orElseThrow(() ->
                                new ResourceNotFoundException(
                                        "Não há atividade encontrada com o ID fornecido."
                                )
                        );

        if (dto.getType() == ActivityType.FIXATION) {

            Unit unit =
                    activityUnitOfWork.unitRepository()
                            .findById(dto.getUnitId())
                            .orElseThrow(() ->
                                    new ResourceNotFoundException(
                                            "Não há unidade encontrada com o ID fornecido."
                                    )
                            );

            validateTimelineAccess(
                    unit.getHistoryEvent()
                            .getTimeline(),
                    user
            );

            activity.setUnit(unit);

            activity.setHistoryEvent(null);

        } else {

            HistoryEvent historyEvent =
                    activityUnitOfWork.historyEventRepository()
                            .findById(dto.getHistoryEventId())
                            .orElseThrow(() ->
                                    new ResourceNotFoundException(
                                            "Não há evento encontrado com o ID fornecido."
                                    )
                            );

            validateTimelineAccess(
                    historyEvent.getTimeline(),
                    user
            );

            activity.setHistoryEvent(
                    historyEvent
            );

            activity.setUnit(null);
        }

        activity.setTitle(
                dto.getTitle()
        );

        activity.setType(
                dto.getType()
        );

        activity.setMinimumScore(
                dto.getMinimumScore()
        );

        List<Question> oldQuestions =
                activityUnitOfWork.questionRepository()
                        .findByActivityId(activity.getId());

        activityUnitOfWork.answerRepository()
                .deleteAllByQuestionIn(oldQuestions);

        activityUnitOfWork.questionRepository()
                .deleteAll(oldQuestions);

        for (QuestionCreateDTO questionDTO :
                dto.getQuestions()) {

            Question question =
                    new Question();

            question.setStatement(
                    questionDTO.getStatement()
            );

            question.setType(
                    questionDTO.getType()
            );

            question.setActivity(activity);

            activityUnitOfWork.questionRepository()
                    .save(question);

            for (AnswerCreateDTO answerDTO :
                    questionDTO.getAnswers()) {

                Answer answer =
                        new Answer();

                answer.setText(
                        answerDTO.getText()
                );

                answer.setIsCorrect(
                        answerDTO.getIsCorrect()
                );

                answer.setQuestion(question);

                activityUnitOfWork.answerRepository()
                        .save(answer);
            }
        }

        activityUnitOfWork.activityRepository()
                .save(activity);

        return new GenericResponseDTO(
                "As atividades foram atualizadas com sucesso!",
                activity.getId()
        );
    }

    private boolean isEventCompleted(UUID eventId, User user) {

        List<Unit> units = unitService.findByEvent(eventId);

        Map<UUID, UserUnitProgress> progressMap =
                userUnitProgressService.getProgressMapByEvent(user.getId(), eventId);

        return units.stream()
                .allMatch(unit ->
                        progressMap.containsKey(unit.getId()) &&
                                Boolean.TRUE.equals(
                                        progressMap.get(unit.getId()).getCompleted()
                                )
                );
    }

    @Transactional(readOnly = true)
    public ActivityDTO getActivity(UUID activityId) {
        User user = currentUserProvider.getAuthenticatedUser();
        Activity activity = activityQueryService.findById(activityId);

        if (activity.getType() == ActivityType.ASSESSMENT) {
            Optional<ActivityResult> existing = activityResultService
                    .findByUserAndActivity(user.getId(), activityId);
            if (existing.isPresent()) {
                ActivityResult r = existing.get();
                ActivityResultResponseDTO prev = new ActivityResultResponseDTO(
                        r.getScore(), r.getTotalQuestions(), r.getCorrectAnswers(), r.getApproved()
                );
                ActivityDTO dto = new ActivityDTO();
                dto.setId(activity.getId());
                dto.setTitle(activity.getTitle());
                dto.setType(activity.getType().name());
                dto.setQuestions(List.of());
                dto.setAlreadyCompleted(true);
                dto.setPreviousResult(prev);
                return dto;
            }
        }

        List<QuestionDTO> questions = questionService.findQuestionDTOsByActivity(activityId);

        questions.forEach(question -> {
            if (question.getAlternatives() != null) {
                List<AlternativeDTO> shuffled = new ArrayList<>(question.getAlternatives());
                Collections.shuffle(shuffled);
                question.setAlternatives(shuffled);
            }
        });

        ActivityDTO dto = new ActivityDTO();
        dto.setId(activity.getId());
        dto.setTitle(activity.getTitle());
        dto.setType(activity.getType().name());
        dto.setQuestions(questions);
        dto.setAlreadyCompleted(false);
        dto.setPreviousResult(null);
        return dto;
    }

    public List<ActivityDTO> getActivitiesByUnit(UUID unitId) {

        List<Activity> activities = activityQueryService.findByUnit(unitId);

        return activities.stream()
                .map(this::toDTO)
                .toList();
    }

    public List<ActivityDTO> getActivitiesByEvent(UUID eventId) {

        List<Activity> activities = activityQueryService.findByEvent(eventId);

        return activities.stream()
                .map(this::toDTO)
                .toList();
    }

    private ActivityDTO toDTO(Activity activity) {
        return new ActivityDTO(
                activity.getId(),
                activity.getTitle(),
                activity.getType().name(),
                List.of(),
                false,
                null
        );
    }

    @Transactional
    public AnswerResponseDTO answerQuestion(AnswerRequestDTO request) {

        User user = currentUserProvider.getAuthenticatedUser();

        Question question = questionService.findById(request.getQuestionId());

        Activity activity = question.getActivity();
        if (activity.getType() == ActivityType.ASSESSMENT) {
            activityResultService.findByUserAndActivity(user.getId(), activity.getId())
                    .ifPresent(r -> { throw new ConflictException("Esta avaliação já foi realizada."); });
            if (activity.getHistoryEvent() != null && !isEventCompleted(activity.getHistoryEvent().getId(), user)) {
                throw new UnauthorizedException("Complete todas as unidades do evento antes de realizar esta avaliação.");
            }
        }

        if (question.getType() == QuestionType.FILL_IN_THE_BLANK) {
            Answer correct = answerService.findCorrectByQuestion(question);
            String correctText = correct != null ? correct.getText() : "";
            boolean isCorrect = correctText.trim().equalsIgnoreCase(
                    request.getTypedAnswer() != null ? request.getTypedAnswer().trim() : ""
            );
            userAnswerService.saveAnswer(user, question, correct, isCorrect);
            return new AnswerResponseDTO(question.getId(), isCorrect, null, correctText, List.of());
        }

        Answer selected = answerService.findById(request.getSelectedAlternativeId());

        if (!selected.getQuestion().getId().equals(question.getId())) {
            throw new BadRequestException("Resposta não pertence à pergunta.");
        }

        boolean isCorrect = Boolean.TRUE.equals(selected.getIsCorrect());

        userAnswerService.saveAnswer(user, question, selected, isCorrect);

        Answer correct = answerService.findCorrectByQuestion(question);

        return new AnswerResponseDTO(
                question.getId(),
                isCorrect,
                correct != null ? correct.getId() : null,
                null,
                List.of()
        );
    }

    @Transactional
    public ActivityResultResponseDTO finishActivity(UUID activityId) {

        User user = currentUserProvider.getAuthenticatedUser();

        Activity activity = activityQueryService.findById(activityId);

        Timeline timeline = activity.getUnit() != null
                ? activity.getUnit().getHistoryEvent().getTimeline()
                : activity.getHistoryEvent() != null
                ? activity.getHistoryEvent().getTimeline()
                : null;

        if (timeline != null && !timeline.getUser().getId().equals(user.getId())) {
            boolean enrolled = userTimelineRepository
                    .existsByUserIdAndTimelineId(user.getId(), timeline.getId());
            if (!enrolled) {
                throw new UnauthorizedException("Você não está matriculado nesta linha do tempo.");
            }
        }

        if (activity.getType() == ActivityType.ASSESSMENT) {
            activityResultService.findByUserAndActivity(user.getId(), activityId)
                    .ifPresent(r -> { throw new RuntimeException("Esta avaliação já foi realizada."); });
            if (activity.getHistoryEvent() != null && !isEventCompleted(activity.getHistoryEvent().getId(), user)) {
                throw new UnauthorizedException("Complete todas as unidades do evento antes de realizar esta avaliação.");
            }
        }

        List<Question> questions = questionService.findByActivity(activityId);
        List<UserAnswer> answers = userAnswerService.findByUserAndActivity(user.getId(), activityId);

        if (answers.size() < questions.size()) {
            throw new RuntimeException("Nem todas as questões foram respondidas");
        }

        int total = questions.size();
        int correct = (int) answers.stream()
                .filter(UserAnswer::getIsCorrect)
                .count();

        int score = (int) ((correct * 100.0) / total);

        boolean approved = activity.getMinimumScore() == null
                || score >= activity.getMinimumScore();

        if (activity.getUnit() != null) {
            userUnitProgressService.markUnitAsCompleted(user, activity.getUnit());
        }

        activityResultService.saveResult(
                user,
                activity,
                score,
                total,
                correct,
                approved,
                LocalDateTime.now()
        );

        return new ActivityResultResponseDTO(
                score,
                total,
                correct,
                approved
        );
    }

    @Transactional(readOnly = true)
    public ActivityProgressDTO getProgress(UUID activityId) {
        User user = currentUserProvider.getAuthenticatedUser();

        List<Question> questions = questionService.findByActivity(activityId);
        List<UserAnswer> answers = userAnswerService.findByUserAndActivity(user.getId(), activityId);

        int totalQuestions = questions.size();
        int answeredQuestions = answers.size();

        double percentage = totalQuestions == 0
                ? 0.0
                : (answeredQuestions * 100.0) / totalQuestions;

        return new ActivityProgressDTO(
                totalQuestions,
                answeredQuestions,
                percentage
        );
    }

    private ActivityFullDTO mapToFullDTO(
            Activity activity
    ) {

        ActivityFullDTO dto =
                new ActivityFullDTO();

        dto.setId(activity.getId());
        dto.setTitle(activity.getTitle());
        dto.setType(activity.getType());
        dto.setMinimumScore(activity.getMinimumScore());

        if (activity.getUnit() != null) {
            dto.setUnitId(
                    activity.getUnit().getId()
            );
        }

        if (activity.getHistoryEvent() != null) {
            dto.setHistoryEventId(
                    activity.getHistoryEvent().getId()
            );
        }

        List<QuestionFullDTO> questions =
                activity.getQuestions()
                        .stream()
                        .map(question -> {

                            QuestionFullDTO questionDTO =
                                    new QuestionFullDTO();

                            questionDTO.setId(
                                    question.getId()
                            );

                            questionDTO.setStatement(
                                    question.getStatement()
                            );

                            questionDTO.setType(
                                    question.getType()
                            );

                            List<AnswerFullDTO> answers =
                                    question.getAnswers()
                                            .stream()
                                            .map(answer -> {

                                                AnswerFullDTO answerDTO =
                                                        new AnswerFullDTO();

                                                answerDTO.setId(
                                                        answer.getId()
                                                );

                                                answerDTO.setText(
                                                        answer.getText()
                                                );

                                                answerDTO.setIsCorrect(
                                                        answer.getIsCorrect()
                                                );

                                                return answerDTO;

                                            })
                                            .toList();

                            questionDTO.setAnswers(
                                    answers
                            );

                            return questionDTO;

                        })
                        .toList();

        dto.setQuestions(
                questions
        );

        return dto;
    }

    private void validateTimelineAccess(
            Timeline timeline,
            User user
    ) {

        if (!timeline.getUser()
                .getId()
                .equals(user.getId())) {

            throw new UnauthorizedException(
                    "Sem permissão para editar essa entidade."
            );
        }
    }
}