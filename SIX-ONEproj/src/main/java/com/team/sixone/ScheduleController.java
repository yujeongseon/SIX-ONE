package com.team.sixone;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.sixone.service.impl.CalendarDAO;
import com.team.sixone.service.impl.CalendarServiceImpl;


@Controller
public class ScheduleController {
	
	@Resource(name="calendarService")
	private CalendarServiceImpl calendarDAO;
	
	
	@RequestMapping("/schedule.do")
	public String schedule() {
		
		return "/schedule.tiles";
	}
	
	@RequestMapping(value="/schedule.read",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String readCalendar() {
		
		calendarDAO.selectList();
		
		
		JSONObject obj = new JSONObject();
		obj.put("_id", 1);
		obj.put("title", "test");
		obj.put("start", "2020-05-27");
		obj.put("end", "2020-05-29");
		obj.put("description", "팔굽혀펴기100회");
		obj.put("type", "하체");
		obj.put("username", "kim");
		obj.put("backgroundColor", "#D25565");
		obj.put("textColor", "#ffffff");
		obj.put("allDay", true);
		
		
		
		
		return obj.toJSONString();
	}
	
	
	
	

}
