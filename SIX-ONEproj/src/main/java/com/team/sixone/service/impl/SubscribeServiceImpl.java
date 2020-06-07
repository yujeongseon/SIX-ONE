package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.team.sixone.service.ExerciseDTO;
import com.team.sixone.service.SubscribeDTO;
import com.team.sixone.service.SubscribeService;

@Service("subscribeService")
public class SubscribeServiceImpl implements SubscribeService {

	@Resource(name="subscribeDAO")
	private SubscribeDAO dao;
	
	
	@Override
	public List<SubscribeDTO> selectList(Map map) {
		return dao.selectList(map);
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
