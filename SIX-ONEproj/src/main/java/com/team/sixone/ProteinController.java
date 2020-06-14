package com.team.sixone;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.sixone.service.ProteinDTO;
import com.team.sixone.service.impl.ProteinDAO;

@Controller
public class ProteinController {
	
	@Resource(name="proteinDAO")
	private ProteinDAO dao;
	
	
	@RequestMapping("/protein.do")
	public String protein(Locale locale, Model model) {
		List<ProteinDTO> list = dao.selectProtein();
		model.addAttribute("list", list);
		
		return "/Protein.tiles";
	}

}
