package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.dtos.HistoryEventDTO;
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

    public List<HistoryEventDTO> getAllEvents() {

        User user = currentUserProvider.getAuthenticatedUser();

        List<HistoryEventProjection> projections =
                historyEventRepository.findAllByOrderByStartYearAsc();

        List<HistoryEventDTO> result = new ArrayList<>();

        boolean previousCompleted = true;

        for (HistoryEventProjection projection : projections) {

            HistoryEventDTO dto = historyEventMapper.toDTO(projection);

            boolean unlocked = previousCompleted;

            boolean completed = userUnitProgressService
                    .isEventCompleted(user.getId(), projection.getId());

            if (!completed) {
                previousCompleted = false;
            }

            dto.setUnlocked(unlocked);

            result.add(dto);
        }

        return result;
    }
}