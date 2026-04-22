package project.linhadotempo.controllers;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.linhadotempo.dtos.elements.ElementDTO;
import project.linhadotempo.services.ElementService;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("api/contents")
@RequiredArgsConstructor
@Tag(name = "Elementos", description = "Operações relacionadas aos elementos interativos de um conteúdo")
public class ElementController {

    private final ElementService elementService;

    @Operation(
            summary = "Buscar elementos interativos do conteúdo",
            description = "Retorna todos os elementos interativos associados a uma página de conteúdo específica. " +
                    "Esses elementos representam hotspots clicáveis exibidos sobre a imagem do conteúdo."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Elementos retornados com sucesso"),
            @ApiResponse(responseCode = "404", description = "Conteúdo não encontrado"),
            @ApiResponse(responseCode = "401", description = "Não autenticado")
    })
    @GetMapping("/{contentId}/elements")
    public List<ElementDTO> getElements(
            @Parameter(
                    description = "ID do conteúdo da unidade",
                    example = "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                    required = true
            )
            @PathVariable UUID contentId
    ) {
        return elementService.getElementsByContent(contentId);
    }
}