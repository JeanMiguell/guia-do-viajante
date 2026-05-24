package project.linhadotempo.dtos.units;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UnitCreateDTO {

    private String title;
    private String description;
    private Integer orderIndex;

}
