package com.team.sixone;

import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.sixone.service.FoodService;

@Controller
public class FoodController {
	@Resource(name="foodService")
	private FoodService FoodService;
	
	@RequestMapping("/food.do")
	public String food(Locale locale, Model model) {
		
		return "/Food.tiles";
	}
	
	@RequestMapping("/foodreset.do")
	public String foodreset(HttpSession session,Map map) {
		map.put("id", session.getAttribute("LoginSuccess"));
		FoodService.foodreset(map);
		return "redirect:/MyPage.do";
	}

}
