package com.team.sixone;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController {
	@RequestMapping("/MyPage.do")
	public String MyPage() {
		return "/MyPage.tiles";
	}
}
