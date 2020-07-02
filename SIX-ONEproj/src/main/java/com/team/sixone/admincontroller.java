package com.team.sixone;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class admincontroller {

	@RequestMapping("/admin.do")
  	public String gohome() {

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
