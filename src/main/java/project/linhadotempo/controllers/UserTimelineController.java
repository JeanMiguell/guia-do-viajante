package project.linhadotempo.controllers;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.linhadotempo.dtos.InviteUserDTO;
import project.linhadotempo.dtos.PendingInviteCountDTO;
import project.linhadotempo.dtos.PendingInviteDTO;
import project.linhadotempo.services.UserTimelineService;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/user-timelines")
@RequiredArgsConstructor
@Tag(name = "Convites de Linha do Tempo", description = "Endpoints responsáveis pelo gerenciamento de convites entre professores e estudantes para linhas do tempo.")
public class UserTimelineController {

    private final UserTimelineService userTimelineService;

    @Operation(summary = "Listar convites pendentes do estudante autenticado")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Convites pendentes retornados com sucesso"),
            @ApiResponse(responseCode = "403", description = "Somente estudantes podem visualizar convites pendentes")
    })
    @GetMapping("/pending")
    public List<PendingInviteDTO> getPendingInvites() {
        return userTimelineService.getPendingInvites();
    }

    @Operation(summary = "Enviar convites para estudantes")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Convites enviados com sucesso"),
            @ApiResponse(responseCode = "400", description = "Dados inválidos ou estudantes já convidados"),
            @ApiResponse(responseCode = "403", description = "Somente professores podem enviar convites"),
            @ApiResponse(responseCode = "404", description = "Linha do tempo ou estudantes não encontrados")
    })
    @PostMapping("/invite")
    public String sendInvite(
            @Valid @RequestBody InviteUserDTO dto
    ) {
        return userTimelineService.sendInvite(dto);
    }

    @Operation(summary = "Aceitar convite para linha do tempo")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Convite aceito com sucesso"),
            @ApiResponse(responseCode = "403", description = "Somente estudantes podem aceitar convites"),
            @ApiResponse(responseCode = "404", description = "Convite não encontrado")
    })
    @PatchMapping("/{inviteId}/accept")
    public String acceptInvite(@PathVariable UUID inviteId) {
        return userTimelineService.acceptInvite(inviteId);
    }

    @Operation(summary = "Recusar convite para linha do tempo")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Convite recusado com sucesso"),
            @ApiResponse(responseCode = "403", description = "Somente estudantes podem recusar convites"),
            @ApiResponse(responseCode = "404", description = "Convite não encontrado")
    })
    @DeleteMapping("/{inviteId}/reject")
    public String rejectInvite(@PathVariable UUID inviteId) {
        return userTimelineService.rejectInvite(inviteId);
    }

    @Operation(summary = "Contar convites pendentes do estudante autenticado")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Quantidade de convites pendentes retornada com sucesso"),
            @ApiResponse(responseCode = "403", description = "Somente estudantes possuem convites pendentes")
    })
    @GetMapping("/pending/count")
    public PendingInviteCountDTO countPendingInvites() {
        return userTimelineService.countPendingInvites();
    }
}