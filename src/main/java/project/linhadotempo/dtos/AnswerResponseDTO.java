package project.linhadotempo.dtos;

import lombok.*;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AnswerResponseDTO {

    private UUID questionId;

    private boolean isCorrect;

    private UUID correctAlternativeId;

    private List<String> unlockedAchievements;
}
