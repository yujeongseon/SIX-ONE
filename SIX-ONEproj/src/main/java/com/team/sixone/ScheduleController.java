package com.team.sixone;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.sixone.service.CalendarDTO;
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
		
		List<CalendarDTO> list = calendarDAO.selectList();
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		try {
			jsonStr = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return jsonStr;
	}
	
	@RequestMapping(value="/schedule.update")
	@ResponseBody
	public String updateCalendar(@RequestParam Map map) {
		int result = calendarDAO.update(map);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/schedule.delete")
	@ResponseBody
	public String deleteCalendar(@RequestParam Map map) {
		int result = calendarDAO.delete(map);
		return String.valueOf(result);
	}
	
	
	
	
	
	

}
