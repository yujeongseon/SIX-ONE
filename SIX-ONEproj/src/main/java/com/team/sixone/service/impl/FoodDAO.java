package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.sixone.service.ExerciseDTO;
import com.team.sixone.service.ExerciseService;
import com.team.sixone.service.FoodDTO;
import com.team.sixone.service.FoodService;

@Repository("foodDAO")
public class FoodDAO implements FoodService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<FoodDTO> selectFoodList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FoodDTO selectFoodOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int foodInsert(Map map) {
		return sqlMapper.insert("foodInsert",map);
	}

	@Override
	public int foodUpdate(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int foodDelete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	
	

}
