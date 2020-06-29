package com.team.sixone;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
		else{
			session.setAttribute("LoginSuccess", map.get("id"));
			String msg = "로그인 성공";
			return msg;
		}
		
	}//////////isLogin
	
	@RequestMapping("Logout.do")
	public String LogOut(HttpSession session) {
		session.removeAttribute("LoginSuccess");
	    session.removeAttribute("id");
	    
	    return"forward:/";
	}//////////LogOut
	
	
	@RequestMapping("/kakaoisLogin.do")
	public String iskakaoLogin(@RequestParam Map map,HttpSession session) {
			String msg = null;
			int flag = LoginService.iskakaoLogin(map);
			if(flag == 1) {
			session.setAttribute("LoginSuccess", map.get("kakaoid"));
			return"forward:/";
			}
			else {
				
			return msg;
			}
			
		
	}
	
}///////////////////class
