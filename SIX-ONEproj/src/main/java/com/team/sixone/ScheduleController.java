package com.team.sixone;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.sixone.service.CalendarDTO;
import com.team.sixone.service.ExerciseDTO;
import com.team.sixone.service.SubscribeDTO;
import com.team.sixone.service.impl.CalendarServiceImpl;
import com.team.sixone.service.impl.ExerciseServiceImpl;
import com.team.sixone.service.impl.SubscribeServiceImpl;


@Controller
public class ScheduleController {
	
	@Resource(name="calendarService")
	private CalendarServiceImpl calendarDAO;
	
	@Resource(name="exerciseService")
	private ExerciseServiceImpl exerciseDAO;
	
	@Resource(name="subscribeService")
	private SubscribeServiceImpl subscribeDAO;
	
	
	
	@RequestMapping("/schedule.do")
	public String schedule(Model model,HttpSession session) {
		Map map = new HashMap();
		String id = session.getAttribute("LoginSuccess").toString();
		map.put("id",id);
		//List<ExerciseDTO> list = exerciseDAO.selectList();
		//model.addAttribute("exerciseList", list);
		List<SubscribeDTO> list = subscribeDAO.selectList(map);
		
		model.addAttribute("subList", list);
		
		return "/schedule.tiles";
	}
	
	@RequestMapping(value="/schedule.read",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String readCalendar(@RequestParam Map map,HttpSession session) {
		String id = session.getAttribute("LoginSuccess").toString();
		map.put("id",id);
		List<CalendarDTO> list = calendarDAO.selectList(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		try {
			jsonStr = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return jsonStr;
	}
	
	@RequestMapping(value="/scheduleRoutine.read",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String readRoutine(@RequestParam Map map,HttpSession session) {
		String id = session.getAttribute("LoginSuccess").toString();
		map.put("id",id);
		List<CalendarDTO> list = null;
		if(map.get("routine") == null) {
			list = calendarDAO.selectList(map);
		}
		else{
			list = calendarDAO.selectRoutine(map);
		}
		
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
	
	@RequestMapping(value="/schedule.updateRoutine")
	@ResponseBody
	public String updateCalendarRoutine(@RequestParam Map map) {
		int result = calendarDAO.updateCalendarRoutine(map);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/schedule.delete")
	@ResponseBody
	public String deleteCalendar(@RequestParam Map map) {
		int result = calendarDAO.delete(map);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/schedule.deleteRoutine")
	@ResponseBody
	public String deleteCalendarRoutine(@RequestParam Map map) {
		int result = calendarDAO.deleteCalendarRoutine(map);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/schedule.insert")
	@ResponseBody
	public String insertCalendar(@RequestParam Map map,HttpSession session) {
		String id = session.getAttribute("LoginSuccess").toString();
		map.put("id",id);
		int result = calendarDAO.insert(map);
		
		return String.valueOf(result + "<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script> <script> window.open('', '_self', '');\r\n" + 
				"  window.close();\r\n" + 
				"  </script>");
	}
	
	@RequestMapping(value="/schedule.insertRoutine")
	@ResponseBody
	public String insertCalendarRoutine(@RequestParam Map map,HttpSession session) {
		String id = session.getAttribute("LoginSuccess").toString();
		map.put("id",id);
		int result = calendarDAO.insertCalendarRoutine(map);
		
		return String.valueOf(result);
	}
	
	
	
	@RequestMapping(value="/schedule.updateOne")
	@ResponseBody
	public String updateOneCalendar(@RequestParam Map map) {
		int result = calendarDAO.updateOne(map);
		
		return String.valueOf(result);
	}
	
	
	
	

}
