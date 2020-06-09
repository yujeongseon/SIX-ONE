package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.team.sixone.service.CalendarDTO;
import com.team.sixone.service.CalendarService;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {

	@Resource(name="calendarDAO")
	private CalendarDAO dao;

	
	@Override
	public List<CalendarDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public CalendarDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}
	
	public int insertCalendarRoutine(Map map) {
		return dao.insertCalendarRoutine(map);
	}
	

	@Override
	public int update(Map map) {
		return dao.update(map);
	}
	
	public int updateCalendarRoutine(Map map) {
		return dao.updateCalendarRoutine(map);
	}

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}
	
	public int deleteCalendarRoutine(Map map) {
		return dao.deleteCalendarRoutine(map);
	}

	@Override
	public int updateOne(Map map) {
		return dao.updateOne(map);
	}

	public List<CalendarDTO> selectRoutine(Map map) {
		return dao.selectRoutine(map);
	}

	
	
	
	
	
	
}
