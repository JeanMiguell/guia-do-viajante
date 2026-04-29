package project.linhadotempo.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TimelineDTO {

    private List<HistoryEventDTO> events;

    private Integer totalEvents;
    private Integer unlockedEvents;
    private Integer completedEvents;

    private Double progressPercentage;
}
