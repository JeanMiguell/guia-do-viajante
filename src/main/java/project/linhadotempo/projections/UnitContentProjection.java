package project.linhadotempo.projections;

import java.util.UUID;

public interface UnitContentProjection {

    UUID getId();
    String getTitle();
    String getContent();
    String getImageUrl();
    Integer getPageOrder();
    String getHint();
}
