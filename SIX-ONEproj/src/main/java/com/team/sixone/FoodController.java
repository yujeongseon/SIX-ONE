package com.team.sixone;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.sixone.service.impl.FoodServiceImpl;

@Controller
public class FoodController {
	
	@Resource(name="foodService")
	private FoodServiceImpl foodDAO;
	
		
	
	@RequestMapping("/food.do")
	public String food(Locale locale, Model model) {
		
		return "/Food.tiles";
	}
	
	@RequestMapping("/food.insert")
	@ResponseBody
	public String foodInsert(@RequestParam Map map,HttpSession session) {
		String id = session.getAttribute("LoginSuccess").toString();
		map.put("id",id);
		
		String[] foodNames = map.get("foodName").toString().split(",");
		String[] foodKcals = map.get("foodKcal").toString().split(",");
		
		int result = 0;
		for(int i = 0 ; i < foodNames.length; i++) {
			map.put("foodName", foodNames[i]);
			map.put("foodKcal", foodKcals[i]);
			result = foodDAO.foodInsert(map);		
		}
		return String.valueOf(result);
	}
	
	@RequestMapping("/foodreset.do")
	public String foodreset(HttpSession session,Map map) {
		map.put("id", session.getAttribute("LoginSuccess"));
		foodDAO.foodreset(map);
		return "redirect:/MyPage.do";
	}
	
	
	
	

}
