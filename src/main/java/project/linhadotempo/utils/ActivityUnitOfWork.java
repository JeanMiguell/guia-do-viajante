package project.linhadotempo.utils;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import project.linhadotempo.repositories.ActivityRepository;
import project.linhadotempo.repositories.AnswerRepository;
import project.linhadotempo.repositories.HistoryEventRepository;
import project.linhadotempo.repositories.QuestionRepository;
import project.linhadotempo.repositories.UnitRepository;

@Component
@RequiredArgsConstructor
public class ActivityUnitOfWork {

    private final ActivityRepository activityRepository;

    private final QuestionRepository questionRepository;

    private final AnswerRepository answerRepository;

    private final UnitRepository unitRepository;

    private final HistoryEventRepository historyEventRepository;

    public ActivityRepository activityRepository() {
        return activityRepository;
    }

    public QuestionRepository questionRepository() {
        return questionRepository;
    }

    public AnswerRepository answerRepository() {
        return answerRepository;
    }

    public UnitRepository unitRepository() {
        return unitRepository;
    }

    public HistoryEventRepository historyEventRepository() {
        return historyEventRepository;
    }
}