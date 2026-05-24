package project.linhadotempo.mappers;

import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;
import project.linhadotempo.dtos.events.HistoryEventCreateDTO;
import project.linhadotempo.dtos.events.HistoryEventDTO;
import project.linhadotempo.models.HistoryEvent;
import project.linhadotempo.projections.HistoryEventProjection;

@Component
@RequiredArgsConstructor
public class HistoryEventMapper {

    private final ModelMapper modelMapper;

    public HistoryEventDTO toDTO(HistoryEventProjection projection) {
        return modelMapper.map(projection, HistoryEventDTO.class);
    }

    public HistoryEvent toEntity(HistoryEventCreateDTO dto) {
        return modelMapper.map(dto, HistoryEvent.class);
    }

    public HistoryEventDTO toResponseDTO(HistoryEvent historyEvent
    ) {
        return modelMapper.map(historyEvent, HistoryEventDTO.class
        );
    }

    public void updateEntityFromDTO(
            HistoryEventCreateDTO dto,
            HistoryEvent entity
    ) {

        entity.setName(dto.getName());
        entity.setDescription(dto.getDescription());
        entity.setStartYear(dto.getStartYear());
        entity.setEndYear(dto.getEndYear());
        entity.setPeriodDescription(dto.getPeriodDescription());
        entity.setEventType(dto.getEventType());
        entity.setIntroText(dto.getIntroText());
        entity.setImageUrl(dto.getImageUrl());
    }
}