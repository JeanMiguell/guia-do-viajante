package project.linhadotempo.dtos.fullTimeline;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UnitContentCreateDTO {

    private UUID id;

    private String title;

    @NotBlank
    private String content;

    private String imageUrl;

    @NotNull
    private Integer pageOrder;

    @NotBlank
    private String hint;

    private String layout;
}
