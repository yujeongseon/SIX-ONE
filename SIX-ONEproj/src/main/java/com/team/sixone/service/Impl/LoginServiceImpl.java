package com.team.sixone.service.Impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.team.sixone.service.LoginService;
@Service("LoginService")
public class LoginServiceImpl implements LoginService{
	@Resource(name = "loginDAO")
	private LoginDAO dao;
	@Override
	public int isLogin(Map map) {
		return  dao.isLogin(map);
	}

}
