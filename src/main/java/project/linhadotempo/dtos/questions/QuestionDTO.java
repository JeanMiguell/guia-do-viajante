package project.linhadotempo.dtos.questions;

import lombok.*;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class QuestionDTO {

    private UUID id;
    private String questionText;
    private String questionType;

    private List<AlternativeDTO> alternatives;
}