package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import project.linhadotempo.models.ActivityResult;

import java.util.UUID;

public interface ActivityResultRepository extends JpaRepository<ActivityResult, UUID> {
}
