package project.linhadotempo.dtos.fullTimeline;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
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
public class HistoryEventCreateFullDTO {

    private UUID id;

    @NotBlank
    private String name;

    @NotBlank
    private String description;

    private LocalDate startYear;

    private LocalDate endYear;

    private String periodDescription;

    private String eventType;

    @NotBlank
    private String introText;

    private String imageUrl;

    @NotEmpty
    private List<UnitCreateFullDTO> units;
}
