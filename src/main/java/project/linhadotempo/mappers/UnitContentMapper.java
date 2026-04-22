package project.linhadotempo.mappers;

import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;
import project.linhadotempo.dtos.units.UnitContentDTO;
import project.linhadotempo.projections.UnitContentProjection;

@Component
@RequiredArgsConstructor
public class UnitContentMapper {

    private final ModelMapper modelMapper;

    public UnitContentDTO toDTO(UnitContentProjection projection) {
        return modelMapper.map(projection, UnitContentDTO.class);
    }
}