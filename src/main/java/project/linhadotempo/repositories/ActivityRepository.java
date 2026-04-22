package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import project.linhadotempo.models.Activity;

import java.util.List;
import java.util.UUID;

public interface ActivityRepository extends JpaRepository<Activity, UUID> {

    List<Activity> findByUnitId(UUID unitId);

    List<Activity> findByHistoryEventId(UUID eventId);
}