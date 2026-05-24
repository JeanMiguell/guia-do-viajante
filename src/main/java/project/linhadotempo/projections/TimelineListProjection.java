package project.linhadotempo.projections;

import java.util.UUID;

public interface TimelineListProjection {

    UUID getId();
    UUID getUserId();
    String getName();
    String getImageUrl();
    String getDescription();

}