package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.dtos.questions.QuestionDTO;
import project.linhadotempo.models.Question;
import project.linhadotempo.repositories.QuestionRepository;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class QuestionService {

    private final QuestionRepository questionRepository;
    private final AnswerService answerService;

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
        return new QuestionDTO(
                question.getId(),
                question.getStatement(),
                question.getType().name(),
                answerService.toDTOList(question.getAnswers())
        );
    }
}
