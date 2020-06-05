package com.team.sixone;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FoodController {
	
	@RequestMapping("/food.do")
	public String food(Locale locale, Model model) {
		
		return "/Food.tiles";
	}

}
