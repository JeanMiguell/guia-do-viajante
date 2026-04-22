package project.linhadotempo.dtos;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
public class HistoryEventDTO {

    private UUID id;

    private String name;

    private String description;

    private LocalDate startYear;

    private LocalDate endYear;

    private String periodDescription;

    private String eventType;

    private String introText;

    private Boolean unlocked;
}
