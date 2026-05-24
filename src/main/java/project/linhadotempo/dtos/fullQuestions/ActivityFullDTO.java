package project.linhadotempo.dtos.fullQuestions;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import project.linhadotempo.enums.ActivityType;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ActivityFullDTO {

    private UUID id;

    private String title;

    private ActivityType type;

    private Integer minimumScore;

    private UUID unitId;

    private UUID historyEventId;

    private List<QuestionFullDTO> questions;
}
