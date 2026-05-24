package project.linhadotempo.controllers;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import project.linhadotempo.dtos.ActivityProgressDTO;
import project.linhadotempo.dtos.AnswerResponseDTO;
import project.linhadotempo.dtos.GenericResponseDTO;
import project.linhadotempo.dtos.fullQuestions.ActivityFullCreateDTO;
import project.linhadotempo.dtos.fullQuestions.ActivityFullDTO;
import project.linhadotempo.dtos.timeline.TimelineEvaluationDTO;
import project.linhadotempo.dtos.questions.ActivityDTO;
import project.linhadotempo.dtos.questions.ActivityResultResponseDTO;
import project.linhadotempo.dtos.questions.AnswerRequestDTO;
import project.linhadotempo.enums.ActivityType;
import project.linhadotempo.models.User;
import project.linhadotempo.services.ActivityService;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("api/activities")
@RequiredArgsConstructor
@Tag(name = "Atividades", description = "Operações a listagem e respostas de atividades no sistema.")
public class ActivityController {

    private final ActivityService activityService;

    @PostMapping("/full/batch")
    @ResponseStatus(HttpStatus.CREATED)
    @Operation(summary = "Criar múltiplas atividades de uma vez.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Atividades criadas com sucesso."),
            @ApiResponse(responseCode = "400", description = "Dados inválidos."),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado.")
    })
    public List<GenericResponseDTO> createFullActivitiesBatch(
            @RequestBody List<ActivityFullCreateDTO> dtos
    ) {
        return activityService.createFullActivitiesBatch(dtos);
    }

    @PostMapping("/full")
    @ResponseStatus(HttpStatus.CREATED)
    @Operation(summary = "Criar atividade completa com questões e respostas.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Atividade criada com sucesso."),
            @ApiResponse(responseCode = "400", description = "Dados inválidos."),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado.")
    })
    public GenericResponseDTO createFullActivity(
            @Valid @RequestBody ActivityFullCreateDTO dto
    ) {

        return activityService.createFullActivity(
                dto
        );
    }

    @PutMapping("/full/{activityId}")
    @ResponseStatus(HttpStatus.OK)
    @Operation(summary = "Atualizar atividade completa.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Atividade atualizada com sucesso."),
            @ApiResponse(responseCode = "400", description = "Dados inválidos."),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado."),
            @ApiResponse(responseCode = "404", description = "Atividade não encontrada.")
    })
    public GenericResponseDTO updateFullActivity(
            @PathVariable UUID activityId,
            @Valid @RequestBody ActivityFullCreateDTO dto
    ) {

        return activityService.updateFullActivity(
                activityId,
                dto
        );
    }

    @GetMapping("/timeline/{timelineId}")
    @ResponseStatus(HttpStatus.OK)
    @Operation(summary = "Buscar atividades da timeline.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Atividades encontradas."),
            @ApiResponse(responseCode = "401", description = "Usuário não autenticado."),
            @ApiResponse(responseCode = "404", description = "Timeline não encontrada.")
    })
    public Page<ActivityFullDTO> findActivitiesByTimeline(
            @PathVariable UUID timelineId,
            @RequestParam(required = false) ActivityType type,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {
        return activityService.findActivitiesByTimeline(timelineId, type, PageRequest.of(page, size));
    }

    @Operation(
            summary = "Listar atividades por unidade",
            description = "Retorna todas as atividades de uma unidade (fixação)."
    )
    @GetMapping("/unit/{unitId}")
    public List<ActivityDTO> getByUnit(@PathVariable UUID unitId) {
        return activityService.getActivitiesByUnit(unitId);
    }

    @Operation(
            summary = "Listar atividades por evento",
            description = "Retorna as atividades avaliativas de um evento."
    )
    @GetMapping("/event/{eventId}")
    public List<ActivityDTO> getByEvent(@PathVariable UUID eventId) {
        return activityService.getActivitiesByEvent(eventId);
    }

    @Operation(
            summary = "Buscar atividade",
            description = "Retorna uma atividade com suas perguntas e alternativas."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Atividade encontrada com sucesso"),
            @ApiResponse(responseCode = "404", description = "Atividade não encontrada")
    })
    @GetMapping("/{activityId}")
    public ActivityDTO getActivity(@PathVariable UUID activityId) {
        return activityService.getActivity(activityId);
    }

    @Operation(
            summary = "Responder uma pergunta",
            description = "Recebe a resposta do usuário para uma pergunta e retorna se está correta."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Resposta processada com sucesso"),
            @ApiResponse(responseCode = "400", description = "Dados inválidos"),
            @ApiResponse(responseCode = "404", description = "Pergunta ou alternativa não encontrada")
    })
    @PostMapping("/answer")
    public AnswerResponseDTO answer(@RequestBody AnswerRequestDTO request) {
        return activityService.answerQuestion(request);
    }

    @Operation(
            summary = "Finalizar atividade",
            description = "Calcula o resultado final da atividade com base nas respostas do usuário."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Atividade finalizada com sucesso"),
            @ApiResponse(responseCode = "400", description = "Atividade incompleta"),
            @ApiResponse(responseCode = "404", description = "Atividade não encontrada")
    })
    @PostMapping("/{activityId}/finish")
    public ActivityResultResponseDTO finish(@PathVariable UUID activityId) {
        return activityService.finishActivity(activityId);
    }

    @Operation(
            summary = "Obter progresso da atividade",
            description = "Retorna o progresso do usuário na atividade."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Progresso retornado com sucesso"),
            @ApiResponse(responseCode = "404", description = "Atividade não encontrada")
    })
    @GetMapping("/{activityId}/progress")
    public ActivityProgressDTO getProgress(@PathVariable UUID activityId) {
        return activityService.getProgress(activityId);
    }

    @Operation(
            summary = "Listar avaliações por evento",
            description = "Retorna as avaliações de um evento com status de liberação"
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Avaliações retornadas com sucesso"),
            @ApiResponse(responseCode = "404", description = "Evento não encontrado")
    })
    @GetMapping("/timeline/{timelineId}/evaluations")
    public Page<TimelineEvaluationDTO> getEvaluationsByTimeline(
            @PathVariable UUID timelineId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @AuthenticationPrincipal User user
    ) {
        return activityService.getEvaluationsByTimeline(
                timelineId,
                PageRequest.of(page, size),
                user
        );
    }
}