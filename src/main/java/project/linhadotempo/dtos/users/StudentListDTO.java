package project.linhadotempo.dtos.users;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StudentListDTO {

    private UUID id;
    private String name;
    private String email;
    private Boolean alreadyInvited;
}