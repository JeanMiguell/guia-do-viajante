package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.models.Activity;
import project.linhadotempo.models.ActivityResult;
import project.linhadotempo.models.User;
import project.linhadotempo.repositories.ActivityResultRepository;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class ActivityResultService {

    private final ActivityResultRepository repository;

    public void saveResult(
            User user,
            Activity activity,
            int score,
            int total,
            int correct,
            boolean approved,
            LocalDateTime completedAt
    ) {

        ActivityResult result = new ActivityResult();
        result.setUser(user);
        result.setActivity(activity);
        result.setScore(score);
        result.setTotalQuestions(total);
        result.setCorrectAnswers(correct);
        result.setApproved(approved);
        result.setCompletedAt(completedAt);

        repository.save(result);
    }
}
