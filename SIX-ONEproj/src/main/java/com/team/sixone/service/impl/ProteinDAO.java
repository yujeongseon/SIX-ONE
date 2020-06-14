package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.team.sixone.service.CalendarDTO;
import com.team.sixone.service.CalendarService;
import com.team.sixone.service.ProteinDTO;

@Service("proteinDAO")
@Repository("proteinDAO")
public class ProteinDAO {
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	

	public List<ProteinDTO> selectProtein() {
		return sqlMapper.selectList("proteinSelect");
	}
	
	
	

}
