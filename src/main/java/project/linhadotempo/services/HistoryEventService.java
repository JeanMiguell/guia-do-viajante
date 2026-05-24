package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.linhadotempo.dtos.GenericResponseDTO;
import project.linhadotempo.dtos.events.HistoryEventCreateDTO;
import project.linhadotempo.dtos.events.HistoryEventDTO;
import project.linhadotempo.dtos.timeline.TimelineDTO;
import project.linhadotempo.enums.TimelineVisibility;
import project.linhadotempo.exceptions.ResourceNotFoundException;
import project.linhadotempo.exceptions.UnauthorizedException;
import project.linhadotempo.mappers.HistoryEventMapper;
import project.linhadotempo.models.HistoryEvent;
import project.linhadotempo.models.Timeline;
import project.linhadotempo.models.User;
import project.linhadotempo.projections.HistoryEventProjection;
import project.linhadotempo.repositories.HistoryEventRepository;
import project.linhadotempo.utils.CurrentUserProvider;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class HistoryEventService {

    private final HistoryEventRepository historyEventRepository;
    private final HistoryEventMapper historyEventMapper;
    private final UserUnitProgressService userUnitProgressService;
    private final CurrentUserProvider currentUserProvider;
    private final TimelineService timeLineService;
    private final FileUploadService fileUploadService;

    private final String HISTORY_EVENT_CREATED = "Evento cadastrado com sucesso!";
    private final String TIMELINE_ACCESS_DENIED = "Somente o criador da linha do tempo pode cadastrar eventos";
    private final String HISTORY_EVENT_UPDATED = "Evento atualizado com sucesso!";
    private final String HISTORY_EVENT_DELETED = "Evento excluido com sucesso!";

    public HistoryEventDTO findById(UUID historyEventId) {

        HistoryEvent historyEvent = historyEventRepository.findById(historyEventId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Não há evento histórico encontrado com o ID fornecido."
                ));

        return historyEventMapper.toResponseDTO(historyEvent);
    }

    public GenericResponseDTO create(UUID timelineId, HistoryEventCreateDTO dto) {

        User user = currentUserProvider.getAuthenticatedUser();

        Timeline timeline = timeLineService.findById(timelineId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Não há linha do tempo encontrada com o ID fornecido."
                ));

        if (!timeline.getUser().getId().equals(user.getId())) {
            throw new UnauthorizedException(
                    TIMELINE_ACCESS_DENIED
            );
        }

        HistoryEvent historyEvent = historyEventMapper.toEntity(dto);

        historyEvent.setTimeline(timeline);

        historyEventRepository.save(historyEvent);

        return new GenericResponseDTO(HISTORY_EVENT_CREATED, historyEvent.getId());
    }

    public List<HistoryEventDTO> findAllByTimelineId(UUID timelineId) {

        List<HistoryEventProjection> events =
                historyEventRepository.findAllByTimelineIdOrderByStartYearAsc(timelineId);

        return events.stream()
                .map(event -> {
                    HistoryEventDTO dto = new HistoryEventDTO();

                    dto.setId(event.getId());
                    dto.setName(event.getName());
                    dto.setDescription(event.getDescription());
                    dto.setStartYear(event.getStartYear());
                    dto.setEndYear(event.getEndYear());
                    dto.setPeriodDescription(event.getPeriodDescription());
                    dto.setEventType(event.getEventType());
                    dto.setIntroText(event.getIntroText());
                    dto.setImageUrl(event.getImageUrl());

                    return dto;
                })
                .toList();
    }

    public GenericResponseDTO update(
            UUID historyEventId,
            HistoryEventCreateDTO dto
    ) {

        User user = currentUserProvider.getAuthenticatedUser();

        HistoryEvent historyEvent = historyEventRepository.findById(historyEventId)
                .orElseThrow(() -> new ResourceNotFoundException("Não há evento histórico encontrado com o ID fornecido."));

        validateTimelineAccess(historyEvent.getTimeline(), user);

        historyEventMapper.updateEntityFromDTO(dto, historyEvent);

        historyEventRepository.save(historyEvent);

        return new GenericResponseDTO(HISTORY_EVENT_UPDATED, historyEvent.getId()
        );
    }

    @Transactional
    public GenericResponseDTO delete(UUID historyEventId) {

        User user = currentUserProvider.getAuthenticatedUser();

        HistoryEvent historyEvent = historyEventRepository.findById(historyEventId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Não há evento histórico encontrado com o ID fornecido."
                ));

        validateTimelineAccess(historyEvent.getTimeline(), user);

        List<String> imageUrls = collectEventImageUrls(historyEvent);

        List<project.linhadotempo.models.Unit> units = historyEvent.getUnits() != null
                ? historyEvent.getUnits()
                : List.of();
        userUnitProgressService.deleteProgressForUnits(units);

        historyEventRepository.delete(historyEvent);

        fileUploadService.deleteAllByUrls(imageUrls);

        return new GenericResponseDTO(
                HISTORY_EVENT_DELETED,
                historyEventId
        );
    }

    private List<String> collectEventImageUrls(HistoryEvent event) {
        List<String> urls = new ArrayList<>();
        if (event.getImageUrl() != null && !event.getImageUrl().isBlank()) {
            urls.add(event.getImageUrl());
        }
        if (event.getUnits() != null) {
            event.getUnits().stream()
                    .filter(u -> u.getContents() != null)
                    .flatMap(u -> u.getContents().stream())
                    .map(c -> c.getImageUrl())
                    .filter(url -> url != null && !url.isBlank())
                    .forEach(urls::add);
        }
        return urls;
    }

    private void validateTimelineAccess(
            Timeline timeline,
            User user
    ) {

        if (!timeline.getUser()
                .getId()
                .equals(user.getId())) {

            throw new UnauthorizedException(
                    TIMELINE_ACCESS_DENIED
            );
        }
    }

    public List<HistoryEventProjection> findAllByTimelineIdOrdered(UUID timelineId) {
        return historyEventRepository
                .findAllByTimelineIdOrderByStartYearAsc(timelineId);
    }

    public TimelineDTO getTimelineById(UUID timelineId) {

        User user = currentUserProvider.getAuthenticatedUser();

        Timeline timeline = timeLineService.findById(timelineId)
                .orElseThrow(() -> new RuntimeException("Timeline não encontrada"));

        if (timeline.getUser() != null) {

            boolean isOwner =
                    timeline.getUser().getId().equals(user.getId());

            boolean isPublic =
                    timeline.getVisibility() == TimelineVisibility.PUBLIC;

            boolean hasAcceptedInvite =
                    historyEventRepository.hasAcceptedInvite(
                            user.getId(),
                            timelineId
                    );

            if (!isOwner && !isPublic && !hasAcceptedInvite) {
                throw new RuntimeException("Acesso negado à timeline");
            }
        }

        return this.getTimelineEvents(timelineId);
    }

    public TimelineDTO getTimelineEvents(UUID timelineId) {

        User user = currentUserProvider.getAuthenticatedUser();

        List<HistoryEventProjection> projections =
                historyEventRepository.findAllByTimelineIdOrderByStartYearAsc(timelineId);

        List<HistoryEventDTO> events = new ArrayList<>();

        boolean previousCompleted = true;

        int unlockedCount = 0;
        int completedCount = 0;

        for (HistoryEventProjection projection : projections) {

            HistoryEventDTO dto = historyEventMapper.toDTO(projection);

            boolean unlocked = previousCompleted;

            boolean completed = userUnitProgressService
                    .isEventCompleted(user.getId(), projection.getId());

            if (unlocked) {
                unlockedCount++;
            }

            if (completed) {
                completedCount++;
            } else {
                previousCompleted = false;
            }

            dto.setUnlocked(unlocked);

            events.add(dto);
        }

        int total = projections.size();

        double percentage = total == 0
                ? 0
                : (completedCount * 100.0) / total;

        return new TimelineDTO(
                timelineId,
                events,
                total,
                unlockedCount,
                completedCount,
                percentage
        );
    }
}