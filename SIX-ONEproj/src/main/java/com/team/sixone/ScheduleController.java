package com.team.sixone;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {
	
	@RequestMapping("/schedule.do")
	public String schedule() {
		
		System.out.println("/schedule.tiles");
		
		return "/schedule.tiles";
	}
	

}
