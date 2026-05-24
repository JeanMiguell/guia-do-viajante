package project.linhadotempo.dtos.fullQuestions;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AnswerCreateDTO {

    private String text;

    private Boolean isCorrect;
}