package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import project.linhadotempo.models.Unit;
import project.linhadotempo.projections.UnitSimpleProjection;

import java.util.List;
import java.util.UUID;

public interface UnitRepository extends JpaRepository<Unit, UUID> {

    List<Unit> findByHistoryEventIdOrderByOrderIndexAsc(UUID eventId);

    @Query("""
    SELECT
        u.id AS id,
        u.title AS title
    FROM Unit u
    WHERE u.historyEvent.timeline.id = :timelineId
    ORDER BY u.historyEvent.orderIndex, u.orderIndex
""")
    List<UnitSimpleProjection> findAllByTimelineId(UUID timelineId);
}