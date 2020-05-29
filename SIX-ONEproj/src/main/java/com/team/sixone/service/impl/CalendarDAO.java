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
		return sqlMapper.selectList("calendarSelectList");
	}

	@Override
	public CalendarDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	

}
