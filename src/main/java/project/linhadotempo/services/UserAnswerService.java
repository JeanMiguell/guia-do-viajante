package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.models.Answer;
import project.linhadotempo.models.Question;
import project.linhadotempo.models.User;
import project.linhadotempo.models.UserAnswer;
import project.linhadotempo.repositories.UserAnswerRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UserAnswerService {

    private final UserAnswerRepository repository;

    public void saveAnswer(User user, Question question, Answer answer, boolean isCorrect) {

        Optional<UserAnswer> existing =
                repository.findByUserIdAndQuestionId(user.getId(), question.getId());

        if (existing.isPresent()) {
            UserAnswer entity = existing.get();
            entity.setAnswer(answer);
            entity.setIsCorrect(isCorrect);

            repository.save(entity);

        } else {
            UserAnswer entity = new UserAnswer();
            entity.setUser(user);
            entity.setQuestion(question);
            entity.setAnswer(answer);
            entity.setIsCorrect(isCorrect);

            repository.save(entity);
        }
    }

    public List<UserAnswer> findByUserAndActivity(UUID userId, UUID activityId) {
        return repository.findByUserIdAndQuestionActivityId(userId, activityId);
    }
}
