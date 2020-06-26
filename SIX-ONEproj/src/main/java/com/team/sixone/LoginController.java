package com.team.sixone;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import com.github.scribejava.core.model.OAuth2AccessToken;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.team.sixone.service.LoginService;


@Controller
public class LoginController {
	//서비스주입
	@Resource(name = "LoginService")
	private LoginService LoginService;
	@ResponseBody
	@RequestMapping(value="/Login.do",produces ="text/html; charset=UTF-8")
	public String isLogin(@RequestParam Map map,Model model,HttpSession session) {
		int flag = LoginService.isLogin(map);
		if(flag == 0) {
			String msg = "없는 계정 입니다";
			return msg;
		}
		else {
			session.setAttribute("LoginSuccess", map.get("id"));
			String msg = "로그인 성공";
			return msg;
		}
	}//////////isLogin
	
	@RequestMapping("/Logout.do")
	public String LogOut(HttpSession session) {
		session.invalidate();
		return"forward:/";
	}//////////LogOut
	
	
	
	
}///////////////////class
