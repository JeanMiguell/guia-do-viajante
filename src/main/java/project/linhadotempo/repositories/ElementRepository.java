package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import project.linhadotempo.models.Element;
import project.linhadotempo.projections.ElementProjection;

import java.util.List;
import java.util.UUID;

public interface ElementRepository extends JpaRepository<Element, UUID> {

    @Query("""
        SELECT
            e.id AS id,
            e.title AS title,
            e.description AS description,
            e.posX AS posX,
            e.posY AS posY
        FROM Element e
        WHERE e.unitContent.id = :contentId
    """)
    List<ElementProjection> findByContentId(UUID contentId);
}