package project.linhadotempo.mappers;

import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;
import project.linhadotempo.dtos.timeline.TimelineCreateDTO;
import project.linhadotempo.dtos.timeline.TimelineDTO;
import project.linhadotempo.dtos.timeline.TimelineListDTO;
import project.linhadotempo.models.Timeline;
import project.linhadotempo.projections.TimelineListProjection;

@Component
@RequiredArgsConstructor
public class TimelineMapper {

    private final ModelMapper mapper;

    public TimelineListDTO toDTO(TimelineListProjection projection) {
        return mapper.map(projection, TimelineListDTO.class);
    }

    public Timeline toEntity(TimelineCreateDTO dto) {
        return mapper.map(dto, Timeline.class);
    }

    public TimelineListDTO toResponseDTO(
            Timeline timeline
    ) {

        return mapper.map(
                timeline,
                TimelineListDTO.class
        );
    }

    public void updateEntityFromDTO(
            TimelineCreateDTO dto,
            Timeline timeline
    ) {

        timeline.setName(dto.getName());
        timeline.setDescription(dto.getDescription());
        timeline.setImageUrl(dto.getImageUrl());
        timeline.setVisibility(dto.getVisibility());
    }
}
