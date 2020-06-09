package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.team.sixone.service.ExerciseDTO;
import com.team.sixone.service.ExerciseService;

@Service("exerciseService")
public class ExerciseServiceImpl implements ExerciseService {

	@Resource(name="exerciseDAO")
	private ExerciseDAO dao;
	
	
	@Override
	public List<ExerciseDTO> selectList() {
		return dao.selectList();
	}

	@Override
	public ExerciseDTO selectOne(Map map) {
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

	
	
	
}
