package project.linhadotempo.mappers;

import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;
import project.linhadotempo.dtos.timeline.TimelineEvaluationDTO;
import project.linhadotempo.models.ActivityResult;
import project.linhadotempo.projections.TimelineEvaluationProjection;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class ActivityMapper {

    private final ModelMapper modelMapper;

    public TimelineEvaluationDTO toDTO(
            TimelineEvaluationProjection projection,
            boolean available,
            Optional<ActivityResult> existingResult
    ) {
        TimelineEvaluationDTO dto =
                modelMapper.map(projection, TimelineEvaluationDTO.class);

        dto.setAvailable(available);
        dto.setImageUrl(projection.getImageUrl());
        dto.setMinimumScore(projection.getMinimumScore());
        dto.setQuestionCount(projection.getQuestionCount());
        dto.setAlreadyCompleted(existingResult.isPresent());
        dto.setPreviousScore(existingResult.map(ActivityResult::getScore).orElse(null));
        dto.setPreviousApproved(existingResult.map(ActivityResult::getApproved).orElse(null));

        return dto;
    }
}
