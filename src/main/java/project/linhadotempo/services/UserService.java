package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.dtos.users.UserDTO;
import project.linhadotempo.exceptions.ResourceNotFoundException;
import project.linhadotempo.exceptions.UnauthorizedException;
import project.linhadotempo.mappers.UserMapper;
import project.linhadotempo.models.User;
import project.linhadotempo.projections.UserProjection;
import project.linhadotempo.repositories.UserRepository;
import project.linhadotempo.utils.CurrentUserProvider;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final CurrentUserProvider currentUserProvider;
    private final UserMapper userMapper;

    private final String USER_NOT_FOUND_MESSAGE = "Usuário não encontrado.";

    public User findUserById(UUID userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException(USER_NOT_FOUND_MESSAGE));
    }

    public UserDTO findUserDTOById() {
        UUID userId = currentUserProvider.getAuthenticatedUser().getId();
        UserProjection projection = userRepository.findUserProjectionById(userId)
                .orElseThrow(() -> new ResourceNotFoundException(USER_NOT_FOUND_MESSAGE));

        return userMapper.toDTO(projection);
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