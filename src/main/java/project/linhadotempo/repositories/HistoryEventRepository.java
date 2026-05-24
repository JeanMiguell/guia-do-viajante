package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import project.linhadotempo.models.HistoryEvent;
import project.linhadotempo.projections.HistoryEventProjection;

import java.util.List;
import java.util.UUID;

@Repository
public interface HistoryEventRepository extends JpaRepository<HistoryEvent, UUID> {

    @Query("""
    SELECT COUNT(ut) > 0
    FROM UserTimeline ut
    WHERE ut.user.id = :userId
      AND ut.timeline.id = :timelineId
      AND ut.accepted = true
""")
    boolean hasAcceptedInvite(UUID userId, UUID timelineId);

    @Query("""
            SELECT h.id AS id,
                   h.name AS name,
                   h.description AS description,
                   h.startYear AS startYear,
                   h.endYear AS endYear,
                   h.periodDescription AS periodDescription,
                   h.eventType AS eventType,
                   h.introText AS introText,
                   h.imageUrl AS imageUrl
            FROM HistoryEvent h
            WHERE h.timeline.id = :timelineId
            ORDER BY h.startYear ASC
            """)
    List<HistoryEventProjection> findAllByTimelineIdOrderByStartYearAsc(
            @Param("timelineId") UUID timelineId
    );
}
