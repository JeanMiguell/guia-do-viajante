package project.linhadotempo.dtos.authentication;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import project.linhadotempo.enums.UserAvatar;
import project.linhadotempo.enums.UserGender;

import java.time.LocalDate;

@Getter
@Setter
public class RegisterRequestDTO {

    @NotBlank(message = "Nome é obrigatório")
    private String name;

    private LocalDate birthDate;

    private UserGender gender;

    @Email(message = "Email inválido")
    @NotBlank(message = "Email é obrigatório")
    private String email;

    @NotBlank(message = "Senha é obrigatória")
    private String password;

    private UserAvatar avatar;
}