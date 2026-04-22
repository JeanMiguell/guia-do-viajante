package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import project.linhadotempo.models.Unit;
import project.linhadotempo.models.UserUnitProgress;
import project.linhadotempo.projections.UnitProjection;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface UnitRepository extends JpaRepository<Unit, UUID> {

    @Query("""
    SELECT 
        u.id as id,
        u.title as title,
        u.description as description,
        u.orderIndex as orderIndex,
        u.historyEvent.id as eventId
    FROM Unit u
    WHERE u.id = :unitId
""")
    Optional<UnitProjection> findUnitById(UUID unitId);

    List<Unit> findByHistoryEventIdOrderByOrderIndexAsc(UUID eventId);
}