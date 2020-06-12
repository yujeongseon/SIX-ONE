package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.sixone.service.CalendarDTO;
import com.team.sixone.service.CalendarService;
import com.team.sixone.service.ExerciseDTO;
import com.team.sixone.service.SubscribeDTO;
import com.team.sixone.service.SubscribeService;

@Repository("subscribeDAO")
public class SubscribeDAO implements SubscribeService {
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<SubscribeDTO> selectList(Map map) {
		return sqlMapper.selectList("subscribeSelectList",map);
	}

	@Override
	public ExerciseDTO selectOne(Map map) {
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
		return sqlMapper.delete("subscribeDelete", map);
	}
	

	
	
	

}
