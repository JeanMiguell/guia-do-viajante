package project.linhadotempo.dtos.fullTimeline;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UnitFullDTO {

    private UUID id;

    private String title;

    private String description;

    private Integer orderIndex;

    private List<UnitContentFullDTO> contents;
}