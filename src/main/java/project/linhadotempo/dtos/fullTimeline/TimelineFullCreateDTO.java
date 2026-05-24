package project.linhadotempo.dtos.fullTimeline;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import project.linhadotempo.enums.TimelineVisibility;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TimelineFullCreateDTO {

    @NotBlank
    private String name;

    @NotBlank
    private String description;

    private String imageUrl;

    private TimelineVisibility visibility;

    @NotEmpty
    private List<HistoryEventCreateFullDTO> events;
}
