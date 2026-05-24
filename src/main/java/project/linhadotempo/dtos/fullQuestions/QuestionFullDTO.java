package project.linhadotempo.dtos.fullQuestions;

import lombok.Getter;
import lombok.Setter;
import project.linhadotempo.enums.QuestionType;

import java.util.List;
import java.util.UUID;

@Setter
@Getter
public class QuestionFullDTO {

    private UUID id;

    private String statement;

    private QuestionType type;

    private List<AnswerFullDTO> answers;
}
