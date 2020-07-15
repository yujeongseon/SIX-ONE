package com.team.sixone.service;

import java.util.List;
import java.util.Map;


public interface FoodService {

	// 리스트 가져오기
	List<FoodDTO> selectFoodList(Map map);
	
	// 하나만 가져오기
	FoodDTO selectFoodOne(Map map);
	
	//입력 수정 삭제
	int foodInsert(Map map);
	int foodUpdate(Map map);
	int foodDelete(Map map);
	int foodreset(Map map);
	
	List<FoodDTO> DateFood(Map map);
	
}
