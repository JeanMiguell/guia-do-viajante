package project.linhadotempo.dtos.events;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HistoryEventCreateDTO {

    @NotBlank(message = "O nome do evento é obrigatório.")
    private String name;

    @NotBlank(message = "A descrição do evento é obrigatória.")
    private String description;

    private LocalDate startYear;

    private LocalDate endYear;

    private String periodDescription;

    private String eventType;

    @NotBlank(message = "O texto introdutório é obrigatório.")
    private String introText;

    private String imageUrl;
}
