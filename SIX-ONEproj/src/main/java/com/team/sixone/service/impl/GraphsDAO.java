package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.sixone.service.GraphsDTO;
import com.team.sixone.service.GraphsSerivce;

@Repository("GraphsDAO")
public class GraphsDAO implements GraphsSerivce{
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	public List<GraphsDTO> exercisecount(Map map){
		return sqlMapper.selectList("exercisecount", map);
		
	}

}
