package com.team.sixone;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.team.sixone.BoardDAO;


import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardController {
	
	@Value("${PAGE_SIZE}")
	private int pageSize;
	@Value("${BLOCK_PAGE}")
	private int blockPage;
	
	
	
	@RequestMapping("/freeboard.do")
	public String board(
			//@ModelAttribute("id") String id,//세션영역에서 id가져오기-isLogin.jsp파일 사용시 불필요
			@RequestParam Map map,
			@RequestParam(required = false,defaultValue = "1") int nowPage,
			HttpServletRequest req,//컨텍스트 루트 얻기용
			Model model) {
		//서비스 호출]
		//페이징을 위한 로직 시작]
		//전체 레코드수	
		BoardDAO dao = new BoardDAO(null); 
		
		int totalRecordCount = dao.getTotalRowCount(map);
		//전체 페이지수]
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		//시작 및 끝 ROWNUM구하기]
		int start = (nowPage-1)*pageSize+1;
		int end   = nowPage*pageSize;	
		//페이징을 위한 로직 끝]	
		map.put("start", start);
		map.put("end", end);
		
		List<BoardDTO> list = dao.selectList(map);
		//데이타 저장]
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize,blockPage, nowPage, req.getContextPath()+"/freeboard.do?");
		
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		//뷰정보 반환]
		return "/freeboard.tiles";
	}///////////////
	
	
	
	
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
