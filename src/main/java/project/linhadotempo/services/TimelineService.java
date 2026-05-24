package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.linhadotempo.dtos.GenericResponseDTO;
import project.linhadotempo.dtos.fullTimeline.HistoryEventCreateFullDTO;
import project.linhadotempo.dtos.fullTimeline.HistoryEventFullDTO;
import project.linhadotempo.dtos.fullTimeline.TimelineFullCreateDTO;
import project.linhadotempo.dtos.fullTimeline.TimelineFullDTO;
import project.linhadotempo.dtos.fullTimeline.UnitContentCreateDTO;
import project.linhadotempo.dtos.fullTimeline.UnitContentFullDTO;
import project.linhadotempo.dtos.fullTimeline.UnitCreateFullDTO;
import project.linhadotempo.dtos.fullTimeline.UnitFullDTO;
import project.linhadotempo.dtos.timeline.TimelineCreateDTO;
import project.linhadotempo.dtos.timeline.TimelineListDTO;
import project.linhadotempo.enums.TimelineStatus;
import project.linhadotempo.exceptions.ResourceNotFoundException;
import project.linhadotempo.exceptions.UnauthorizedException;
import project.linhadotempo.mappers.TimelineMapper;
import project.linhadotempo.models.*;
import project.linhadotempo.models.HistoryEvent;
import project.linhadotempo.projections.TimelineListProjection;
import project.linhadotempo.repositories.ActivityRepository;
import project.linhadotempo.repositories.ActivityResultRepository;
import project.linhadotempo.repositories.TimelineRepository;
import project.linhadotempo.repositories.UserAnswerRepository;
import project.linhadotempo.utils.CurrentUserProvider;
import project.linhadotempo.utils.TimelineUnitOfWork;
import project.linhadotempo.models.Unit;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
@RequiredArgsConstructor
public class TimelineService {

    private final TimelineRepository repository;
    private final CurrentUserProvider currentUserProvider;
    private final TimelineMapper timelineMapper;
    private final TimelineUnitOfWork unitOfWork;
    private final FileUploadService fileUploadService;
    private final UserUnitProgressService userUnitProgressService;
    private final ActivityRepository activityRepository;
    private final ActivityResultRepository activityResultRepository;
    private final UserAnswerRepository userAnswerRepository;

    private final String TIMELINE_CREATED = "A linha do tempo foi criada com sucesso!";
    private final String TIMELINE_UPDATED = "A linha do tempo foi atualizada com sucesso!";
    private final String TIMELINE_DELETED = "A linha do tempo foi removida com sucesso!";

