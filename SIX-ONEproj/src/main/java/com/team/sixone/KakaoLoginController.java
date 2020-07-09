package com.team.sixone;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.sixone.service.LoginService;
import com.team.sixone.service.MemberService;

@Controller
public class KakaoLoginController {
	
	@Resource(name = "MemberService")
	private MemberService MemberService;
	
	@Resource(name = "LoginService")
	private LoginService LoginService;
	
	@ResponseBody
	@RequestMapping(value ="/kakaoLogin.do",produces ="text/html; charset=UTF-8" )
	public String kakaoLoginFirstCheck(@RequestParam Map map,HttpSession session) {
		int flag = MemberService.kakaoLoginFirstCheck(map);
		JSONObject json= new JSONObject();
		
		if(flag == 0) {///카카오 로그인 처음한경우
			MemberService.kakaomemberinsert(map);
			json.put("msg", "카카오톡첫로그인");
			return json.toJSONString();
		}
		else { //첫 로그인이 아닌경우
			json.put("msg", "카카오톡첫로그인아님");
			return json.toJSONString();
		}
	}
	
	@RequestMapping(value ="/kakaoisLogin.do",produces ="text/html; charset=UTF-8" )
	   public String kakaoisLogin(@RequestParam Map map,HttpSession session) {
	      String kakaoid = map.get("kakaoid").toString();
	      int flag = LoginService.iskakaoLogin(map);
	      if(flag != 0) {
	         session.setAttribute("LoginSuccess", kakaoid);
	         return "redirect:/";
	      }
	      else {
	         return "redirect:/";
	      }   
	   }
	
	
	
	
}
