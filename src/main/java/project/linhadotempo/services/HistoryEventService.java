package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.dtos.HistoryEventDTO;
import project.linhadotempo.dtos.TimelineDTO;
import project.linhadotempo.mappers.HistoryEventMapper;
import project.linhadotempo.models.User;
import project.linhadotempo.projections.HistoryEventProjection;
import project.linhadotempo.repositories.HistoryEventRepository;
import project.linhadotempo.utils.CurrentUserProvider;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class HistoryEventService {

    private final HistoryEventRepository historyEventRepository;
    private final HistoryEventMapper historyEventMapper;
    private final UserUnitProgressService userUnitProgressService;
    private final CurrentUserProvider currentUserProvider;

    public List<HistoryEventProjection> findAllOrdered() {
        return historyEventRepository.findAllByOrderByStartYearAsc();
    }

    public TimelineDTO getAllEvents() {

        User user = currentUserProvider.getAuthenticatedUser();

        List<HistoryEventProjection> projections =
                historyEventRepository.findAllByOrderByStartYearAsc();

        List<HistoryEventDTO> events = new ArrayList<>();

        boolean previousCompleted = true;

        int unlockedCount = 0;
        int completedCount = 0;

        for (HistoryEventProjection projection : projections) {

            HistoryEventDTO dto = historyEventMapper.toDTO(projection);

            boolean unlocked = previousCompleted;

            boolean completed = userUnitProgressService
                    .isEventCompleted(user.getId(), projection.getId());

            if (unlocked) {
                unlockedCount++;
            }

            if (completed) {
                completedCount++;
            } else {
                previousCompleted = false;
            }

            dto.setUnlocked(unlocked);

            events.add(dto);
        }

        int total = projections.size();

        double percentage = total == 0
                ? 0
                : (completedCount * 100.0) / total;

        return new TimelineDTO(
                events,
                total,
                unlockedCount,
                completedCount,
                percentage
        );
    }
}