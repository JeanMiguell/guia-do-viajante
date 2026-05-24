package project.linhadotempo.controllers;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
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
import project.linhadotempo.dtos.fullTimeline.TimelineFullCreateDTO;
import project.linhadotempo.dtos.fullTimeline.TimelineFullDTO;
import project.linhadotempo.dtos.timeline.TimelineCreateDTO;
import project.linhadotempo.dtos.timeline.TimelineDTO;
import project.linhadotempo.dtos.timeline.TimelineListDTO;
import project.linhadotempo.services.HistoryEventService;
import project.linhadotempo.services.TimelineService;

import java.util.UUID;

@RestController
@RequestMapping("/api/timelines")
@RequiredArgsConstructor
public class TimelineController {

    private final TimelineService service;
    private final HistoryEventService historyEventService;

    @Operation(
            summary = "Listar timelines acessíveis",
            description = "Retorna todas as timelines que o usuário autenticado pode acessar. Inclui timelines próprias (PRIVATE) e timelines públicas (PUBLIC)."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Lista de timelines retornada com sucesso"),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado"),
            @ApiResponse(responseCode = "403", description = "Acesso negado")
    })
    @GetMapping
    public Page<TimelineListDTO> getTimelines(
            @Parameter( 
                    description = "Paginação e ordenação (page, size, sort)",
                    example = "{\"page\": 0, \"size\": 10, \"sort\": \"name,asc\"}"
            )
            Pageable pageable
    ) {
        return service.getAccessibleTimelines(pageable);
    }

    @PostMapping("/full")
    @ResponseStatus(HttpStatus.CREATED)
    @Operation(summary = "Criar linha do tempo completa com eventos, unidades e conteúdos.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Linha do tempo criada com sucesso."),
            @ApiResponse(responseCode = "400", description = "Dados inválidos."),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado.")
    })
    public GenericResponseDTO createFullTimeline(
            @Valid @RequestBody TimelineFullCreateDTO dto
    ) {

        return service.createFullTimeline(dto);
    }

    @PutMapping("/full/{timelineId}")
    @ResponseStatus(HttpStatus.OK)
    @Operation(summary = "Atualizar linha do tempo completa.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Linha do tempo atualizada com sucesso."),
            @ApiResponse(responseCode = "400", description = "Dados inválidos."),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado."),
            @ApiResponse(responseCode = "404", description = "Linha do tempo não encontrada.")
    })
    public GenericResponseDTO updateFullTimeline(
            @PathVariable UUID timelineId,
            @Valid @RequestBody TimelineFullCreateDTO dto
    ) {

        return service.updateFullTimeline(
                timelineId,
                dto
        );
    }

    @GetMapping("/full/{timelineId}")
    @ResponseStatus(HttpStatus.OK)
    @Operation(summary = "Buscar linha do tempo completa.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Linha do tempo encontrada."),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado."),
            @ApiResponse(responseCode = "404", description = "Linha do tempo não encontrada.")
    })
    public TimelineFullDTO findFullById(
            @PathVariable UUID timelineId
    ) {

        return service.findFullById(timelineId);
    }

    @Operation(
            summary = "Obter linha do tempo por ID",
            description = "Retorna os eventos da linha do tempo informada, ordenados cronologicamente, incluindo o progresso do usuário autenticado."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Linha do tempo retornada com sucesso"),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado"),
            @ApiResponse(responseCode = "403", description = "Acesso negado à timeline"),
            @ApiResponse(responseCode = "404", description = "Linha do tempo não encontrada")
    })
    @GetMapping("/{timelineId}")
    public TimelineDTO getTimelineById(
            @Parameter(description = "ID da timeline", required = true)
            @PathVariable UUID timelineId
    ) {
        return historyEventService.getTimelineById(timelineId);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    @Operation(summary = "Criar linha do tempo")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Linha do tempo criada com sucesso."),
            @ApiResponse(responseCode = "400", description = "Dados inválidos."),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado.")
    })
    public GenericResponseDTO create(
            @Valid @RequestBody TimelineCreateDTO dto
    ) {
        return service.create(dto);
    }

    @GetMapping("/find/{timelineId}")
    @ResponseStatus(HttpStatus.OK)
    @Operation(summary = "Buscar linha do tempo por ID.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Linha do tempo encontrada."),
            @ApiResponse(responseCode = "404", description = "Linha do tempo não encontrada.")
    })
    public TimelineListDTO findById(
            @PathVariable UUID timelineId
    ) {

        return service.findTimelineById(timelineId);
    }

    @PutMapping("/update/{timelineId}")
    @ResponseStatus(HttpStatus.OK)
    @Operation(summary = "Atualizar linha do tempo.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Linha do tempo atualizada com sucesso."),
            @ApiResponse(responseCode = "400", description = "Dados inválidos."),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado."),
            @ApiResponse(responseCode = "404", description = "Linha do tempo não encontrada.")
    })
    public GenericResponseDTO update(
            @PathVariable UUID timelineId,
            @Valid @RequestBody TimelineCreateDTO dto
    ) {

        return service.update(timelineId, dto);
    }

    @DeleteMapping("/delete/{timelineId}")
    @ResponseStatus(HttpStatus.OK)
    @Operation(summary = "Remover linha do tempo.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Linha do tempo removida com sucesso."),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado."),
            @ApiResponse(responseCode = "404", description = "Linha do tempo não encontrada.")
    })
    public GenericResponseDTO delete(
            @PathVariable UUID timelineId
    ) {

        return service.delete(timelineId);
    }
}