package com.team.sixone;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
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
	  int flag = LoginService.isLogin(map);
      if (map.containsKey("phone")) {
         if (flag == 0) {
            String msg = "login fail";
            resp.sendRedirect("/sixone/home.do");
            return "home.tiles";
         } else {
            session.setAttribute("LoginSuccess", map.get("id"));
            String msg = "login success";
            resp.sendRedirect("/sixone/home.do");
            return "home.tiles";
         }
      } else {
      
      if(flag == 0) {
         String msg = "없는 계정 입니다";
         return msg;
      }
      else {
         session.setAttribute("LoginSuccess", map.get("id"));
         String msg = "로그인 성공";
         return msg;
      }}
   }//////////isLogin
   
   /*
   @RequestMapping("/Logout.do")
   public String LogOut(HttpSession session) {
      session.invalidate();
      return"redirect:/";
   }//////////LogOut
  */
   
   
}///////////////////class