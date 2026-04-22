package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.models.Unit;
import project.linhadotempo.models.User;
import project.linhadotempo.models.UserUnitProgress;
import project.linhadotempo.repositories.UserUnitProgressRepository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserUnitProgressService {

    private final UserUnitProgressRepository repository;

    public void markUnitAsCompleted(User user, Unit unit) {

        UserUnitProgress progress = repository
                .findByUserIdAndUnitId(user.getId(), unit.getId())
                .orElseGet(() -> {
                    UserUnitProgress p = new UserUnitProgress();
                    p.setUser(user);
                    p.setUnit(unit);
                    return p;
                });

        progress.setCompleted(true);
        progress.setProgressPercentage(100);
        progress.setCompletedAt(LocalDateTime.now());

        repository.save(progress);
    }

    public boolean isEventCompleted(UUID userId, UUID eventId) {
        return repository.isEventCompleted(userId, eventId);
    }

    public Map<UUID, UserUnitProgress> getProgressMapByEvent(UUID userId, UUID eventId) {

        List<UserUnitProgress> progressList =
                repository.findByUserIdAndUnitEventId(userId, eventId);

        return progressList.stream()
                .collect(Collectors.toMap(
                        p -> p.getUnit().getId(),
                        p -> p
                ));
    }
}
