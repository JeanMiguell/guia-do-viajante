package project.linhadotempo.controllers;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import project.linhadotempo.dtos.GenericResponseDTO;
import project.linhadotempo.dtos.events.HistoryEventCreateDTO;
import project.linhadotempo.dtos.events.HistoryEventDTO;
import project.linhadotempo.services.HistoryEventService;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/history-events")
@RequiredArgsConstructor
public class HistoryEventController {

    private final HistoryEventService historyEventService;

    @GetMapping("/timeline/{timelineId}")
    @Operation(
            summary = "Listar eventos de uma linha do tempo",
            description = "Retorna todos os eventos associados a uma linha do tempo ordenados pela data inicial.",
            tags = {"History Events"}
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Eventos retornados com sucesso"),
            @ApiResponse(responseCode = "404", description = "Linha do tempo não encontrada"),
            @ApiResponse(responseCode = "401", description = "Não autorizado")
    })
    public ResponseEntity<List<HistoryEventDTO>> findAllByTimelineId(
            @PathVariable UUID timelineId
    ) {
        return ResponseEntity.ok(
                historyEventService.findAllByTimelineId(timelineId)
        );
    }

    @PostMapping("/create/{timelineId}")
    @ResponseStatus(HttpStatus.CREATED)
    @Operation(summary = "Criar evento histórico relacionado a uma linha do tempo.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Evento histórico criado com sucesso."),
            @ApiResponse(responseCode = "400", description = "Dados inválidos."),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado.")
    })
    public GenericResponseDTO create(
            @PathVariable UUID timelineId,
            @Valid @RequestBody HistoryEventCreateDTO dto) {

        return historyEventService.create(timelineId, dto);
    }

    @PutMapping("/update/{historyEventId}")
    @ResponseStatus(HttpStatus.OK)
    @Operation(summary = "Atualizar evento histórico.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Evento histórico atualizado com sucesso."),
            @ApiResponse(responseCode = "400", description = "Dados inválidos."),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado."),
            @ApiResponse(responseCode = "404", description = "Evento histórico não encontrado.")
    })
    public GenericResponseDTO update(
            @PathVariable UUID historyEventId,
            @Valid @RequestBody HistoryEventCreateDTO dto
    ) {

        return historyEventService.update(
                historyEventId,
                dto
        );
    }

    @GetMapping("/find/{historyEventId}")
    @ResponseStatus(HttpStatus.OK)
    @Operation(summary = "Buscar evento histórico por ID.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Evento histórico encontrado."),
            @ApiResponse(responseCode = "404", description = "Evento histórico não encontrado.")
    })
    public HistoryEventDTO findById(
            @PathVariable UUID historyEventId
    ) {

        return historyEventService.findById(
                historyEventId
        );
    }

    @DeleteMapping("/delete/{historyEventId}")
    @ResponseStatus(HttpStatus.OK)
    @Operation(summary = "Remover evento histórico.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Evento histórico removido com sucesso."),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado."),
            @ApiResponse(responseCode = "404", description = "Evento histórico não encontrado.")
    })
    public GenericResponseDTO delete(
            @PathVariable UUID historyEventId
    ) {

        return historyEventService.delete(
                historyEventId
        );
    }
}
