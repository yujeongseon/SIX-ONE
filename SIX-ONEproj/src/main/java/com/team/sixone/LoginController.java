package com.team.sixone;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
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
   public String isLogin(@RequestParam Map map,Model model,HttpSession session, HttpServletResponse resp,Authentication auth) throws IOException {
	  
	  String flag = LoginService.isLogin(map);      
	  if (map.containsKey("phone")) {
         if (flag == null) {
            String msg = "login fail";
            resp.sendRedirect("/sixone/home.do");
            return "home.tiles";
         } else {
            session.setAttribute("LoginSuccess", map.get("id"));
            session.setAttribute("Name", flag);
            String msg = "login success";
            resp.sendRedirect("/sixone/home.do");
            return "home.tiles";
         }
      } else {
      
      if(flag == null) {
         String msg = "없는 계정 입니다";
         return msg;
      }
      else {
    	  String msg;
    	  String rea;
    	  	AdminDAO dao = new AdminDAO(null);
    	  	rea=dao.band(map.get("id").toString());
    	  	if(!(rea.equals("1"))) {
    	  		session.setAttribute("ban", rea);
    	  		return "ban";
    	  	}
			session.setAttribute("LoginSuccess", map.get("id"));
			session.setAttribute("Name", flag);
			if(map.get("id").equals("admin")) {
				msg = "admin";
				return msg;
			}
			msg = "로그인 성공";
			return msg;
      }}
   }//////////isLogin
   
   /*
   @RequestMapping("/Logout.do")
   public String LogOut(HttpSession session) {
      session.removeAttribute("LoginSuccess");
	  session.removeAttribute("id");
      return"redirect:/";
   }//////////LogOut
  */
   
   
}///////////////////class