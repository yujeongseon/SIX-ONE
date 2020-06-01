package com.team.sixone;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.team.sixone.BoardDAO;


import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardController {
	
	
	
	//리소스파일(resource.properties)에서 읽어오기
		
		private int pageSize=3;
		
		private int blockPage=3;
		
		
		
	//목록용]
		@RequestMapping("/freeboard.do")
		public String list(
				//@ModelAttribute("id") String id, //로그인 해야만 현 메소드로 들어오게 하기 위한 인자
				@RequestParam Map map,//검색어 받기
				Model model,
				@RequestParam(required = false,defaultValue = "1") int nowPage,
				HttpServletRequest req//컨텍스트 루트 얻기용
				) {
			BoardDAO dao = new BoardDAO(null);
			
			//서비스 호출]
			//페이징을 위한 로직 시작]
			//전체 레코드수	
			int totalRecordCount = dao.getTotalRowCount(map);
			//전체 페이지수]
			int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
			
			//시작 및 끝 ROWNUM구하기]
			int start = (nowPage-1)*pageSize+1;
			int end   = nowPage*pageSize;	
			//페이징을 위한 로직 끝]	
			map.put("start", start);
			map.put("end", end);
			
			List<BoardDTO> list= dao.selectList(map);
			
			String pagingString= PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+ "/freeboard?");
					
			//데이타 저장]
			model.addAttribute("list", list);
			model.addAttribute("pagingString", pagingString);
			//뷰정보 반환]
			return "/freeboard.tiles";
		}/////////list
	
	
	
	
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
