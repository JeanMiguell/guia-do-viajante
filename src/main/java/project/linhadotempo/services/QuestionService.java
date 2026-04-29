package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.dtos.questions.AssociationItemDTO;
import project.linhadotempo.dtos.questions.QuestionDTO;
import project.linhadotempo.enums.QuestionType;
import project.linhadotempo.models.Question;
import project.linhadotempo.repositories.QuestionRepository;

import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class QuestionService {

    private final QuestionRepository questionRepository;
    private final AnswerService answerService;

    public int countByUnit(UUID unitId) {
        return questionRepository.countByUnitId(unitId);
    }

    public Question findById(UUID id) {
        return questionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Pergunta não encontrada"));
    }

    public List<Question> findByActivity(UUID activityId) {
        return questionRepository.findByActivityId(activityId);
    }

    public List<QuestionDTO> findQuestionDTOsByActivity(UUID activityId) {
        List<Question> questions = questionRepository.findByActivityId(activityId);

        return questions.stream()
                .map(this::toDTO)
                .toList();
    }

    private QuestionDTO toDTO(Question question) {

        QuestionDTO dto = new QuestionDTO(
                question.getId(),
                question.getStatement(),
                question.getType().name(),
                null,
                null
        );

        if (question.getType() == QuestionType.ASSOCIATION) {

            List<AssociationItemDTO> associations = question.getAnswers().stream()
                    .map(answer -> {

                        String text = answer.getText();String[] parts;

                        if (text.contains("|")) {
                            parts = text.split("\\|");
                        } else if (text.contains("->")) {
                            parts = text.split("->");
                        } else {
                            throw new RuntimeException(
                                    "Formato inválido de associação: " + text
                            );
                        }

                        if (parts.length < 2) {
                            throw new RuntimeException(
                                    "Associação mal formada: " + text
                            );
                        }

                        AssociationItemDTO item = new AssociationItemDTO();
                        item.setLeft(parts[0].trim());
                        item.setRight(parts[1].trim());

                        return item;
                    })
                    .toList();
            
            List<String> rights = associations.stream()
                    .map(AssociationItemDTO::getRight)
                    .collect(Collectors.toList());

            Collections.shuffle(rights);

            for (int i = 0; i < associations.size(); i++) {
                associations.get(i).setRight(rights.get(i));
            }

            dto.setAssociations(associations);

        } else {
            dto.setAlternatives(
                    answerService.toDTOList(question.getAnswers())
            );
        }

        return dto;
    }
}
