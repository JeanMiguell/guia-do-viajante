package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.dtos.units.UnitDTO;
import project.linhadotempo.exceptions.ResourceNotFoundException;
import project.linhadotempo.mappers.UnitMapper;
import project.linhadotempo.models.Unit;
import project.linhadotempo.models.UserUnitProgress;
import project.linhadotempo.projections.UnitProjection;
import project.linhadotempo.repositories.UnitRepository;
import project.linhadotempo.utils.CurrentUserProvider;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UnitService {

    private final UnitRepository unitRepository;
    private final UnitMapper unitMapper;
    private final CurrentUserProvider currentUserProvider;
    private final UserUnitProgressService userUnitProgressService;

    public List<UnitDTO> getUnitsByEvent(UUID eventId) {

        UUID userId = currentUserProvider.getAuthenticatedUser().getId();

        List<Unit> units = unitRepository
                .findByHistoryEventIdOrderByOrderIndexAsc(eventId);

        Map<UUID, UserUnitProgress> progressMap =
                userUnitProgressService.getProgressMapByEvent(userId, eventId);

        List<UnitDTO> result = new ArrayList<>();

        for (int i = 0; i < units.size(); i++) {

            Unit unit = units.get(i);

            boolean unlocked;

            if (i == 0) {
                unlocked = true;
            } else {
                Unit previousUnit = units.get(i - 1);
                UserUnitProgress prevProgress = progressMap.get(previousUnit.getId());

                unlocked = prevProgress != null && Boolean.TRUE.equals(prevProgress.getCompleted());
            }

            UnitDTO dto = unitMapper.entityToDTO(unit);
            dto.setUnlocked(unlocked);

            result.add(dto);
        }

        return result;
    }

    public UnitDTO getUnitById(UUID unitId) {

        UnitProjection projection = unitRepository
                .findUnitById(unitId)
                .orElseThrow(() -> new ResourceNotFoundException("Unidade não encontrada"));

        return unitMapper.toDTO(projection);
    }
}