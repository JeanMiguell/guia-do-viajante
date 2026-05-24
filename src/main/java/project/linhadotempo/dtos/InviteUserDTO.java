package project.linhadotempo.dtos;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class InviteUserDTO {

    @NotNull(message = "A linha do tempo é obrigatória.")
    private UUID timelineId;

    @NotEmpty(message = "Selecione pelo menos um estudante.")
    private List<UUID> studentIds;
}
