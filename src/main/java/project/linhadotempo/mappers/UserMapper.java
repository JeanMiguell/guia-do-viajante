package project.linhadotempo.mappers;

import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;
import project.linhadotempo.dtos.users.UserDTO;
import project.linhadotempo.projections.UserProjection;

@Component
@RequiredArgsConstructor
public class UserMapper {

    private final ModelMapper modelMapper;

    public UserDTO toDTO(UserProjection projection) {
        return modelMapper.map(projection, UserDTO.class);
    }
}