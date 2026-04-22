package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import project.linhadotempo.models.UnitContent;
import project.linhadotempo.projections.UnitContentProjection;

import java.util.List;
import java.util.UUID;

public interface UnitContentRepository extends JpaRepository<UnitContent, UUID> {

    @Query("""
        SELECT
            uc.id AS id,
            uc.title AS title,
            uc.content AS content,
            uc.imageUrl AS imageUrl,
            uc.pageOrder AS pageOrder,
            uc.hint AS hint
        FROM UnitContent uc
        WHERE uc.unit.id = :unitId
        ORDER BY uc.pageOrder ASC
    """)
    List<UnitContentProjection> findContentsByUnitId(UUID unitId);
}
