package project.linhadotempo.dtos.questions;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ActivityResultResponseDTO {

    private Integer score;

    private Integer totalQuestions;

    private Integer correctAnswers;

    private Boolean approved;
}