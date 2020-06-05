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
		map.put("id", "kim");
		List<CalendarDTO> list = sqlMapper.selectList("calendarSelectList",map);
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

	@Override
	public int update(Map map) {
		return sqlMapper.update("calendarUpdate", map);
	}

	@Override
	public int delete(Map map) {
		return sqlMapper.delete("calendarDelete",map);
	}

	@Override
	public int updateOne(Map map) {
		sqlMapper.update("calendarUpdateOneExe",map);
		return sqlMapper.update("calendarUpdateOne",map);
	}
	
	
	

}
