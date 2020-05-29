package com.team.sixone;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardController {
	@RequestMapping("/freeboard.do")
	public String board() {
		
			return "/freeboard.tiles";
		
	}
	
	@RequestMapping(value="/Ajax/AjaxJson.do",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxJson(@RequestParam String id) {//id는 게시판 구분용으로
		//JSON데이타 타입으로 반환하기위해 JSONObject객체 생성
		JSONObject json = new JSONObject();
		//JSON객체의 put("키값","값")메소드로 저장하면
		//{"키값":"값"} JSON형태의 데이타로 저장됨.
		json.put("id","바뀌냐?");
		System.out.println(json.toJSONString()); //되는지 확인
		return json.toJSONString();
	}///////////ajaxJson

}
