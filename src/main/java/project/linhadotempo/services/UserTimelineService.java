package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.dtos.InviteUserDTO;
import project.linhadotempo.dtos.PendingInviteCountDTO;
import project.linhadotempo.dtos.PendingInviteDTO;
import project.linhadotempo.enums.UserType;
import project.linhadotempo.exceptions.BadRequestException;
import project.linhadotempo.exceptions.ResourceAlreadyExistsException;
import project.linhadotempo.exceptions.ResourceNotFoundException;
import project.linhadotempo.exceptions.UnauthorizedException;
import project.linhadotempo.models.Timeline;
import project.linhadotempo.models.User;
import project.linhadotempo.models.UserTimeline;
import project.linhadotempo.repositories.TimelineRepository;
import project.linhadotempo.repositories.UserRepository;
import project.linhadotempo.repositories.UserTimelineRepository;
import project.linhadotempo.utils.CurrentUserProvider;

import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserTimelineService {

    private final UserTimelineRepository userTimelineRepository;
    private final TimelineRepository timelineRepository;
    private final UserRepository userRepository;
    private final CurrentUserProvider currentUserProvider;

    public List<PendingInviteDTO> getPendingInvites() {

        User student = getCurrentStudent();

        List<UserTimeline> invites =
                userTimelineRepository.findByUserIdAndAcceptedFalse(student.getId());

        return invites.stream()
                .map(invite -> new PendingInviteDTO(
                        invite.getId(),
                        invite.getTimeline().getId(),
                        invite.getTimeline().getName(),
                        invite.getTimeline().getUser().getName()
                ))
                .toList();
    }

    public String sendInvite(InviteUserDTO dto) {

        User teacher = getCurrentTeacher();
        Timeline timeline = getOwnedTimeline(dto.getTimelineId(), teacher);

        List<User> students =
                userRepository.findAllById(dto.getStudentIds());

        if (students.size() != dto.getStudentIds().size()) {
            throw new ResourceNotFoundException(
                    "Um ou mais estudantes não foram encontrados."
            );
        }

        students.forEach(student -> {
            if (student.getUserType() != UserType.STUDENT) {
                throw new BadRequestException(
                        "Apenas estudantes podem ser convidados."
                );
            }

            if (student.getId().equals(teacher.getId())) {
                throw new BadRequestException(
                        "Você não pode convidar a si mesmo."
                );
            }
        });

        List<UUID> studentIds =
                students.stream()
                        .map(User::getId)
                        .toList();

        List<UserTimeline> existingInvites =
                userTimelineRepository.findByTimelineIdAndUserIdIn(
                        timeline.getId(),
                        studentIds
                );

        Set<UUID> alreadyInvitedIds =
                existingInvites.stream()
                        .map(invite -> invite.getUser().getId())
                        .collect(Collectors.toSet());

        List<UserTimeline> invites =
                students.stream()
                        .filter(student ->
                                !alreadyInvitedIds.contains(student.getId()))
                        .map(student -> {
                            UserTimeline invite = new UserTimeline();
                            invite.setUser(student);
                            invite.setTimeline(timeline);
                            invite.setAccepted(false);
                            return invite;
                        })
                        .toList();

        userTimelineRepository.saveAll(invites);

        return "Estudantes convidados com sucesso.";
    }

    public String acceptInvite(UUID inviteId) {

        User student = getCurrentStudent();
        UserTimeline invite = getStudentInvite(inviteId, student);

        invite.setAccepted(true);
        userTimelineRepository.save(invite);

        return "Convite aceito com sucesso.";
    }

    public String rejectInvite(UUID inviteId) {

        User student = getCurrentStudent();
        UserTimeline invite = getStudentInvite(inviteId, student);

        userTimelineRepository.delete(invite);

        return "Convite recusado com sucesso.";
    }

    public PendingInviteCountDTO countPendingInvites() {

        User student = getCurrentStudent();
        Long count = userTimelineRepository.countByUserIdAndAcceptedFalse(student.getId());

        return new PendingInviteCountDTO(count);
    }

    private User getCurrentTeacher() {

        User user = currentUserProvider.getAuthenticatedUser();

        if (user.getUserType() != UserType.TEACHER) {
            throw new UnauthorizedException("Somente professores podem realizar essa ação.");
        }

        return user;
    }

    private User getCurrentStudent() {

        User user = currentUserProvider.getAuthenticatedUser();

        if (user.getUserType() != UserType.STUDENT) {
            throw new UnauthorizedException("Somente estudantes podem realizar essa ação.");
        }

        return user;
    }

    private Timeline getOwnedTimeline(UUID timelineId, User teacher) {

        Timeline timeline = timelineRepository.findById(timelineId)
                .orElseThrow(() -> new ResourceNotFoundException("Linha do tempo não encontrada."));

        if (timeline.getUser() == null || !timeline.getUser().getId().equals(teacher.getId())) {
            throw new UnauthorizedException("Você não é o dono desta linha do tempo.");
        }

        return timeline;
    }

    private User getValidStudent(UUID studentId, User teacher) {

        User student = userRepository.findById(studentId)
                .orElseThrow(() -> new ResourceNotFoundException("Usuário não encontrado."));

        if (student.getId().equals(teacher.getId())) {
            throw new BadRequestException("Você não pode convidar a si mesmo.");
        }

        if (student.getUserType() != UserType.STUDENT) {
            throw new BadRequestException("Apenas estudantes podem receber convites.");
        }

        return student;
    }

    private void validateDuplicateInvite(User student, Timeline timeline) {

        if (userTimelineRepository.existsByUserIdAndTimelineId(student.getId(), timeline.getId())) {
            throw new ResourceAlreadyExistsException("Este usuário já possui acesso ou convite para esta linha do tempo.");
        }
    }

    private UserTimeline getStudentInvite(UUID inviteId, User student) {

        return userTimelineRepository.findByIdAndUserId(inviteId, student.getId())
                .orElseThrow(() -> new ResourceNotFoundException("Convite não encontrado."));
    }
}