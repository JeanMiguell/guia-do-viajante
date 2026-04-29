package project.linhadotempo.dtos.units;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UnitResultDTO {

    private UUID unitId;
    private String unitTitle;

    private String status;

    private Integer correctAnswers;
    private Integer totalQuestions;

}
