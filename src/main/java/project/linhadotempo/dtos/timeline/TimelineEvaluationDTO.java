package project.linhadotempo.dtos.timeline;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TimelineEvaluationDTO {

    private UUID activityId;
    private String activityName;
    private String unitName;
    private Boolean available;
    private String imageUrl;
    private Integer minimumScore;
    private Integer questionCount;
    private Boolean alreadyCompleted;
    private Integer previousScore;
    private Boolean previousApproved;
}
