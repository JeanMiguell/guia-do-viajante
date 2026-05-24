package project.linhadotempo.dtos.fullTimeline;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HistoryEventFullDTO {

    private UUID id;

    private String name;

    private String description;

    private LocalDate startYear;

    private LocalDate endYear;

    private String periodDescription;

    private String eventType;

    private String introText;

    private String imageUrl;

    private List<UnitFullDTO> units;
}
