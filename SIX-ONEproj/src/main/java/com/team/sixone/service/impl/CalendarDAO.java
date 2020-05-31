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
	public List<CalendarDTO> selectList() {
		List<CalendarDTO> list = sqlMapper.selectList("calendarSelectListRoutine");
		List<CalendarDTO> list2 = sqlMapper.selectList("calendarSelectList");
		list.addAll(list2);
		
		return list;
	}

	@Override
	public CalendarDTO selectOne(Map map) {
		return null;
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		return sqlMapper.update("calendarUpdate", map);
	}

	@Override
	public int delete(Map map) {
		return sqlMapper.delete("calendarDelete",map);
	}
	
	
	

}
