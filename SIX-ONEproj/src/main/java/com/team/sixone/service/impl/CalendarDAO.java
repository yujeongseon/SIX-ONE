package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.sixone.service.CalendarDTO;
import com.team.sixone.service.CalendarService;

@Repository("calendarDAO")
public class CalendarDAO implements CalendarService {
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	

	@Override
	public List<CalendarDTO> selectList(Map map) {
		
		List<CalendarDTO> list2 = sqlMapper.selectList("calendarSelectRoutine",map); 
		
		List<CalendarDTO> list = sqlMapper.selectList("calendarSelectList",map);
		list.addAll(list2);
		return list;
	}

	@Override
	public CalendarDTO selectOne(Map map) {
		return null;
	}

	@Override
	public int insert(Map map) {
		return sqlMapper.insert("calendarInsert",map);
	}

	public int insertCalendarRoutine(Map map) {
		return sqlMapper.insert("insertCalendarRoutine",map);
	}
	
	@Override
	public int update(Map map) {
		return sqlMapper.update("calendarUpdate", map);
	}
	
	public int updateCalendarRoutine(Map map) {
		return sqlMapper.insert("updateCalendarRoutine",map);
	}
	

	@Override
	public int delete(Map map) {
		return sqlMapper.delete("calendarDelete",map);
	}
	
	public int deleteCalendarRoutine(Map map) {
		return sqlMapper.delete("deleteCalendarRoutine",map);
	}

	@Override
	public int updateOne(Map map) {
		return sqlMapper.update("calendarUpdateOne",map);
	}

	public List<CalendarDTO> selectRoutine(Map map) {
		return sqlMapper.selectList("calendarSelectRoutine",map);
	}
	
	
	

}
