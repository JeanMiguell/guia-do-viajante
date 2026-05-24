package project.linhadotempo.dtos.fullQuestions;

import lombok.Getter;
import lombok.Setter;
import project.linhadotempo.enums.ActivityType;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class ActivityFullCreateDTO {

    private ActivityType type;

    private String title;

    private Integer minimumScore;

    private UUID unitId;

    private UUID historyEventId;

    private List<QuestionCreateDTO> questions;
}
