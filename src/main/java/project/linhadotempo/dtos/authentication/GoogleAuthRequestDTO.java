package project.linhadotempo.dtos.authentication;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoogleAuthRequestDTO {
    private String idToken;
    private String userType;
}
