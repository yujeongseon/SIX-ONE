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
import com.team.sixone.service.impl.ExerciseServiceImpl;

@Controller
public class ExerciseController {

	@Resource(name="exerciseService")
	private ExerciseServiceImpl exerciseDAO;
	
	
	@RequestMapping(value="/exercise.read",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String readExercise(@RequestParam Map map) {
		
		List<ExerciseDTO> list = exerciseDAO.selectList();
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		try {
			jsonStr = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return jsonStr;
	}
	
	
	
	
	@RequestMapping(value="/exercise.insert",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String insertExercise(@RequestParam Map map) {
		
		int result = exerciseDAO.insert(map);

		return String.valueOf(result);
	}
	
	
	
	
}
