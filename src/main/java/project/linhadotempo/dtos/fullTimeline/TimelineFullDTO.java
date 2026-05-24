package project.linhadotempo.dtos.fullTimeline;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import project.linhadotempo.enums.TimelineVisibility;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TimelineFullDTO {

    private UUID id;

    private String name;

    private String description;

    private String imageUrl;

    private TimelineVisibility visibility;

    private List<HistoryEventFullDTO> events;
}