    @Transactional(readOnly = true)
    public TimelineFullDTO findFullById(
            UUID timelineId
    ) {

        User user =
                currentUserProvider
                        .getAuthenticatedUser();

        Timeline timeline =
                unitOfWork.timelineRepository
                        .findById(timelineId)
                        .orElseThrow(() ->
                                new ResourceNotFoundException(
                                        "Linha do tempo não encontrada."
                                )
                        );

        validateTimelineAccess(
                timeline,
                user
        );

        TimelineFullDTO dto =
                new TimelineFullDTO();

        dto.setId(timeline.getId());
        dto.setName(timeline.getName());
        dto.setDescription(timeline.getDescription());
        dto.setImageUrl(timeline.getImageUrl());
        dto.setVisibility(timeline.getVisibility());

        List<HistoryEventFullDTO> events =
                new ArrayList<>();

        for (HistoryEvent historyEvent :
                timeline.getHistoryEvents()) {

            HistoryEventFullDTO eventDTO =
                    new HistoryEventFullDTO();

            eventDTO.setId(historyEvent.getId());
            eventDTO.setName(historyEvent.getName());
            eventDTO.setDescription(historyEvent.getDescription());
            eventDTO.setStartYear(historyEvent.getStartYear());
            eventDTO.setEndYear(historyEvent.getEndYear());
            eventDTO.setPeriodDescription(historyEvent.getPeriodDescription());
            eventDTO.setEventType(historyEvent.getEventType());
            eventDTO.setIntroText(historyEvent.getIntroText());
            eventDTO.setImageUrl(historyEvent.getImageUrl());

            List<UnitFullDTO> units =
                    new ArrayList<>();

            for (Unit unit :
                    historyEvent.getUnits()) {

                UnitFullDTO unitDTO =
                        new UnitFullDTO();

                unitDTO.setId(unit.getId());
                unitDTO.setTitle(unit.getTitle());
                unitDTO.setDescription(unit.getDescription());
                unitDTO.setOrderIndex(unit.getOrderIndex());

                List<UnitContentFullDTO> contents =
                        new ArrayList<>();

                for (UnitContent content :
                        unit.getContents()) {

                    UnitContentFullDTO contentDTO =
                            new UnitContentFullDTO();

                    contentDTO.setId(content.getId());
                    contentDTO.setTitle(content.getTitle());
                    contentDTO.setContent(content.getContent());
                    contentDTO.setImageUrl(content.getImageUrl());
                    contentDTO.setPageOrder(content.getPageOrder());
                    contentDTO.setHint(content.getHint());
                    contentDTO.setLayout(content.getLayout() != null ? content.getLayout() : "TEXT_LEFT");

                    contents.add(contentDTO);
                }

                unitDTO.setContents(contents);

                units.add(unitDTO);
            }

            eventDTO.setUnits(units);

            events.add(eventDTO);
        }

        dto.setEvents(events);

        return dto;
    }

    @Transactional
    public GenericResponseDTO createFullTimeline(
            TimelineFullCreateDTO dto
    ) {

        User user = currentUserProvider
                .getAuthenticatedUser();

        Timeline timeline = new Timeline();

        timeline.setName(dto.getName());
        timeline.setDescription(dto.getDescription());
        timeline.setImageUrl(dto.getImageUrl());
        timeline.setVisibility(dto.getVisibility());

        timeline.setUser(user);

        timeline.setStatus(
                TimelineStatus.DRAFT
        );

        timeline.setIsDefault(false);

        repository.save(timeline);

        createEvents(
                dto.getEvents(),
                timeline
        );

        return new GenericResponseDTO(
                TIMELINE_CREATED,
                timeline.getId()
        );
    }

    private void createEvents(
            List<HistoryEventCreateFullDTO> events,
            Timeline timeline
    ) {

        for (HistoryEventCreateFullDTO dto : events) {

            HistoryEvent historyEvent =
                    new HistoryEvent();

            historyEvent.setTimeline(timeline);

            historyEvent.setName(dto.getName());
            historyEvent.setDescription(dto.getDescription());
            historyEvent.setStartYear(dto.getStartYear());
            historyEvent.setEndYear(dto.getEndYear());
            historyEvent.setPeriodDescription(dto.getPeriodDescription());
            historyEvent.setEventType(dto.getEventType());
            historyEvent.setIntroText(dto.getIntroText());
            historyEvent.setImageUrl(dto.getImageUrl());

            unitOfWork.historyEventRepository.save(historyEvent);

            createUnits(
                    dto.getUnits(),
                    historyEvent
            );
        }
    }

    private void createUnits(
            List<UnitCreateFullDTO> units,
            HistoryEvent historyEvent
    ) {

        for (UnitCreateFullDTO dto : units) {

            Unit unit = new Unit();

            unit.setHistoryEvent(historyEvent);

            unit.setTitle(dto.getTitle());
            unit.setDescription(dto.getDescription());
            unit.setOrderIndex(dto.getOrderIndex());

            unitOfWork.unitRepository.save(unit);

            createContents(
                    dto.getContents(),
                    unit
            );
        }
    }

    private void createContents(
            List<UnitContentCreateDTO> contents,
            Unit unit
    ) {

        for (UnitContentCreateDTO dto : contents) {

            UnitContent content =
                    new UnitContent();

            content.setUnit(unit);

            content.setTitle(dto.getTitle());
            content.setContent(dto.getContent());
            content.setHint(dto.getHint());
            content.setImageUrl(dto.getImageUrl());
            content.setPageOrder(dto.getPageOrder());
            content.setLayout(dto.getLayout() != null ? dto.getLayout() : "TEXT_LEFT");

            unitOfWork.unitContentRepository.save(content);
        }
    }

