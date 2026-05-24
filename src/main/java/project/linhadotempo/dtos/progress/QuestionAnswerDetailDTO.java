package project.linhadotempo.dtos.progress;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class QuestionAnswerDetailDTO {

    private String questionStatement;
    private String studentAnswer;
    private String correctAnswer;
    private Boolean correct;
}
