package project.linhadotempo.dtos.progress;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import project.linhadotempo.enums.ActivityType;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ActivityResultDetailDTO {

    private UUID activityId;
    private String activityTitle;
    private ActivityType type;
    private Integer score;
    private Integer correctAnswers;
    private Integer totalQuestions;
    private Boolean approved;
    private LocalDateTime completedAt;
    private List<QuestionAnswerDetailDTO> questions;
}
