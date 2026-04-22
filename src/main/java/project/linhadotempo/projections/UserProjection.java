package project.linhadotempo.projections;

import project.linhadotempo.enums.UserAvatar;
import project.linhadotempo.enums.UserGender;

import java.time.LocalDate;
import java.util.UUID;

public interface UserProjection {

    UUID getId();
    String getName();
    String getEmail();
    LocalDate getBirthdate();
    UserAvatar getAvatar();
    UserGender getGender();

}