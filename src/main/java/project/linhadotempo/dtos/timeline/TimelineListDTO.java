package project.linhadotempo.dtos.timeline;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TimelineListDTO {

    private UUID id;
    private UUID userId;
    private String name;
    private String imageUrl;
    private String description;
}
