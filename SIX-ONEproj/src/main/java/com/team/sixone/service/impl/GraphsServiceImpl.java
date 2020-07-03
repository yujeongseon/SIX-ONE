package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.team.sixone.service.GraphsDTO;
import com.team.sixone.service.GraphsSerivce;

@Service("GraphsSerivce")
public class GraphsServiceImpl implements GraphsSerivce{
	
	@Resource(name="GraphsDAO")
	private GraphsDAO dao;

	@Override
	public List<GraphsDTO> exercisecount(Map map) {
		return dao.exercisecount(map);
	}

	@Override
	public List<GraphsDTO> exerciseonename(Map map) {
		return dao.exercisecount(map);
	}


	
	
		
	
}
