package project.linhadotempo.controllers;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.linhadotempo.dtos.GenericResponseDTO;
import project.linhadotempo.dtos.authentication.AuthResponseDTO;
import project.linhadotempo.dtos.authentication.LoginRequestDTO;
import project.linhadotempo.dtos.authentication.RegisterRequestDTO;
import project.linhadotempo.services.AuthenticationService;

@RestController
@RequestMapping("api/auth")
@RequiredArgsConstructor
@Tag(name = "Autenticação", description = "Endpoints responsáveis por login e registro de usuários")
public class AuthenticationController {

    private final AuthenticationService authenticationService;

    @PostMapping("/login")
    @Operation(
            summary = "Realizar login",
            description = "Autentica um usuário com email e senha e retorna um token JWT"
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Login realizado com sucesso"),
            @ApiResponse(responseCode = "401", description = "Email ou senha inválidos")
    })
    public ResponseEntity<AuthResponseDTO> login(@RequestBody LoginRequestDTO request) {
        AuthResponseDTO response = authenticationService.login(request);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/register")
    @Operation(
            summary = "Registrar usuário",
            description = "Cria um novo usuário no sistema"
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Usuário registrado com sucesso"),
            @ApiResponse(responseCode = "409", description = "Email já está em uso")
    })
    public ResponseEntity<GenericResponseDTO> register(@RequestBody RegisterRequestDTO request) {
        GenericResponseDTO response = authenticationService.register(request);
        return ResponseEntity.ok(response);
    }
}