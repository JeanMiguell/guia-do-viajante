package project.linhadotempo.models;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import project.linhadotempo.enums.TimelineStatus;
import project.linhadotempo.enums.TimelineVisibility;

import java.util.List;

@Entity
@Table(name = "timelines")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Timeline extends BaseEntity {

    @Column(nullable = false)
    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private User user;

    @Column(name = "is_default")
    private Boolean isDefault = false;

    @OneToMany(mappedBy = "timeline", cascade = CascadeType.ALL)
    private List<HistoryEvent> historyEvents;

    @Column(name = "image_url", length = 500)
    private String imageUrl;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private TimelineVisibility visibility;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private TimelineStatus status;

}