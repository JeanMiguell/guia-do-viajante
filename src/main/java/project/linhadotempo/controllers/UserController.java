package project.linhadotempo.controllers;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;
import project.linhadotempo.dtos.users.CompleteProfileDTO;
import project.linhadotempo.dtos.users.StudentListDTO;
import project.linhadotempo.dtos.users.UserDTO;
import project.linhadotempo.services.UserService;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("api/users")
@RequiredArgsConstructor
@Tag(name = "Usuários", description = "Endpoints responsáveis por busca e exclusão de usuários.")
public class UserController {

    private final UserService userService;

    @Operation(summary = "Listar estudantes")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Estudantes retornados com sucesso"),
            @ApiResponse(responseCode = "403", description = "Somente professores podem acessar")
    })
    @GetMapping("/students")
    public ResponseEntity<List<StudentListDTO>> getStudents(
            @RequestParam(required = false) UUID timelineId
    ) {
        return ResponseEntity.ok(
                userService.findAllStudents(timelineId)
        );
    }

    @Operation(summary = "Buscar usuário autenticado")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Usuário retornado com sucesso"),
            @ApiResponse(responseCode = "401", description = "Não autenticado")
    })
    @GetMapping("/me")
    public ResponseEntity<UserDTO> getCurrentUser() {
        return ResponseEntity.ok(userService.findUserDTOById());
    }

    @Operation(summary = "Completar perfil do usuário Google")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "204", description = "Perfil completado com sucesso"),
            @ApiResponse(responseCode = "400", description = "Perfil já está completo"),
            @ApiResponse(responseCode = "401", description = "Apenas usuários Google precisam completar perfil")
    })
    @PutMapping("/me/complete-profile")
    public ResponseEntity<Void> completeProfile(@Valid @RequestBody CompleteProfileDTO dto) {
        userService.completeProfile(dto);
        return ResponseEntity.noContent().build();
    }

    @Operation(summary = "Deletar usuário por ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "204", description = "Usuário deletado com sucesso"),
            @ApiResponse(responseCode = "404", description = "Usuário não encontrado"),
            @ApiResponse(responseCode = "403", description = "Sem permissão")
    })
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable UUID id) {
        userService.deleteUserById(id);
        return ResponseEntity.noContent().build();
    }
}