package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import project.linhadotempo.models.Answer;

import java.util.UUID;

public interface AnswerRepository extends JpaRepository<Answer, UUID> {
}
