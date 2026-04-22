package project.linhadotempo.dtos.units;

import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
public class UnitDTO {

    private UUID id;
    private UUID eventId;
    private String title;
    private String description;
    private Integer orderIndex;
    private boolean unlocked;
}