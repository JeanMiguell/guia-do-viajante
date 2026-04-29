package project.linhadotempo.dtos.units;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class EventResultDTO {

    private UUID eventId;
    private String eventName;

    private List<UnitResultDTO> units;

}
