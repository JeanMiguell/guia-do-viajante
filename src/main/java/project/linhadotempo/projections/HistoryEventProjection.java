package project.linhadotempo.projections;

import java.time.LocalDate;
import java.util.UUID;

public interface HistoryEventProjection {

    UUID getId();
    String getName();
    String getDescription();
    LocalDate getStartYear();
    LocalDate getEndYear();
    String getPeriodDescription();
    String getEventType();
    String getIntroText();
}