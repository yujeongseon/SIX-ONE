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
import com.team.sixone.service.RoutineDTO;
import com.team.sixone.service.impl.RoutineServiceImpl;

@Controller
public class RoutineController {

	@Resource(name="routineService")
	private RoutineServiceImpl routineDAO;
	
	@RequestMapping(value="/routine.read",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String routineList(@RequestParam Map map) {
		
		List<RoutineDTO> list = routineDAO.selectList(map);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		try {
			jsonStr = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return jsonStr;
	
	}
	
}
