package com.team.sixone;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	@RequestMapping("/MyPage.do")
	public String MyPage() {
		return "/MyPage.tiles";
	}
}
