package com.team.sixone;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProteinController {
	
	@RequestMapping("/protein.do")
	public String protein(Locale locale, Model model) {
		
		return "/Protein.tiles";
	}

}
