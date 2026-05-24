package project.linhadotempo.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import project.linhadotempo.models.UserTimeline;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface UserTimelineRepository extends JpaRepository<UserTimeline, UUID> {

    Long countByUserIdAndAcceptedFalse(UUID userId);

    Optional<UserTimeline> findByIdAndUserId(UUID inviteId, UUID userId);

    boolean existsByUserIdAndTimelineId(UUID userId, UUID timelineId);

    List<UserTimeline> findByUserIdAndAcceptedFalse(UUID userId);

    List<UserTimeline> findByTimelineIdAndUserIdIn(
            UUID timelineId,
            List<UUID> userIds
    );

    Page<UserTimeline> findByTimelineIdAndAcceptedTrue(UUID timelineId, Pageable pageable);

    Optional<UserTimeline> findByTimelineIdAndUserIdAndAcceptedTrue(UUID timelineId, UUID userId);
}