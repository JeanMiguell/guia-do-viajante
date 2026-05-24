package project.linhadotempo.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.linhadotempo.enums.ActivityType;
import project.linhadotempo.models.Activity;
import project.linhadotempo.projections.TimelineEvaluationProjection;

import java.util.List;
import java.util.UUID;

public interface ActivityRepository extends JpaRepository<Activity, UUID> {

    List<Activity> findByUnitId(UUID unitId);

    List<Activity> findByHistoryEventId(UUID eventId);

    @Query("""
    SELECT
        a.id AS activityId,
        a.title AS activityName,
        he.name AS unitName,
        he.id AS eventId,
        he.imageUrl AS imageUrl,
        a.minimumScore AS minimumScore,
        (SELECT COUNT(q) FROM Question q WHERE q.activity.id = a.id) AS questionCount
    FROM Activity a
    JOIN a.historyEvent he
    JOIN he.timeline t
    WHERE t.id = :timelineId
      AND a.type = 'ASSESSMENT'
""")
    Page<TimelineEvaluationProjection> findEvaluationsByTimeline(
            UUID timelineId,
            Pageable pageable
    );

    @Query("""
    SELECT DISTINCT a
    FROM Activity a
    LEFT JOIN a.unit u
    LEFT JOIN u.historyEvent uhe
    LEFT JOIN a.historyEvent he
    WHERE he.timeline.id = :timelineId
       OR uhe.timeline.id = :timelineId
""")
    Page<Activity> findActivitiesByTimeline(
            @Param("timelineId") UUID timelineId,
            Pageable pageable
    );

    @Query("""
    SELECT DISTINCT a
    FROM Activity a
    LEFT JOIN a.unit u
    LEFT JOIN u.historyEvent uhe
    LEFT JOIN a.historyEvent he
    WHERE (he.timeline.id = :timelineId OR uhe.timeline.id = :timelineId)
      AND a.type = :type
""")
    Page<Activity> findActivitiesByTimelineAndType(
            @Param("timelineId") UUID timelineId,
            @Param("type") ActivityType type,
            Pageable pageable
    );
}