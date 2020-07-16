package com.team.sixone.service.impl;

import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.team.sixone.service.LoginService;
@Repository
public class LoginDAO implements LoginService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Inject
	PasswordEncoder passwordEncoder;
	
	@Override
	public String isLogin(Map map) {
		
		
		String isLoginResult = null;
		if(map.containsKey("phone")) {
			isLoginResult = sqlMapper.selectOne("isLoginPhone",map);
		}
		else {
		
			Map result = sqlMapper.selectOne("isLogin",map);
			String password = result.get("PASSWORD").toString();
			
			boolean flag = passwordEncoder.matches(map.get("password").toString(), password);
			
			if(flag) {
				isLoginResult = result.get("NAME").toString();
			}
		}
	
		return isLoginResult;
	}

	@Override
	public String iskakaoLogin(Map map) {
		return sqlMapper.selectOne("iskakaoLogin",map);
	}
	
	
	
	
}
