package project.linhadotempo.controllers;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.linhadotempo.dtos.units.EventResultDTO;
import project.linhadotempo.services.ActivityResultService;

import java.util.List;

@RestController
@RequestMapping("/api/results")
@RequiredArgsConstructor
@Tag(name = "Resultados", description = "Endpoints relacionados ao desempenho do usuário nas unidades e eventos")
public class ResultController {

    private final ActivityResultService resultService;

    @Operation(
            summary = "Listar resultados do usuário",
            description = "Retorna todos os marcos históricos com suas respectivas unidades e o status de progresso do usuário, incluindo quantidade de acertos e total de questões por unidade."
    )
    @ApiResponse(responseCode = "200", description = "Resultados retornados com sucesso")
    @GetMapping
    public List<EventResultDTO> getUserResults() {

        return resultService.getUserResults();
    }
}
