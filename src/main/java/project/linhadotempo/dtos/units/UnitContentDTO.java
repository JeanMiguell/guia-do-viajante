package project.linhadotempo.dtos.units;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
public class UnitContentDTO {

    @Schema(example = "3fa85f64-5717-4562-b3fc-2c963f66afa6")
    private UUID id;

    @Schema(example = "Introdução")
    private String title;

    @Schema(example = "Em 1500, os portugueses chegaram ao Brasil...")
    private String content;

    @Schema(example = "https://image-url.com")
    private String imageUrl;

    @Schema(example = "1")
    private Integer pageOrder;

    private String hint;
}
