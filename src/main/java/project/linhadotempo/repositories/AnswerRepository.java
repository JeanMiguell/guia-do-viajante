package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import project.linhadotempo.models.Answer;
import project.linhadotempo.models.Question;

import java.util.List;
import java.util.UUID;

public interface AnswerRepository extends JpaRepository<Answer, UUID> {

    void deleteAllByQuestionIn(
            List<Question> questions
    );
}