    @Transactional
    public GenericResponseDTO updateFullTimeline(UUID timelineId,
                                                 TimelineFullCreateDTO dto) {

        User user = currentUserProvider.getAuthenticatedUser();

        Timeline timeline = unitOfWork.timelineRepository
                .findById(timelineId)
                .orElseThrow(() ->
                        new ResourceNotFoundException(
                                "Linha do tempo não encontrada."
                        )
                );

        validateTimelineAccess(timeline, user);

        timeline.setName(dto.getName());
        timeline.setDescription(dto.getDescription());
        timeline.setImageUrl(dto.getImageUrl());
        timeline.setVisibility(dto.getVisibility());

        List<HistoryEventCreateFullDTO> eventDTOs =
                dto.getEvents() != null ? dto.getEvents() : List.of();

        Set<UUID> incomingEventIds = eventDTOs.stream()
                .map(HistoryEventCreateFullDTO::getId)
                .filter(Objects::nonNull)
                .collect(Collectors.toSet());

        List<HistoryEvent> eventsToDelete = timeline.getHistoryEvents()
                .stream()
                .filter(e -> !incomingEventIds.contains(e.getId()))
                .collect(Collectors.toList());

        List<String> removedEventUrls = eventsToDelete.stream()
                .flatMap(e -> collectEventImageUrls(e).stream())
                .toList();

        eventsToDelete.forEach(e -> deleteActivitiesForEvent(e.getId()));

        List<Unit> unitsInDeletedEvents = eventsToDelete.stream()
                .filter(e -> e.getUnits() != null)
                .flatMap(e -> e.getUnits().stream())
                .toList();
        unitsInDeletedEvents.forEach(u -> deleteActivitiesForUnit(u.getId()));
        userUnitProgressService.deleteProgressForUnits(unitsInDeletedEvents);

        unitOfWork.historyEventRepository.deleteAll(eventsToDelete);
        timeline.getHistoryEvents().removeAll(eventsToDelete);

        fileUploadService.deleteAllByUrls(removedEventUrls);

        for (HistoryEventCreateFullDTO eventDTO : eventDTOs) {

            HistoryEvent historyEvent;

            if (eventDTO.getId() != null) {
                historyEvent = unitOfWork.historyEventRepository
                        .findById(eventDTO.getId())
                        .orElseThrow(() -> new ResourceNotFoundException(
                                "Evento não encontrado."
                        ));
            } else {
                historyEvent = new HistoryEvent();
                historyEvent.setTimeline(timeline);
            }

            historyEvent.setName(eventDTO.getName());
            historyEvent.setDescription(eventDTO.getDescription());
            historyEvent.setStartYear(eventDTO.getStartYear());
            historyEvent.setEndYear(eventDTO.getEndYear());
            historyEvent.setPeriodDescription(eventDTO.getPeriodDescription());
            historyEvent.setEventType(eventDTO.getEventType());
            historyEvent.setIntroText(eventDTO.getIntroText());
            historyEvent.setImageUrl(eventDTO.getImageUrl());

            unitOfWork.historyEventRepository.save(historyEvent);

            syncUnits(historyEvent, eventDTO.getUnits());
        }

        unitOfWork.timelineRepository.save(timeline);

        return new GenericResponseDTO(
                "Linha do tempo atualizada com sucesso.",
                timeline.getId()
        );
    }

