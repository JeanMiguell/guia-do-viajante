package project.linhadotempo.dtos.questions;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
    private List<AssociationItemDTO> associations;
}