package project.linhadotempo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import project.linhadotempo.models.User;
import project.linhadotempo.projections.StudentListProjection;
import project.linhadotempo.projections.UserProjection;

import java.util.List;
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
            u.gender as gender,
            u.userType as type
        FROM User u
        WHERE u.id = :userId
    """)
    Optional<UserProjection> findUserProjectionById(UUID userId);

    @Query("""
    SELECT
        u.id AS id,
        u.name AS name,
        u.email AS email,
        CASE
            WHEN :timelineId IS NOT NULL AND EXISTS (
                SELECT ut.id
                FROM UserTimeline ut
                WHERE ut.user.id = u.id
                  AND ut.timeline.id = :timelineId
            )
            THEN true
            ELSE false
        END AS alreadyInvited
    FROM User u
    WHERE u.userType = project.linhadotempo.enums.UserType.STUDENT
""")
    List<StudentListProjection> findAllStudents(UUID timelineId);
}
