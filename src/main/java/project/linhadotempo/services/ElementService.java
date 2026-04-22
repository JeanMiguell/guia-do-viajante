package project.linhadotempo.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.linhadotempo.dtos.elements.ElementDTO;
import project.linhadotempo.mappers.ElementMapper;
import project.linhadotempo.projections.ElementProjection;
import project.linhadotempo.repositories.ElementRepository;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ElementService {

    private final ElementRepository elementRepository;
    private final ElementMapper elementMapper;

    public List<ElementDTO> getElementsByContent(UUID contentId) {

        List<ElementProjection> projections =
                elementRepository.findByContentId(contentId);

        return projections.stream()
                .map(elementMapper::toDTO)
                .toList();
    }
}