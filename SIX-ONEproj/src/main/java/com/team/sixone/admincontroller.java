package com.team.sixone;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class admincontroller {

	@RequestMapping("/admin.do")
  	public String gohome(Model model) {
		Map map = new HashMap();
		
		AdminDAO dao = new AdminDAO(null);
		//남녀 비율
		map=dao.getmember();
		int man = (int) map.get("man");
		int woman = (int) map.get("woman");
		int hap = man + woman; //총 회원수
		int manpersent = ((man*100)/hap);// 남자 %
		int womanpersent = 100-manpersent;// 여자%
		model.addAttribute("memberhap",hap);
		model.addAttribute("woman",woman);
		model.addAttribute("man",man);
		model.addAttribute("manpersent",manpersent);
		model.addAttribute("womanpersent",womanpersent);
		//루틴글 수
		map=dao.getroutine();
		int routinehap = (int) map.get("routinehap");
		model.addAttribute("routinehap", routinehap);
  		return "admin";
  	}
	
	@RequestMapping("/moris.do")
  	public String gomoris() {

  		return "adminmoris";
  	}
	
	@RequestMapping("/chart.do")
  	public String gochart() {

  		return "adminchart";
  	}
	
	@RequestMapping("/icon.do")
  	public String goicon() {

  		return "adminicon";
  	}
	
	
	
}
