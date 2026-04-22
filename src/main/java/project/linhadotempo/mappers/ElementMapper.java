package project.linhadotempo.mappers;

import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;
import project.linhadotempo.dtos.elements.ElementDTO;
import project.linhadotempo.projections.ElementProjection;

@Component
@RequiredArgsConstructor
public class ElementMapper {

    private final ModelMapper modelMapper;

    public ElementDTO toDTO(ElementProjection projection) {
        return modelMapper.map(projection, ElementDTO.class);
    }
}