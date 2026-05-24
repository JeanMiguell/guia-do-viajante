package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import project.linhadotempo.models.UserAnswer;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface UserAnswerRepository extends JpaRepository<UserAnswer, UUID> {

    List<UserAnswer> findByUserIdAndQuestionActivityId(UUID userId, UUID activityId);

    Optional<UserAnswer> findByUserIdAndQuestionId(UUID userId, UUID questionId);

    void deleteByQuestionActivityIdIn(List<UUID> activityIds);

    void deleteByQuestionActivityHistoryEventIdIn(List<UUID> eventIds);

@Query("""
    SELECT COUNT(ua)
    FROM UserAnswer ua
    JOIN ua.question q
    JOIN q.activity a
    WHERE ua.user.id = :userId
    AND a.unit.id = :unitId
    AND ua.isCorrect = true
    """)
    int countCorrectByUserAndUnit(UUID userId, UUID unitId);
}
