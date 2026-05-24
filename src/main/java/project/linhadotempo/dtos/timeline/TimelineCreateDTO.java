package project.linhadotempo.dtos.timeline;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import project.linhadotempo.enums.TimelineVisibility;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TimelineCreateDTO {

    @NotBlank(message = "O nome da linha do tempo é obrigatório.")
    private String name;

    @NotBlank(message = "A descrição da linha do tempo é obrigatória.")
    private String description;

    private String imageUrl;

    @NotNull(message = "A visibilidade da linha do tempo é obrigatória.")
    private TimelineVisibility visibility;
}