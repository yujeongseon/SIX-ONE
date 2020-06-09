package com.team.sixone;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChallengeController {

	@RequestMapping("/challenge.do")
	public String challenge(Locale locale, Model model) {
		
		return "/Challenge.tiles";
	}
	
	@RequestMapping("/challengeInfo.do")
	public String challengeInfo(Locale locale, Model model) {
		
		return "/ChallengeInfo.tiles";
	}
	
	
	
	
	
}
