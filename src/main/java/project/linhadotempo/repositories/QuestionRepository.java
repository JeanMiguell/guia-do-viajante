package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import project.linhadotempo.models.Question;

import java.util.List;
import java.util.UUID;

public interface QuestionRepository extends JpaRepository<Question, UUID> {

    List<Question> findByActivityId(UUID activityId);

    @Query("""
    SELECT COUNT(q)
    FROM Question q
    JOIN q.activity a
    WHERE a.unit.id = :unitId
    """)
    int countByUnitId(UUID unitId);
}