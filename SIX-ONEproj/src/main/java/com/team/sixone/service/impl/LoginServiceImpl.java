package com.team.sixone.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.team.sixone.service.LoginService;
@Service("LoginService")
public class LoginServiceImpl implements LoginService{
	@Resource(name = "loginDAO")
	private LoginDAO dao;
	@Override
	public String isLogin(Map map) {
		return  dao.isLogin(map);
	}
	@Override
	public String iskakaoLogin(Map map) {
		return dao.iskakaoLogin(map);
	}

}
