package project.linhadotempo.models;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;
import java.time.Instant;
import java.util.UUID;

@MappedSuperclass
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BaseEntity implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column
    private UUID id;

    @Column(name = "created_date_at")
    private Instant createdDateAt;

    @Column(name = "updated_date_at")
    private Instant updatedDateAt;

    @PrePersist
    protected void onCreate() {
        Instant now = Instant.now();
        createdDateAt = now;
        updatedDateAt = now;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedDateAt = Instant.now();
    }
}
