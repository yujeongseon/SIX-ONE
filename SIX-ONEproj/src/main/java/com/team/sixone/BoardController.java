package com.team.sixone;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardController {
	@RequestMapping("/freeboard.do")
	public String board(@RequestParam(value="id",required=false) String id) {
		
		
		System.out.println("/freeboard.tiles");
			return "/freeboard.tiles";
		
	}

}
