package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import project.linhadotempo.models.Unit;
import project.linhadotempo.models.UserUnitProgress;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface UserUnitProgressRepository extends JpaRepository<UserUnitProgress, UUID> {

    Optional<UserUnitProgress> findByUserIdAndUnitId(UUID userId, UUID unitId);

    @Query("""
    SELECT COUNT(u) = COUNT(p)
    FROM Unit u
    LEFT JOIN UserUnitProgress p 
        ON p.unit.id = u.id 
        AND p.user.id = :userId
        AND p.completed = true
    WHERE u.historyEvent.id = :eventId
""")
    boolean isEventCompleted(UUID userId, UUID eventId);

    @Query("""
    SELECT p FROM UserUnitProgress p
    WHERE p.user.id = :userId
    AND p.unit.historyEvent.id = :eventId
""")
    List<UserUnitProgress> findByUserIdAndUnitEventId(UUID userId, UUID eventId);

    void deleteByUnitIn(List<Unit> units);

    @Query("""
        SELECT COUNT(p) FROM UserUnitProgress p
        WHERE p.user.id = :userId
        AND p.unit.historyEvent.timeline.id = :timelineId
        AND p.completed = true
    """)
    long countCompletedByUserAndTimeline(UUID userId, UUID timelineId);

    @Query("""
        SELECT COUNT(u) FROM Unit u
        WHERE u.historyEvent.timeline.id = :timelineId
    """)
    long countTotalUnitsByTimeline(UUID timelineId);
}
