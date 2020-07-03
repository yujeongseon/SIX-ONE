package com.team.sixone;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.sixone.service.LoginService;
import com.team.sixone.service.MemberDTO;
import com.team.sixone.service.MemberService;

@Controller
public class LoginController {
   //서비스주입
   @Resource(name = "LoginService")
   private LoginService LoginService;
   @Resource(name = "MemberService")
	private MemberService MemberService;
   
   @ResponseBody
   @RequestMapping(value="/Login.do",produces ="text/html; charset=UTF-8")
   public String isLogin(@RequestParam Map map,Model model,HttpSession session, HttpServletResponse resp) throws IOException {
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
   
   @RequestMapping("/Logout.do")
   public String LogOut(HttpSession session) {
      session.invalidate();
      return"redirect:/";
   }//////////LogOut
   
   
   
   @RequestMapping("/passwordsearch.do")
   public String passsearch() {
	   return "PassWordSearch.tiles";
   }
   
   @ResponseBody
   @RequestMapping(value = "/find.do",produces ="text/html; charset=UTF-8")
   public String passwordfind(@RequestParam Map map) {
	   JSONObject json = new JSONObject();
	   List<MemberDTO> list = MemberService.passsearch(map);
	   if(list.isEmpty()) {
		   json.put("없는회원", "없는 회원 입니다. 아이디, 질문, 대답을 제대로 입력해주세요.");
		   return json.toJSONString();
	   }
	   else {
		   for(MemberDTO m : list) {
			   json.put("id", m.getId());
			  json.put("password", "회원님의 비밀번호는 "+m.getPassword()+" 입니다.\r\n자동 로그인 후 마이페이지로 이동하시겠습니까?");
		   }
		   return json.toJSONString();
	   }
   }///////////////passwordfind
   
   
   
   @RequestMapping("/searchLogin.do")
   public String searchLogin(@RequestParam Map map,HttpSession session){
	   session.setAttribute("LoginSuccess", map.get("id"));
	   return "redirect:/MyPage.do";
   }
   
   
}///////////////////class