package project.linhadotempo.controllers;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.linhadotempo.dtos.units.EventResultDTO;
import project.linhadotempo.services.ActivityResultService;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/results")
@RequiredArgsConstructor
@Tag(name = "Resultados", description = "Endpoints relacionados ao desempenho do usuário nas unidades e eventos")
public class ResultController {

    private final ActivityResultService resultService;

    @Operation(
            summary = "Listar resultados do usuário por linha do tempo",
            description = "Retorna todos os marcos históricos de uma linha do tempo específica com suas respectivas unidades e o status de progresso do usuário, incluindo quantidade de acertos e total de questões por unidade."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Resultados retornados com sucesso"),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado"),
            @ApiResponse(responseCode = "404", description = "Linha do tempo não encontrada")
    })
    @GetMapping("/timeline/{timelineId}")
    public List<EventResultDTO> getUserResults(
            @PathVariable UUID timelineId
    ) {
        return resultService.getUserResults(timelineId);
    }
}
