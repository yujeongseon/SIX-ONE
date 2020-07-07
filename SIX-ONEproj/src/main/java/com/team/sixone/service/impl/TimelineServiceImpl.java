package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.team.sixone.service.TimelineDTO;
import com.team.sixone.service.TimelineService;

@Service("TimelineService")
public class TimelineServiceImpl implements TimelineService {
	@Resource(name="TimelineDAO")
	private TimelineDAO dao;
	
	@Override
	public int timeline(Map map) {
		return dao.timeline(map);
	}

	@Override
	public List<TimelineDTO> timelinecontent(Map map) {
		return dao.timelinecontent(map);
	}

}
