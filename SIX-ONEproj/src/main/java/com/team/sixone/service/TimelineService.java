package com.team.sixone.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface TimelineService {
	int timeline(Map map);
	List<TimelineDTO> timelinecontent (Map map);
}
