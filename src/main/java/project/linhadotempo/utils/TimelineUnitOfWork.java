package project.linhadotempo.utils;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import project.linhadotempo.repositories.HistoryEventRepository;
import project.linhadotempo.repositories.TimelineRepository;
import project.linhadotempo.repositories.UnitContentRepository;
import project.linhadotempo.repositories.UnitRepository;

@Component
@RequiredArgsConstructor
public class TimelineUnitOfWork {

    public final TimelineRepository timelineRepository;

    public final HistoryEventRepository historyEventRepository;

    public final UnitRepository unitRepository;

    public final UnitContentRepository unitContentRepository;
}
