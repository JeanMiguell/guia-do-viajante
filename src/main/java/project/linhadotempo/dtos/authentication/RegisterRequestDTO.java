package project.linhadotempo.dtos.authentication;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import project.linhadotempo.enums.UserGender;
import project.linhadotempo.enums.UserType;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
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

    private String avatar;

    @NotNull(message = "O campo de tipo de usuário é obrigatório")
    private UserType userType;
}