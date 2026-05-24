package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.linhadotempo.dtos.progress.ActivityResultDetailDTO;
import project.linhadotempo.dtos.progress.QuestionAnswerDetailDTO;
import project.linhadotempo.dtos.progress.StudentDetailedProgressDTO;
import project.linhadotempo.dtos.progress.StudentProgressSummaryDTO;
import project.linhadotempo.models.Answer;
import project.linhadotempo.models.UserAnswer;
import project.linhadotempo.enums.ActivityType;
import project.linhadotempo.exceptions.ResourceNotFoundException;
import project.linhadotempo.exceptions.UnauthorizedException;
import project.linhadotempo.models.ActivityResult;
import project.linhadotempo.models.Timeline;
import project.linhadotempo.models.User;
import project.linhadotempo.models.UserTimeline;
import project.linhadotempo.repositories.ActivityResultRepository;
import project.linhadotempo.repositories.TimelineRepository;
import project.linhadotempo.repositories.UserAnswerRepository;
import project.linhadotempo.repositories.UserTimelineRepository;
import project.linhadotempo.repositories.UserUnitProgressRepository;
import project.linhadotempo.utils.CurrentUserProvider;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class TeacherProgressService {

    private final CurrentUserProvider currentUserProvider;
    private final TimelineRepository timelineRepository;
    private final UserTimelineRepository userTimelineRepository;
    private final UserUnitProgressRepository userUnitProgressRepository;
    private final ActivityResultRepository activityResultRepository;
    private final UserAnswerRepository userAnswerRepository;

    @Transactional(readOnly = true)
    public Page<StudentProgressSummaryDTO> getStudentsSummary(UUID timelineId, Pageable pageable) {

        User teacher = currentUserProvider.getAuthenticatedUser();
        Timeline timeline = findTimelineAndValidateOwner(timelineId, teacher);

        long totalUnits = userUnitProgressRepository.countTotalUnitsByTimeline(timelineId);

        return userTimelineRepository
                .findByTimelineIdAndAcceptedTrue(timelineId, pageable)
                .map(ut -> toSummary(ut.getUser(), timeline, totalUnits));
    }

    @Transactional(readOnly = true)
    public StudentDetailedProgressDTO getStudentDetail(UUID timelineId, UUID studentId) {

        User teacher = currentUserProvider.getAuthenticatedUser();
        findTimelineAndValidateOwner(timelineId, teacher);

        long totalUnits = userUnitProgressRepository.countTotalUnitsByTimeline(timelineId);
        long unitsCompleted = userUnitProgressRepository.countCompletedByUserAndTimeline(studentId, timelineId);

        List<ActivityResult> results = activityResultRepository.findByUserAndTimeline(studentId, timelineId);

        List<ActivityResultDetailDTO> fixation = toDetailList(results, ActivityType.FIXATION);
        List<ActivityResultDetailDTO> evaluative = toDetailList(results, ActivityType.EVALUATIVE);
        List<ActivityResultDetailDTO> assessment = toDetailList(results, ActivityType.ASSESSMENT);

        User student = results.isEmpty()
                ? userTimelineRepository
                        .findByTimelineIdAndUserIdAndAcceptedTrue(timelineId, studentId)
                        .map(UserTimeline::getUser)
                        .orElseThrow(() -> new ResourceNotFoundException("Estudante não encontrado nesta linha do tempo."))
                : results.get(0).getUser();

        return new StudentDetailedProgressDTO(
                student.getId(),
                student.getName(),
                student.getEmail(),
                unitsCompleted,
                totalUnits,
                fixation,
                evaluative,
                assessment
        );
    }

    private StudentProgressSummaryDTO toSummary(User student, Timeline timeline, long totalUnits) {

        UUID timelineId = timeline.getId();
        UUID studentId = student.getId();

        long unitsCompleted = userUnitProgressRepository
                .countCompletedByUserAndTimeline(studentId, timelineId);
        long activitiesApproved = activityResultRepository
                .countApprovedByUserAndTimeline(studentId, timelineId);
        long activitiesAttempted = activityResultRepository
                .countAttemptedByUserAndTimeline(studentId, timelineId);

        return new StudentProgressSummaryDTO(
                studentId,
                student.getName(),
                student.getEmail(),
                unitsCompleted,
                totalUnits,
                activitiesApproved,
                activitiesAttempted
        );
    }

    private List<ActivityResultDetailDTO> toDetailList(List<ActivityResult> results, ActivityType type) {
        return results.stream()
                .filter(r -> r.getActivity().getType() == type)
                .map(r -> {
                    List<QuestionAnswerDetailDTO> questions = type == ActivityType.ASSESSMENT
                            ? buildQuestionDetails(r.getUser().getId(), r.getActivity().getId())
                            : List.of();

                    return new ActivityResultDetailDTO(
                            r.getActivity().getId(),
                            r.getActivity().getTitle(),
                            type,
                            r.getScore(),
                            r.getCorrectAnswers(),
                            r.getTotalQuestions(),
                            r.getApproved(),
                            r.getCompletedAt(),
                            questions
                    );
                })
                .toList();
    }

    private List<QuestionAnswerDetailDTO> buildQuestionDetails(UUID studentId, UUID activityId) {
        List<UserAnswer> answers = userAnswerRepository.findByUserIdAndQuestionActivityId(studentId, activityId);
        return answers.stream().map(ua -> {
            String correctAnswer = ua.getQuestion().getAnswers().stream()
                    .filter(a -> Boolean.TRUE.equals(a.getIsCorrect()))
                    .map(Answer::getText)
                    .findFirst()
                    .orElse(null);

            String studentAnswer = ua.getAnswer() != null ? ua.getAnswer().getText() : null;

            return new QuestionAnswerDetailDTO(
                    ua.getQuestion().getStatement(),
                    studentAnswer,
                    correctAnswer,
                    ua.getIsCorrect()
            );
        }).toList();
    }

    private Timeline findTimelineAndValidateOwner(UUID timelineId, User teacher) {
        Timeline timeline = timelineRepository.findById(timelineId)
                .orElseThrow(() -> new ResourceNotFoundException("Linha do tempo não encontrada."));
        if (!timeline.getUser().getId().equals(teacher.getId())) {
            throw new UnauthorizedException("Você não possui acesso a esta linha do tempo.");
        }
        return timeline;
    }

}