    private void syncUnits(HistoryEvent historyEvent,
                           List<UnitCreateFullDTO> unitDTOs) {

        if (unitDTOs == null) unitDTOs = List.of();

        Set<UUID> incomingUnitIds = unitDTOs.stream()
                .map(UnitCreateFullDTO::getId)
                .filter(Objects::nonNull)
                .collect(Collectors.toSet());

        List<Unit> unitsToDelete = historyEvent.getUnits().stream()
                .filter(u -> !incomingUnitIds.contains(u.getId()))
                .collect(Collectors.toList());

        List<String> removedUnitUrls = unitsToDelete.stream()
                .flatMap(u -> u.getContents().stream()
                        .map(UnitContent::getImageUrl))
                .filter(url -> url != null && !url.isBlank())
                .toList();

        unitsToDelete.forEach(u -> deleteActivitiesForUnit(u.getId()));
        userUnitProgressService.deleteProgressForUnits(unitsToDelete);
        unitOfWork.unitRepository.deleteAll(unitsToDelete);
        historyEvent.getUnits().removeAll(unitsToDelete);

        fileUploadService.deleteAllByUrls(removedUnitUrls);

        for (UnitCreateFullDTO unitDTO : unitDTOs) {

            Unit unit;

            if (unitDTO.getId() != null) {
                unit = unitOfWork.unitRepository
                        .findById(unitDTO.getId())
                        .orElseThrow(() -> new ResourceNotFoundException(
                                "Unidade não encontrada."
                        ));
            } else {
                unit = new Unit();
                unit.setHistoryEvent(historyEvent);
            }

            unit.setTitle(unitDTO.getTitle());
            unit.setDescription(unitDTO.getDescription());
            unit.setOrderIndex(unitDTO.getOrderIndex());

            unitOfWork.unitRepository.save(unit);

            syncContents(unit, unitDTO.getContents());
        }
    }

    private void deleteActivitiesForEvent(UUID eventId) {
        List<Activity> activities = activityRepository.findByHistoryEventId(eventId);
        if (activities.isEmpty()) return;
        List<UUID> activityIds = activities.stream()
                .map(Activity::getId)
                .toList();
        activityResultRepository.deleteByActivityIdIn(activityIds);
        userAnswerRepository.deleteByQuestionActivityIdIn(activityIds);
        activityRepository.deleteAll(activities);
    }

    private void deleteActivitiesForUnit(UUID unitId) {
        List<Activity> activities = activityRepository.findByUnitId(unitId);
        if (activities.isEmpty()) return;
        List<UUID> activityIds = activities.stream()
                .map(Activity::getId)
                .toList();
        activityResultRepository.deleteByActivityIdIn(activityIds);
        userAnswerRepository.deleteByQuestionActivityIdIn(activityIds);
        activityRepository.deleteAll(activities);
    }

    private void syncContents(Unit unit,
                              List<UnitContentCreateDTO> contentDTOs) {

        if (contentDTOs == null) contentDTOs = List.of();

        Set<UUID> incomingContentIds = contentDTOs.stream()
                .map(UnitContentCreateDTO::getId)
                .filter(Objects::nonNull)
                .collect(Collectors.toSet());

        List<UnitContent> contentsToDelete = unit.getContents().stream()
                .filter(c -> !incomingContentIds.contains(c.getId()))
                .collect(Collectors.toList());

        List<String> removedContentUrls = contentsToDelete.stream()
                .map(UnitContent::getImageUrl)
                .filter(url -> url != null && !url.isBlank())
                .toList();

        unitOfWork.unitContentRepository.deleteAll(contentsToDelete);
        unit.getContents().removeAll(contentsToDelete);

        fileUploadService.deleteAllByUrls(removedContentUrls);

        for (UnitContentCreateDTO contentDTO : contentDTOs) {

            UnitContent content;

            if (contentDTO.getId() != null) {
                content = unitOfWork.unitContentRepository
                        .findById(contentDTO.getId())
                        .orElseThrow(() -> new ResourceNotFoundException(
                                "Conteúdo não encontrado."
                        ));
            } else {
                content = new UnitContent();
                content.setUnit(unit);
            }

            content.setTitle(contentDTO.getTitle());
            content.setContent(contentDTO.getContent());
            content.setImageUrl(contentDTO.getImageUrl());
            content.setPageOrder(contentDTO.getPageOrder());
            content.setHint(contentDTO.getHint());
            content.setLayout(contentDTO.getLayout() != null ? contentDTO.getLayout() : "TEXT_LEFT");

            unitOfWork.unitContentRepository.save(content);
        }
    }

