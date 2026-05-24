package project.linhadotempo.dtos.fullTimeline;

import jakarta.validation.constraints.NotBlank;
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
public class UnitCreateFullDTO {

    private UUID id;

    @NotBlank
    private String title;

    private String description;

    @NotNull
    private Integer orderIndex;

    @NotEmpty
    private List<UnitContentCreateDTO> contents;
}
