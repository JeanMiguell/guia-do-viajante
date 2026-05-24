package project.linhadotempo.projections;

import project.linhadotempo.enums.UserGender;
import project.linhadotempo.enums.UserType;

import java.time.LocalDate;
import java.util.UUID;

public interface UserProjection {

    UUID getId();
    String getName();
    String getEmail();
    LocalDate getBirthdate();
    String getAvatar();
    UserGender getGender();
    UserType getType();
    Boolean getAdditionalDataCompleted();

}