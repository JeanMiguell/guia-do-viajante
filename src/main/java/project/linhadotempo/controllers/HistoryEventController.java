package project.linhadotempo.controllers;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.linhadotempo.dtos.TimelineDTO;
import project.linhadotempo.services.HistoryEventService;

@RestController
@RequestMapping("api/events")
@RequiredArgsConstructor
@Tag(name = "Marcos Históricos", description = "Endpoints responsáveis por lógica de marcos históricos no sistema.")
public class HistoryEventController {

    private final HistoryEventService historyEventService;

    @Operation(
            summary = "Listar eventos históricos",
            description = "Retorna todos os eventos históricos com progresso geral para exibição na linha do tempo"
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Eventos retornados com sucesso")
    })
    @GetMapping
    public ResponseEntity<TimelineDTO> getAllEvents() {
        return ResponseEntity.ok(historyEventService.getAllEvents());
    }
}