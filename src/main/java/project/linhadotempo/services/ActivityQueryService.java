package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.models.Activity;
import project.linhadotempo.repositories.ActivityRepository;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ActivityQueryService {

    private final ActivityRepository repository;

    public Activity findById(UUID id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Atividade não encontrada"));
    }

    public List<Activity> findByUnit(UUID unitId) {
        return repository.findByUnitId(unitId);
    }

    public List<Activity> findByEvent(UUID eventId) {
        return repository.findByHistoryEventId(eventId);
    }
}
