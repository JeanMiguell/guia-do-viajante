package project.linhadotempo.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import project.linhadotempo.models.Timeline;
import project.linhadotempo.projections.TimelineListProjection;

import java.util.Optional;
import java.util.UUID;

public interface TimelineRepository extends JpaRepository<Timeline, UUID> {

    @Query("""
    SELECT 
        t.id AS id,
        t.name AS name,
        t.imageUrl AS imageUrl,
        t.description AS description,
        t.user.id AS userId
    FROM Timeline t
    WHERE 
        t.user.id = :userId
        OR t.visibility = 'PUBLIC'
        OR EXISTS (
            SELECT ut.id
            FROM UserTimeline ut
            WHERE ut.timeline.id = t.id
              AND ut.user.id = :userId
              AND ut.accepted = true
        )
""")
    Page<TimelineListProjection> findAllAccessible(UUID userId, Pageable pageable);

    Optional<Timeline> findByIsDefaultTrue();
}
