package project.linhadotempo.controllers;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.linhadotempo.dtos.progress.StudentDetailedProgressDTO;
import project.linhadotempo.dtos.progress.StudentProgressSummaryDTO;
import project.linhadotempo.services.TeacherProgressService;

import java.util.UUID;

@RestController
@RequestMapping("/api/timelines/{timelineId}/students")
@RequiredArgsConstructor
@Tag(name = "Progresso dos Estudantes", description = "Endpoints para professores acompanharem o progresso dos alunos em suas linhas do tempo.")
public class TeacherProgressController {

    private final TeacherProgressService service;

    @Operation(summary = "Listar alunos com resumo de progresso")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Lista de alunos retornada com sucesso"),
            @ApiResponse(responseCode = "403", description = "Você não possui acesso a esta linha do tempo"),
            @ApiResponse(responseCode = "404", description = "Linha do tempo não encontrada")
    })
    @GetMapping
    public Page<StudentProgressSummaryDTO> getStudentsSummary(
            @PathVariable UUID timelineId,
            Pageable pageable
    ) {
        return service.getStudentsSummary(timelineId, pageable);
    }

    @Operation(summary = "Ver progresso detalhado de um aluno")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Progresso do aluno retornado com sucesso"),
            @ApiResponse(responseCode = "403", description = "Você não possui acesso a esta linha do tempo"),
            @ApiResponse(responseCode = "404", description = "Linha do tempo ou aluno não encontrado")
    })
    @GetMapping("/{studentId}/progress")
    public StudentDetailedProgressDTO getStudentDetail(
            @PathVariable UUID timelineId,
            @PathVariable UUID studentId
    ) {
        return service.getStudentDetail(timelineId, studentId);
    }
}
