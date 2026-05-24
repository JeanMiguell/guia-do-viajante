package project.linhadotempo.dtos.progress;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StudentProgressSummaryDTO {

    private UUID studentId;
    private String name;
    private String email;
    private long unitsCompleted;
    private long totalUnits;
    private long activitiesApproved;
    private long activitiesAttempted;
}
