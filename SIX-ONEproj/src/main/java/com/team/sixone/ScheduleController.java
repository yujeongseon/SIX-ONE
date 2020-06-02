package com.team.sixone;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.sixone.service.CalendarDTO;
import com.team.sixone.service.ExerciseDTO;
import com.team.sixone.service.impl.CalendarServiceImpl;
import com.team.sixone.service.impl.ExerciseServiceImpl;


@Controller
public class ScheduleController {
	
	@Resource(name="calendarService")
	private CalendarServiceImpl calendarDAO;
	
	@Resource(name="exerciseService")
	private ExerciseServiceImpl exerciseDAO;
	
	
	@RequestMapping("/schedule.do")
	public String schedule(Model model) {
		
		//List<ExerciseDTO> list = exerciseDAO.selectList();
		//model.addAttribute("exerciseList", list);
		
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
	
	@RequestMapping(value="/schedule.insert")
	@ResponseBody
	public String insertCalendar(@RequestParam Map map) {
		int result = calendarDAO.insert(map);
		
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/schedule.updateOne")
	@ResponseBody
	public String updateOneCalendar(@RequestParam Map map) {
		int result = 0;
		
		if(map.get("playNo") != null){
			result = calendarDAO.updateOne(map);
		}
		else {
			
		}
		
		return String.valueOf(result);
	}
	
	
	
	

}
