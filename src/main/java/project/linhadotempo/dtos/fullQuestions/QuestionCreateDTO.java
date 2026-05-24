package project.linhadotempo.dtos.fullQuestions;

import lombok.Getter;
import lombok.Setter;
import project.linhadotempo.enums.QuestionType;

import java.util.List;

@Getter
@Setter
public class QuestionCreateDTO {

    private String statement;

    private QuestionType type;

    private List<AnswerCreateDTO> answers;
}
