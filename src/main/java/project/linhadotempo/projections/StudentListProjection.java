package project.linhadotempo.projections;

import java.util.UUID;

public interface StudentListProjection {

    UUID getId();
    String getName();
    String getEmail();
    Boolean getAlreadyInvited();
}
