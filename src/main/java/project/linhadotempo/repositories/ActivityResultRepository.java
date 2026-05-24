package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.linhadotempo.models.ActivityResult;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ActivityResultRepository extends JpaRepository<ActivityResult, UUID> {

    void deleteByActivityIdIn(List<UUID> activityIds);

    List<ActivityResult> findByActivityId(UUID activityId);

    Optional<ActivityResult> findByUserIdAndActivityId(UUID userId, UUID activityId);

    @Query("""
        SELECT ar FROM ActivityResult ar
        JOIN ar.activity a
        LEFT JOIN a.unit u
        LEFT JOIN u.historyEvent uhe
        LEFT JOIN uhe.timeline ut
        LEFT JOIN a.historyEvent ahe
        LEFT JOIN ahe.timeline at
        WHERE ar.user.id = :userId
        AND (ut.id = :timelineId OR at.id = :timelineId)
        ORDER BY a.type, ar.completedAt
    """)
    List<ActivityResult> findByUserAndTimeline(
            @Param("userId") UUID userId,
            @Param("timelineId") UUID timelineId
    );

    @Query("""
        SELECT COUNT(ar) FROM ActivityResult ar
        JOIN ar.activity a
        LEFT JOIN a.unit u
        LEFT JOIN u.historyEvent uhe
        LEFT JOIN uhe.timeline ut
        LEFT JOIN a.historyEvent ahe
        LEFT JOIN ahe.timeline at
        WHERE ar.user.id = :userId
        AND ar.approved = true
        AND (ut.id = :timelineId OR at.id = :timelineId)
    """)
    long countApprovedByUserAndTimeline(
            @Param("userId") UUID userId,
            @Param("timelineId") UUID timelineId
    );

    @Query("""
        SELECT COUNT(ar) FROM ActivityResult ar
        JOIN ar.activity a
        LEFT JOIN a.unit u
        LEFT JOIN u.historyEvent uhe
        LEFT JOIN uhe.timeline ut
        LEFT JOIN a.historyEvent ahe
        LEFT JOIN ahe.timeline at
        WHERE ar.user.id = :userId
        AND (ut.id = :timelineId OR at.id = :timelineId)
    """)
    long countAttemptedByUserAndTimeline(
            @Param("userId") UUID userId,
            @Param("timelineId") UUID timelineId
    );
}
