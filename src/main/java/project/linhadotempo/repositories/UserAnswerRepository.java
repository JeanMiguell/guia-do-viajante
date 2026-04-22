package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import project.linhadotempo.models.UserAnswer;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface UserAnswerRepository extends JpaRepository<UserAnswer, UUID> {

    List<UserAnswer> findByUserIdAndQuestionActivityId(UUID userId, UUID activityId);

    Optional<UserAnswer> findByUserIdAndQuestionId(UUID userId, UUID questionId);
}
