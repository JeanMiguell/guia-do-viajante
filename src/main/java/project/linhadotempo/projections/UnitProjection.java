package project.linhadotempo.projections;

import java.util.UUID;

public interface UnitProjection {

    UUID getId();
    UUID getEventId();
    String getTitle();
    String getDescription();
    Integer getOrderIndex();
    boolean getUnlocked();
}