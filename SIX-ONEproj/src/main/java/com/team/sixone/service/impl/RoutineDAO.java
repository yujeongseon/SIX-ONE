package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.sixone.service.RoutineDTO;
import com.team.sixone.service.RoutineService;

@Repository("routineDAO")
public class RoutineDAO implements RoutineService {

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public List<RoutineDTO> selectList(Map map) {
		return sqlMapper.selectList("routineSelectList", map);
	}

	@Override
	public RoutineDTO selectOne(Map map) {
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

	@Override
	public int updateOne(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	

}
