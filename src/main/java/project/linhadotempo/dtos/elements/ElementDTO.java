package project.linhadotempo.dtos.elements;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
public class ElementDTO {

    private UUID id;
    private String title;
    private String description;
    private Float posX;
    private Float posY;
}