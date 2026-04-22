package project.linhadotempo.controllers;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.linhadotempo.dtos.units.UnitContentDTO;
import project.linhadotempo.dtos.units.UnitDTO;
import project.linhadotempo.services.UnitContentService;
import project.linhadotempo.services.UnitService;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("api/events")
@RequiredArgsConstructor
@Tag(name = "Unidades", description = "Endpoints responsáveis por exibir as unidades relacionados a um marco histórico.")
public class UnitController {

    private final UnitService unitService;
    private final UnitContentService unitContentService;

    @Operation(
            summary = "Buscar unidades por evento",
            description = "Retorna a lista de unidades associadas a um evento histórico, ordenadas por ordem de exibição."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Unidades retornadas com sucesso"),
            @ApiResponse(responseCode = "404", description = "Evento não encontrado"),
            @ApiResponse(responseCode = "400", description = "UUID inválido")
    })
    @GetMapping("/{eventId}/units")
    public ResponseEntity<List<UnitDTO>> getUnitsByEvent(
            @Parameter(
                    description = "ID do evento histórico",
                    required = true,
                    example = "3fa85f64-5717-4562-b3fc-2c963f66afa6"
            )
            @PathVariable UUID eventId
    ) {
        List<UnitDTO> units = unitService.getUnitsByEvent(eventId);
        return ResponseEntity.ok(units);
    }

    @Operation(
            summary = "Buscar conteúdo da unidade",
            description = "Retorna todas as páginas de conteúdo de uma unidade, ordenadas por pageOrder. " +
                    "Cada item representa uma página da unidade (texto + imagem opcional)."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Conteúdo retornado com sucesso"),
            @ApiResponse(responseCode = "404", description = "Unidade não encontrada"),
            @ApiResponse(responseCode = "401", description = "Não autenticado")
    })
    @GetMapping("/{unitId}/contents")
    public List<UnitContentDTO> getContents(
            @Parameter(
                    description = "ID da unidade",
                    example = "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                    required = true
            )
            @PathVariable UUID unitId
    ) {
        return unitContentService.getContentsByUnit(unitId);
    }

    @Operation(
            summary = "Buscar unidade por ID",
            description = "Retorna os dados de uma unidade específica, incluindo título, descrição, ordem e o evento ao qual ela pertence."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Unidade encontrada com sucesso"),
            @ApiResponse(responseCode = "404", description = "Unidade não encontrada"),
            @ApiResponse(responseCode = "400", description = "UUID inválido")
    })
    @GetMapping("/units/{unitId}")
    public ResponseEntity<UnitDTO> getUnitById(
            @Parameter(
                    description = "ID da unidade",
                    required = true,
                    example = "3fa85f64-5717-4562-b3fc-2c963f66afa6"
            )
            @PathVariable UUID unitId
    ) {
        UnitDTO unit = unitService.getUnitById(unitId);
        return ResponseEntity.ok(unit);
    }
}