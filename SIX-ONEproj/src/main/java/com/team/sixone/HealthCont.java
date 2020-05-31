package com.team.sixone;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


	@Controller
	public class HealthCont {
		@RequestMapping(value = "/Health.do", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {
		
		
			
			
			//타임라인에 뿌려줄 데이터 넣어두기
			System.out.println( "/Health.tiles");
			
			return "/Health.tiles";
		}

	}
