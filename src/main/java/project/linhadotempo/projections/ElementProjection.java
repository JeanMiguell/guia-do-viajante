package project.linhadotempo.projections;

import java.util.UUID;

public interface ElementProjection {

    UUID getId();
    String getTitle();
    String getDescription();
    Float getPosX();
    Float getPosY();
}
