package project.linhadotempo.mappers;

import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;
import project.linhadotempo.dtos.HistoryEventDTO;
import project.linhadotempo.projections.HistoryEventProjection;

@Component
@RequiredArgsConstructor
public class HistoryEventMapper {

    private final ModelMapper modelMapper;

    public HistoryEventDTO toDTO(HistoryEventProjection projection) {
        return modelMapper.map(projection, HistoryEventDTO.class);
    }
}