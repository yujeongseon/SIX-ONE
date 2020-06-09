package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.sixone.service.ExerciseDTO;
import com.team.sixone.service.ExerciseService;

@Repository("exerciseDAO")
public class ExerciseDAO implements ExerciseService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	
	@Override
	public List<ExerciseDTO> selectList() {
		return sqlMapper.selectList("exerciseSelectList");
	}

	@Override
	public ExerciseDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map map) {
		
		return sqlMapper.insert("exerciseInsert",map);
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
