package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.linhadotempo.dtos.ActivityProgressDTO;
import project.linhadotempo.dtos.AnswerResponseDTO;
import project.linhadotempo.dtos.questions.ActivityDTO;
import project.linhadotempo.dtos.questions.ActivityResultResponseDTO;
import project.linhadotempo.dtos.questions.AnswerRequestDTO;
import project.linhadotempo.dtos.questions.QuestionDTO;
import project.linhadotempo.models.*;
import project.linhadotempo.utils.CurrentUserProvider;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ActivityService {

    private final QuestionService questionService;
    private final AnswerService answerService;
    private final UserAnswerService userAnswerService;
    private final ActivityResultService activityResultService;
    private final CurrentUserProvider currentUserProvider;
    private final ActivityQueryService activityQueryService;
    private final UserUnitProgressService userUnitProgressService;

    @Transactional(readOnly = true)
    public ActivityDTO getActivity(UUID activityId) {
        Activity activity = activityQueryService.findById(activityId);

        List<QuestionDTO> questions = questionService.findQuestionDTOsByActivity(activityId);

        return new ActivityDTO(
                activity.getId(),
                activity.getTitle(),
                activity.getType().name(),
                questions
        );
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
                List.of() // aqui você pode ou não carregar perguntas
        );
    }

    @Transactional
    public AnswerResponseDTO answerQuestion(AnswerRequestDTO request) {

        User user = currentUserProvider.getAuthenticatedUser();

        Question question = questionService.findById(request.getQuestionId());
        Answer selected = answerService.findById(request.getSelectedAlternativeId());

        if (!selected.getQuestion().getId().equals(question.getId())) {
            throw new RuntimeException("Resposta não pertence à pergunta");
        }

        boolean isCorrect = Boolean.TRUE.equals(selected.getIsCorrect());

        userAnswerService.saveAnswer(user, question, selected, isCorrect);

        Answer correct = answerService.findCorrectByQuestion(question);

        return new AnswerResponseDTO(
                question.getId(),
                isCorrect,
                correct != null ? correct.getId() : null,
                List.of()
        );
    }

    @Transactional
    public ActivityResultResponseDTO finishActivity(UUID activityId) {

        User user = currentUserProvider.getAuthenticatedUser();

        Activity activity = activityQueryService.findById(activityId);

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

        Unit unit = activity.getUnit();

        userUnitProgressService.markUnitAsCompleted(user, unit);

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
}