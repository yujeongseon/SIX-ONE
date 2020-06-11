package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.sixone.service.LoginService;
import com.team.sixone.service.MemberDTO;
import com.team.sixone.service.MemberService;
@Repository
public class MemberDAO implements MemberService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<MemberDTO> MyPage(String SessionID) {
		return sqlMapper.selectList("MyPage",SessionID);
	}

	@Override
	public int weightUpdate(Map map) {
		return sqlMapper.update("weightUpdate",map);
	}

	
	
	
	
	
}
