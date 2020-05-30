package com.team.sixone;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	@RequestMapping("/Login.do")
	public String Login(Model model) {
		System.out.println("로그인컨트롤러");
		return"home.tiles";
	}
}
