package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.dtos.units.EventResultDTO;
import project.linhadotempo.dtos.units.UnitResultDTO;
import project.linhadotempo.models.Activity;
import project.linhadotempo.models.ActivityResult;
import project.linhadotempo.models.Unit;
import project.linhadotempo.models.User;
import project.linhadotempo.models.UserUnitProgress;
import project.linhadotempo.projections.HistoryEventProjection;
import project.linhadotempo.repositories.ActivityResultRepository;
import project.linhadotempo.utils.CurrentUserProvider;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ActivityResultService {

    private final ActivityResultRepository repository;
    private final HistoryEventService eventService;
    private final UnitService unitService;
    private final UserUnitProgressService progressService;
    private final QuestionService questionService;
    private final UserAnswerService userAnswerService;
    private final CurrentUserProvider currentUserProvider;

    public List<EventResultDTO> getUserResults() {

        User user = currentUserProvider.getAuthenticatedUser();

        List<HistoryEventProjection> events = eventService.findAllOrdered();

        return events.stream().map(event -> {

            List<Unit> units = unitService.findByEvent(event.getId());

            Map<UUID, UserUnitProgress> progressMap =
                    progressService.getProgressMapByEvent(user.getId(), event.getId());

            List<UnitResultDTO> unitResults = units.stream().map(unit -> {

                UserUnitProgress progress = progressMap.get(unit.getId());

                int total = questionService.countByUnit(unit.getId());
                int correct = userAnswerService.countCorrectByUnit(user.getId(), unit.getId());

                String status;

                if (progress == null) {
                    status = "PENDING";
                } else if (Boolean.TRUE.equals(progress.getCompleted())) {
                    status = "COMPLETED";
                } else {
                    status = "IN_PROGRESS";
                }

                return new UnitResultDTO(
                        unit.getId(),
                        unit.getTitle(),
                        status,
                        correct,
                        total
                );

            }).toList();

            return new EventResultDTO(
                    event.getId(),
                    event.getName(),
                    unitResults
            );

        }).toList();
    }

    public void saveResult(
            User user,
            Activity activity,
            int score,
            int total,
            int correct,
            boolean approved,
            LocalDateTime completedAt
    ) {

        ActivityResult result = new ActivityResult();
        result.setUser(user);
        result.setActivity(activity);
        result.setScore(score);
        result.setTotalQuestions(total);
        result.setCorrectAnswers(correct);
        result.setApproved(approved);
        result.setCompletedAt(completedAt);

        repository.save(result);
    }
}
