package com.team.sixone.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface GraphsSerivce {
	List<GraphsDTO> exercisecount(Map map);
	List<ExerciseNameDTO> exerciseonename(Map map);
}
