package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.linhadotempo.dtos.users.CompleteProfileDTO;
import project.linhadotempo.dtos.users.StudentListDTO;
import project.linhadotempo.dtos.users.UserDTO;
import project.linhadotempo.enums.UserAuth;
import project.linhadotempo.enums.UserType;
import project.linhadotempo.exceptions.BadRequestException;
import project.linhadotempo.exceptions.ResourceNotFoundException;
import project.linhadotempo.exceptions.UnauthorizedException;
import project.linhadotempo.mappers.UserMapper;
import project.linhadotempo.models.User;
import project.linhadotempo.projections.UserProjection;
import project.linhadotempo.repositories.UserRepository;
import project.linhadotempo.utils.CurrentUserProvider;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final CurrentUserProvider currentUserProvider;
    private final UserMapper userMapper;

    private final String USER_NOT_FOUND_MESSAGE = "Usuário não encontrado.";

    public List<StudentListDTO> findAllStudents(UUID timelineId) {

        User currentUser = currentUserProvider.getAuthenticatedUser();

        if (currentUser.getUserType() != UserType.TEACHER) {
            throw new UnauthorizedException("Somente professores podem visualizar estudantes.");
        }

        return userRepository.findAllStudents(timelineId)
                .stream()
                .map(student -> new StudentListDTO(
                        student.getId(),
                        student.getName(),
                        student.getEmail(),
                        student.getAlreadyInvited()
                ))
                .toList();
    }

    public User findUserById(UUID userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException(USER_NOT_FOUND_MESSAGE));
    }

    public UserDTO findUserDTOById() {
        UUID userId = currentUserProvider.getAuthenticatedUser().getId();
        UserProjection projection = userRepository.findUserProjectionById(userId)
                .orElseThrow(() -> new ResourceNotFoundException(USER_NOT_FOUND_MESSAGE));

        UserDTO dto = userMapper.toDTO(projection);
        dto.setAdditionalDataCompleted(Boolean.TRUE.equals(projection.getAdditionalDataCompleted()));
        return dto;
    }

    @Transactional
    public void completeProfile(CompleteProfileDTO dto) {
        User user = currentUserProvider.getAuthenticatedUser();

        if (user.getAuthProvider() != UserAuth.GOOGLE) {
            throw new UnauthorizedException("Apenas usuários autenticados via Google precisam completar o perfil.");
        }

        if (Boolean.TRUE.equals(user.getAdditionalDataCompleted())) {
            throw new BadRequestException("Perfil já está completo.");
        }

        user.setBirthDate(dto.getBirthDate());
        user.setGender(dto.getGender());
        user.setUserType(dto.getUserType());
        user.setAdditionalDataCompleted(true);

        userRepository.save(user);
    }

    public void deleteUserById(UUID userId) {
        User currentUser = currentUserProvider.getAuthenticatedUser();

        if (!currentUser.getId().equals(userId)) {
            throw new UnauthorizedException("Você não tem permissão para deletar este usuário.");
        }

        User user = findUserById(userId);
        userRepository.delete(user);
    }
}