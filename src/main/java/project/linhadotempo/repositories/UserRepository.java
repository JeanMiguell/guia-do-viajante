package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import project.linhadotempo.models.User;
import project.linhadotempo.projections.UserProjection;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface UserRepository extends JpaRepository<User, UUID> {

    Optional<User> findByEmail(String email);

    boolean existsByEmail(String email);

    @Query("""
        SELECT 
            u.id as id,
            u.name as name,
            u.email as email,
            u.birthDate as birthdate,
            u.avatar as avatar,
            u.gender as gender
        FROM User u
        WHERE u.id = :userId
    """)
    Optional<UserProjection> findUserProjectionById(UUID userId);
}