    public Page<TimelineListDTO> getAccessibleTimelines(Pageable pageable) {

        User user = currentUserProvider.getAuthenticatedUser();

        Page<TimelineListProjection> page =
                repository.findAllAccessible(user.getId(), pageable);

        return page.map(timelineMapper::toDTO);
    }

    public Optional<Timeline> findById(UUID id) {
        return repository.findById(id);
    }

    public GenericResponseDTO create(TimelineCreateDTO dto) {

        User user = currentUserProvider.getAuthenticatedUser();
        Timeline timeline = timelineMapper.toEntity(dto);
        timeline.setUser(user);
        timeline.setIsDefault(false);
        timeline.setStatus(TimelineStatus.DRAFT);
        repository.save(timeline);

        return new GenericResponseDTO(TIMELINE_CREATED, timeline.getId());
    }

    public TimelineListDTO findTimelineById(UUID timelineId) {

        Timeline timeline = repository.findById(timelineId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Não há linha do tempo encontrada com o ID fornecido."
                ));

        return timelineMapper.toResponseDTO(timeline);
    }

    public GenericResponseDTO update(
            UUID timelineId,
            TimelineCreateDTO dto
    ) {

        User user = currentUserProvider.getAuthenticatedUser();

        Timeline timeline = repository.findById(timelineId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Não há linha do tempo encontrada com o ID fornecido."
                ));

        validateTimelineAccess(timeline, user);

        timelineMapper.updateEntityFromDTO(dto, timeline);

        repository.save(timeline);

        return new GenericResponseDTO(
                TIMELINE_UPDATED,
                timeline.getId()
        );
    }

    @Transactional
    public GenericResponseDTO delete(UUID timelineId) {

        User user = currentUserProvider.getAuthenticatedUser();

        Timeline timeline = repository.findById(timelineId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Não há linha do tempo encontrada com o ID fornecido."
                ));

        validateTimelineAccess(timeline, user);

        List<String> imageUrls = collectAllImageUrls(timeline);

        List<Unit> allUnits = timeline.getHistoryEvents() == null
                ? List.of()
                : timeline.getHistoryEvents().stream()
                        .filter(e -> e.getUnits() != null)
                        .flatMap(e -> e.getUnits().stream())
                        .toList();

        userUnitProgressService.deleteProgressForUnits(allUnits);

        repository.delete(timeline);

        fileUploadService.deleteAllByUrls(imageUrls);

        return new GenericResponseDTO(
                TIMELINE_DELETED,
                timelineId
        );
    }

    private void validateTimelineAccess(
            Timeline timeline,
            User user
    ) {

        if (!timeline.getUser()
                .getId()
                .equals(user.getId())) {

            throw new UnauthorizedException(
                    "Você não possui acesso a esta linha do tempo."
            );
        }
    }

    private List<String> collectAllImageUrls(Timeline timeline) {
        Stream<String> timelineUrl = Stream.of(timeline.getImageUrl());
        Stream<String> eventUrls = timeline.getHistoryEvents() == null
                ? Stream.empty()
                : timeline.getHistoryEvents().stream()
                        .flatMap(e -> collectEventImageUrls(e).stream());
        return Stream.concat(timelineUrl, eventUrls)
                .filter(url -> url != null && !url.isBlank())
                .toList();
    }

    private List<String> collectEventImageUrls(HistoryEvent event) {
        Stream<String> eventUrl = Stream.of(event.getImageUrl());
        Stream<String> contentUrls = event.getUnits() == null
                ? Stream.empty()
                : event.getUnits().stream()
                        .filter(u -> u.getContents() != null)
                        .flatMap(u -> u.getContents().stream()
                                .map(UnitContent::getImageUrl));
        return Stream.concat(eventUrl, contentUrls)
                .filter(url -> url != null && !url.isBlank())
                .toList();
    }
}
