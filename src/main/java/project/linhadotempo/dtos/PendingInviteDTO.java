package project.linhadotempo.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PendingInviteDTO {

    private UUID inviteId;
    private UUID timelineId;
    private String timelineName;
    private String teacherName;
}