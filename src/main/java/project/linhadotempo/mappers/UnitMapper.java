package project.linhadotempo.mappers;

import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;
import project.linhadotempo.dtos.units.UnitDTO;
import project.linhadotempo.models.Unit;
import project.linhadotempo.projections.UnitProjection;

@Component
@RequiredArgsConstructor
public class UnitMapper {

    private final ModelMapper modelMapper;

    public UnitDTO toDTO(UnitProjection projection) {
        return modelMapper.map(projection, UnitDTO.class);
    }

    public UnitDTO entityToDTO(Unit unit) {
        return modelMapper.map(unit, UnitDTO.class);
    }
}