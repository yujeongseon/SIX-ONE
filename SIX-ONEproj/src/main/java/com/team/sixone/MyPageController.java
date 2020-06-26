package com.team.sixone;

import java.io.File; 
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.team.sixone.service.FoodDTO;
import com.team.sixone.service.FoodService;
import com.team.sixone.service.LoginService;
import com.team.sixone.service.MemberDTO;
import com.team.sixone.service.MemberService;

@Controller
public class MyPageController {
	//서비스주입
		@Resource(name = "MemberService")
		private MemberService MemberService;
		@Resource(name="foodService")
		private FoodService FoodService;
		

	@RequestMapping("/MyPage.do")
	public String MyPage(Model model,HttpSession session,Map map){////마이페이지 이동
		String SessionID = (String) session.getAttribute("LoginSuccess");
		if(SessionID != null) { //로그인 되어있는 경우
		List<MemberDTO> MyPage = MemberService.MyPage(SessionID);
		model.addAttribute("list", MyPage);
		model.addAttribute("id",  session.getAttribute("LoginSuccess"));
		map.put("id", session.getAttribute("LoginSuccess"));
		List<FoodDTO> food = FoodService.selectFoodList(map);
		model.addAttribute("food", food);
		return "/MyPage.tiles";
		}
		else { //로그인 안된경우
			return "/home.tiles";
		}
	}///////////MyPage
	
	@ResponseBody
	@RequestMapping(value="/LoginCkeck.do",produces ="text/html; charset=UTF-8")
	public String LoginCkeck(HttpSession session) { //로그인 안하고 마이페이지 클릭시 얼터창 띄우기
		String SessionID = (String) session.getAttribute("LoginSuccess");
		String msg;
		if(SessionID instanceof String) {
			msg = "LoginError";
			return msg;
		}
		else {
			msg = "NotLogin";
			return msg;
		}
		
	}//////////LoginCkeck
	
	
	@RequestMapping("/weightUpdate.do")//마이페이지 몸무게 수정
	public String weightUpdate(@RequestParam Map map,HttpSession session,Model model) {
		MemberService.weightUpdate(map);
		String SessionID = (String) session.getAttribute("LoginSuccess");
		if(SessionID != null) { //로그인 되어있는 경우
		List<MemberDTO> MyPage = MemberService.MyPage(SessionID);
		model.addAttribute("list", MyPage);
		map.put("id", session.getAttribute("LoginSuccess"));
		List<FoodDTO> food = FoodService.selectFoodList(map);
		model.addAttribute("food", food);
		return "/MyPage.tiles";
		}
		else {
			
			return "/MyPage.tiles";
		}
		
	}//////////weightUpdate
	
	@RequestMapping("ProfileUpdate.do")
	public String ProfileUpdate(@RequestParam Map map,MultipartRequest request,HttpSession session,Model model) throws IllegalStateException, IOException {
		MultipartFile upload = (MultipartFile) request.getFile("file");
		String phisicalPath = "C:\\Users\\kosmo_11\\git\\SIX-ONE\\SIX-ONEproj\\src\\main\\webapp\\resources\\Profile";
		String profile = upload.getOriginalFilename().toString();
		if(profile.equals("")) {
			File file = new File(phisicalPath+File.separator+profile);
			map.put("file", profile);
			//upload.transferTo(file);
			MemberService.profileupdate(map);
		}
		else {
			String renameFile = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
			File file = new File(phisicalPath+File.separator+renameFile);
			map.put("file", renameFile);
			upload.transferTo(file);
			MemberService.profileupdate(map);
			
		}
		map.put("id", session.getAttribute("LoginSuccess"));
		List<FoodDTO> food = FoodService.selectFoodList(map);
		model.addAttribute("food", food);
		return "redirect:/MyPage.do";
	}
	
	
	
	
	
	
}//////////class
