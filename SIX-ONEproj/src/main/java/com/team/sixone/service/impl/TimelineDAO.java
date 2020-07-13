package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.sixone.service.TimelineDTO;
import com.team.sixone.service.TimelineService;

@Repository("TimelineDAO")
public class TimelineDAO implements TimelineService{
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public int timeline(Map map) {
		return sqlMapper.insert("timeline", map);
	}

	@Override
	public List<TimelineDTO> timelinecontent(Map map) {
		return sqlMapper.selectList("timelinecontent", map);
	}

	@Override
	public int NoImagetimeline(Map map) {
		return sqlMapper.insert("NoImagetimeline", map);
	}

}
