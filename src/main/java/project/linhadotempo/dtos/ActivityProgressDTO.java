package project.linhadotempo.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ActivityProgressDTO {

    private int totalQuestions;
    private int answeredQuestions;
    private double percentage;
}
