package com.team.sixone;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.team.sixone.service.RoutineDTO;
import com.team.sixone.service.impl.RoutineServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name="routineService")
	private RoutineServiceImpl routineDAO;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@RequestParam Map map, Model model) {
		List<RoutineDTO> list = routineDAO.selectOne(map);
		model.addAttribute("bestRoutine", list);
		
		return "home.tiles";
	}
	
	@RequestMapping("/home.do")
	public String moveHome() {

		return"home.tiles";
	}
	
	
}
