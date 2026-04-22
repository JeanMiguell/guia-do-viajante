package project.linhadotempo.dtos.users;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import project.linhadotempo.enums.UserGender;

import java.time.LocalDate;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
public class UserDTO {

    private UUID id;
    private String name;
    private String email;
    private LocalDate birthdate;
    private String avatar;
    private UserGender gender;

}
