package com.team.sixone.service;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface LoginService {
	String isLogin(Map map);
	
	String iskakaoLogin(Map map);
}
