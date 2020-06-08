package com.team.sixone;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.sixone.service.impl.CalendarServiceImpl;
import com.team.sixone.service.impl.SubscribeServiceImpl;

@Controller
public class SubscribeController {

	@Resource(name="calendarService")
	private CalendarServiceImpl calendarDAO;
	
	@Resource(name="subscribeService")
	private SubscribeServiceImpl subscribeDAO;
	
	
	@RequestMapping(value="/subscribe.cancel")
	@ResponseBody
	public String updateCalendarRoutine(@RequestParam Map map) {
		
		int result = calendarDAO.deleteCalendarRoutine(map);
		result = subscribeDAO.delete(map);
		return String.valueOf(result);
	}
	
	
}
