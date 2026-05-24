package project.linhadotempo.dtos.users;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import project.linhadotempo.enums.UserGender;
import project.linhadotempo.enums.UserType;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
public class CompleteProfileDTO {

    @NotNull(message = "Data de nascimento é obrigatória")
    private LocalDate birthDate;

    @NotNull(message = "Gênero é obrigatório")
    private UserGender gender;

    private String avatar;

    @NotNull(message = "Tipo de usuário é obrigatório")
    private UserType userType;
}
