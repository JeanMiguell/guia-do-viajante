package project.linhadotempo.dtos.timeline;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import project.linhadotempo.dtos.events.HistoryEventDTO;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TimelineDTO {

    private UUID id;

    private List<HistoryEventDTO> events;

    private Integer totalEvents;
    private Integer unlockedEvents;
    private Integer completedEvents;

    private Double progressPercentage;
}
