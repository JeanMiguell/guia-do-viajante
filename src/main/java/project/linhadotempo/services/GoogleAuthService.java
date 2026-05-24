package project.linhadotempo.services;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.linhadotempo.dtos.authentication.AuthResponseDTO;
import project.linhadotempo.enums.UserAuth;
import project.linhadotempo.enums.UserType;
import project.linhadotempo.exceptions.UnauthorizedException;
import project.linhadotempo.models.User;
import project.linhadotempo.models.UserTimeline;
import project.linhadotempo.repositories.TimelineRepository;
import project.linhadotempo.repositories.UserRepository;
import project.linhadotempo.repositories.UserTimelineRepository;
import project.linhadotempo.security.JwtTokenProvider;

import java.util.Collections;

@Service
@RequiredArgsConstructor
public class GoogleAuthService {

    @Value("${google.client-id}")
    private String googleClientId;

    private final UserRepository userRepository;
    private final TimelineRepository timelineRepository;
    private final UserTimelineRepository userTimelineRepository;
    private final JwtTokenProvider jwtTokenProvider;

    @Transactional
    public AuthResponseDTO authenticate(String idToken, String userTypeStr) {

        GoogleIdToken.Payload payload = verifyToken(idToken);

        String email = payload.getEmail();
        String name = (String) payload.get("name");
        String picture = (String) payload.get("picture");

        User user = userRepository.findByEmail(email).orElseGet(() -> {
            UserType userType = parseUserType(userTypeStr);

            User newUser = new User();
            newUser.setEmail(email);
            newUser.setName(name != null ? name : email);
            newUser.setAuthProvider(UserAuth.GOOGLE);
            newUser.setPassword("");
            newUser.setAvatar(picture);
            newUser.setUserType(userType);
            userRepository.save(newUser);

            timelineRepository.findByIsDefaultTrue().ifPresent(defaultTimeline -> {
                UserTimeline ut = new UserTimeline();
                ut.setUser(newUser);
                ut.setTimeline(defaultTimeline);
                ut.setAccepted(true);
                userTimelineRepository.save(ut);
            });

            return newUser;
        });

        if (user.getAvatar() == null && picture != null) {
            user.setAvatar(picture);
            userRepository.save(user);
        }

        boolean completed = Boolean.TRUE.equals(user.getAdditionalDataCompleted());
        return new AuthResponseDTO(jwtTokenProvider.generateToken(user), completed);
    }

    private GoogleIdToken.Payload verifyToken(String idToken) {
        try {
            GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
                    new NetHttpTransport(),
                    GsonFactory.getDefaultInstance()
            )
                    .setAudience(Collections.singletonList(googleClientId))
                    .build();

            GoogleIdToken googleIdToken = verifier.verify(idToken);
            if (googleIdToken == null) {
                throw new UnauthorizedException("Token do Google inválido.");
            }
            return googleIdToken.getPayload();
        } catch (UnauthorizedException e) {
            throw e;
        } catch (Exception e) {
            throw new UnauthorizedException("Falha ao verificar token do Google.");
        }
    }

    private UserType parseUserType(String userTypeStr) {
        try {
            return UserType.valueOf(userTypeStr);
        } catch (Exception e) {
            return UserType.STUDENT;
        }
    }
}
