package project.linhadotempo.projections;

import java.util.UUID;

public interface TimelineEvaluationProjection {

    UUID getActivityId();
    String getActivityName();
    String getUnitName();
    UUID getEventId();
    String getImageUrl();
    Integer getMinimumScore();
    Integer getQuestionCount();
}
