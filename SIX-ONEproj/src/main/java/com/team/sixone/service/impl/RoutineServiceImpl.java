package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.team.sixone.service.RoutineDTO;
import com.team.sixone.service.RoutineService;

@Service("routineService")
public class RoutineServiceImpl implements RoutineService{
	
	@Resource(name="routineDAO")
	private RoutineDAO dao;

	@Override
	public List<RoutineDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public List<RoutineDTO> selectOne(Map map) {
		return dao.selectOne(map);
	}

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}

	@Override
	public int updateOne(Map map) {
		return dao.updateOne(map);
	}
	
	

}
