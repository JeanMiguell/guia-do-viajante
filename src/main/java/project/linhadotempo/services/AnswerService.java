package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.dtos.questions.AlternativeDTO;
import project.linhadotempo.models.Answer;
import project.linhadotempo.models.Question;
import project.linhadotempo.repositories.AnswerRepository;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AnswerService {

    private final AnswerRepository answerRepository;

    public Answer findById(UUID id) {
        return answerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Resposta não encontrada"));
    }

    public Answer findCorrectByQuestion(Question question) {
        return question.getAnswers()
                .stream()
                .filter(a -> Boolean.TRUE.equals(a.getIsCorrect()))
                .findFirst()
                .orElse(null);
    }

    public AlternativeDTO toDTO(Answer answer) {
        return new AlternativeDTO(
                answer.getId(),
                answer.getText()
        );
    }

    public List<AlternativeDTO> toDTOList(List<Answer> answers) {
        return answers.stream()
                .map(this::toDTO)
                .toList();
    }
}