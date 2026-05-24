package project.linhadotempo.dtos.questions;

import lombok.*;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AnswerRequestDTO {

    private UUID questionId;

    private UUID selectedAlternativeId;

    private String typedAnswer;
}
