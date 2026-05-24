package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import project.linhadotempo.dtos.GenericResponseDTO;
import project.linhadotempo.dtos.authentication.AuthResponseDTO;
import project.linhadotempo.dtos.authentication.LoginRequestDTO;
import project.linhadotempo.dtos.authentication.RegisterRequestDTO;
import project.linhadotempo.enums.UserAuth;
import project.linhadotempo.exceptions.ConflictException;
import project.linhadotempo.exceptions.UnauthorizedException;
import project.linhadotempo.models.Timeline;
import project.linhadotempo.models.User;
import project.linhadotempo.models.UserTimeline;
import project.linhadotempo.repositories.TimelineRepository;
import project.linhadotempo.repositories.UserRepository;
import project.linhadotempo.repositories.UserTimelineRepository;
import project.linhadotempo.security.JwtTokenProvider;

@Service
@RequiredArgsConstructor
public class AuthenticationService {

    private final UserRepository userRepository;
    private final JwtTokenProvider jwtTokenProvider;
    private final PasswordEncoder passwordEncoder;
    private final TimelineRepository timelineRepository;
    private final UserTimelineRepository userTimelineRepository;

    public AuthResponseDTO login(LoginRequestDTO request) {

        User user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new UnauthorizedException("Email ou senha inválidos"));

        if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            throw new UnauthorizedException("Email ou senha inválidos");
        }

        String token = jwtTokenProvider.generateToken(user);

        return new AuthResponseDTO(token, user.getAdditionalDataCompleted());
    }

    public GenericResponseDTO register(RegisterRequestDTO request) {

        if (userRepository.existsByEmail(request.getEmail())) {
            throw new ConflictException("Email já está em uso");
        }

        User user = new User();
        user.setName(request.getName());
        user.setEmail(request.getEmail());
        user.setAuthProvider(UserAuth.LOCAL);
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setGender(request.getGender());
        user.setBirthDate(request.getBirthDate());
        user.setAvatar(request.getAvatar());
        user.setUserType(request.getUserType());
        user.setAdditionalDataCompleted(true);

        userRepository.save(user);

        timelineRepository.findByIsDefaultTrue().ifPresent(defaultTimeline -> {
            UserTimeline userTimeline = new UserTimeline();
            userTimeline.setUser(user);
            userTimeline.setTimeline(defaultTimeline);
            userTimeline.setAccepted(true);
            userTimelineRepository.save(userTimeline);
        });

        return new GenericResponseDTO("Usuário cadastrado com sucesso!", user.getId());
    }
}