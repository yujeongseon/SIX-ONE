package com.team.sixone.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.sixone.service.LoginService;
@Repository
public class LoginDAO implements LoginService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public int isLogin(Map map) {
		return sqlMapper.selectOne("isLogin",map);
	}
	
	
	
	
}
