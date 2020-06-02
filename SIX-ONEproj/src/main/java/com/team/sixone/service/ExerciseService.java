package com.team.sixone.service;

import java.util.List;
import java.util.Map;

public interface ExerciseService {

	//운동 목록
	List<ExerciseDTO> selectList();
	
	//하나 불러오기
	ExerciseDTO selectOne(Map map);
	
	//입력 수정 삭제
	int insert(Map map);
	int update(Map map);
	int delete(Map map);
	
	
	
	
}