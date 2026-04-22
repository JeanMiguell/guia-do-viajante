package project.linhadotempo.dtos.questions;

import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AnswerRequestDTO {

    @NotNull(message = "O id da questão é obrigatório!")
    private UUID questionId;

    @NotNull(message = "O id da alternativa escolhida é obrigatório!")
    private UUID selectedAlternativeId;
}
