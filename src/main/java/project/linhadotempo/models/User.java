package project.linhadotempo.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import project.linhadotempo.enums.UserAuth;
import project.linhadotempo.enums.UserGender;
import project.linhadotempo.enums.UserType;

import java.time.LocalDate;
import java.util.Collection;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Entity
@Getter
@Setter
@Table(name = "users")
@NoArgsConstructor
@AllArgsConstructor
public class User extends BaseEntity implements UserDetails {

    @Column(nullable = false, length = 100)
    private String name;

    @Column(name = "birth_date")
    private LocalDate birthDate;

    @Column(length = 20)
    @Enumerated(EnumType.STRING)
    private UserGender gender;

    @Column(nullable = false, unique = true, length = 100)
    private String email;

    @Column(name = "encrypted_password", nullable = false)
    private String password;

    @Column(name = "auth_provider", length = 50)
    @Enumerated(EnumType.STRING)
    private UserAuth authProvider;

    @Column(length = 500)
    private String avatar;

    @Column(name = "user_type", length = 20)
    @Enumerated(EnumType.STRING)
    private UserType userType;

    @Column(name = "additional_data_completed")
    private Boolean additionalDataCompleted = false;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of();
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override public boolean isAccountNonExpired() { return true; }
    @Override public boolean isAccountNonLocked() { return true; }
    @Override public boolean isCredentialsNonExpired() { return true; }
    @Override public boolean isEnabled() { return true; }
}