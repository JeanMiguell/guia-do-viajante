package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import project.linhadotempo.models.HistoryEvent;
import project.linhadotempo.projections.HistoryEventProjection;

import java.util.List;
import java.util.UUID;

@Repository
public interface HistoryEventRepository extends JpaRepository<HistoryEvent, UUID> {

    List<HistoryEventProjection> findAllByOrderByStartYearAsc();
}
