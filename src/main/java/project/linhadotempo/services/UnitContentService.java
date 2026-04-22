package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.dtos.units.UnitContentDTO;
import project.linhadotempo.mappers.UnitContentMapper;
import project.linhadotempo.projections.UnitContentProjection;
import project.linhadotempo.repositories.UnitContentRepository;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UnitContentService {

    private final UnitContentRepository unitContentRepository;
    private final UnitContentMapper unitContentMapper;

    public List<UnitContentDTO> getContentsByUnit(UUID unitId) {

        List<UnitContentProjection> projections =
                unitContentRepository.findContentsByUnitId(unitId);

        return projections.stream()
                .map(unitContentMapper::toDTO)
                .toList();
    }
}
