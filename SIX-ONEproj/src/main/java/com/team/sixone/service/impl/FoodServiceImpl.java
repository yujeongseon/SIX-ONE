package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.team.sixone.service.FoodDTO;
import com.team.sixone.service.FoodService;

@Service("foodService")
public class FoodServiceImpl implements FoodService {

	@Resource(name="foodDAO")
	private FoodDAO dao;

	@Override
	public List<FoodDTO> selectFoodList(Map map) {
		return dao.selectFoodList(map);
	}

	@Override
	public FoodDTO selectFoodOne(Map map) {
		return dao.selectFoodOne(map);
	}

	@Override
	public int foodInsert(Map map) {
		return dao.foodInsert(map);
	}

	@Override
	public int foodUpdate(Map map) {
		return dao.foodUpdate(map);
	}

	@Override
	public int foodDelete(Map map) {
		return dao.foodDelete(map);
	}

	@Override
	public int foodreset(Map map) {
		return dao.foodreset(map);
	}

	@Override
	public List<FoodDTO> DateFood(Map map) {
		return dao.DateFood(map);
	}
	
	
	

	
	
	
}
