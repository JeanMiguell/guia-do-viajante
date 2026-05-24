package project.linhadotempo.models;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "history_events")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class HistoryEvent extends BaseEntity implements Serializable {

    @Column(nullable = false, length = 255)
    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(name = "start_year")
    private LocalDate startYear;

    @Column(name = "end_year")
    private LocalDate endYear;

    @Column(name = "period_description", length = 255)
    private String periodDescription;

    @Column(name = "event_type", length = 50)
    private String eventType;

    @Column(name = "intro_text", columnDefinition = "TEXT")
    private String introText;

    @Column(name = "image_url", length = 500)
    private String imageUrl;

    @Column(name = "order_index", nullable = false)
    private Integer orderIndex;

    @ManyToOne
    @JoinColumn(name = "timeline_id", nullable = false)
    private Timeline timeline;

    @OneToMany(
            mappedBy = "historyEvent",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<Unit> units =
            new ArrayList<>();

}