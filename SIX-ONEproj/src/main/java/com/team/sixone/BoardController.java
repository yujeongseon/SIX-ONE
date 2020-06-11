package com.team.sixone;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team.sixone.BoardDAO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

@Controller
public class BoardController {
	
	
	//리소스파일(resource.properties)에서 읽어오기
		
		private int pageSize=5;
		private int blockPage=5;
		
	//글 불러오기 페이징]
		@RequestMapping("/freeboard.do")
		public String list(
				//@ModelAttribute("id") String id, //로그인 해야만 현 메소드로 들어오게 하기 위한 인자
				@RequestParam Map map,//검색어 받기
				@RequestParam(required = false,defaultValue = "1") int nowPage,
				HttpServletRequest req,//컨텍스트 루트 얻기용
				Model model
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
			
			String pagingString= PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+ "/freeboard.do?");
					
			//데이타 저장]
			model.addAttribute("list", list);
			model.addAttribute("pagingString", pagingString);
			//뷰정보 반환]
			return "/freeboard.tiles";
		}/////////list
		
		@RequestMapping("/view.do")
		public String view(
				@RequestParam(required = false,defaultValue = "1") int nowPage,
				HttpServletRequest req,//컨텍스트 루트 얻기용
				Model model
				) {
			String no = req.getParameter("no");
			BoardDAO dao = new BoardDAO(req.getServletContext());
			BoardDTO record = dao.selectone(no);
			model.addAttribute("record",record);
			model.addAttribute("nowPage",nowPage);
			return "/view.tiles";
		}/////////list
		
		
		
		@RequestMapping("/delete.do")
		public void delete(
				@RequestParam(required = false,defaultValue = "1") int nowPage,
				HttpServletRequest req,//컨텍스트 루트 얻기용
				HttpServletResponse resp
				) throws IOException {
			String no = req.getParameter("no");
			BoardDAO dao = new BoardDAO(req.getServletContext());
			int affected=dao.delete(no);
			//완료 등 뿌려주려다 실패 따로 응답뿌리는 컨트롤러 추가예정
//			PrintWriter out = resp.getWriter();
//			if(affected==0) {
//			out.println("<script>alert('삭제 완료'); </script>");
//			out.flush();
//			}
//			else {
//				out.println("<script>alert('삭제 실패'); </script>");
//				out.flush();
//			}

			resp.sendRedirect("/sixone/freeboard.do");
		}/////////list
	
	//ajax 루틴 불러오기
		@RequestMapping(value="/Ajax/RoutineOne.do",produces ="text/html; charset=UTF-8")
		@ResponseBody
		public String ajaxRoutineOne(String no) {
			Map map = new HashMap();
			System.out.println("no의 값"+no);
			RoutineDAO dao= new RoutineDAO(null);
			List<Rou_exeDTO> list = dao.selectone(no);
			dao.close();
			System.out.println("리스트 개수"+list.size());
			List<Map> collections = new Vector<Map>();
			for(Rou_exeDTO dto:list) {
				Map record = new HashMap();
				record.put("exe_no", dto.getExe_no());
				record.put("ru_name", dto.getCount());
				record.put("set", dto.getSet());
				record.put("routine_days", dto.getDays());
				collections.add(record);
			}
			return JSONArray.toJSONString(collections);
		}
		
	
	
	//ajax테스트
	@RequestMapping(value="/Ajax/Routine.do",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxRoutine(HttpServletRequest req) {//id는 게시판 구분용으로
		//JSON데이타 타입으로 반환하기위해 JSONObject객체 생성
		int nowPage=1;
		Map map = new HashMap();
		RoutineDAO dao= new RoutineDAO(null);
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
		List<RoutineDTO> list=dao.selectList(map);
		dao.close();
		List<Map> collections = new Vector<Map>();
		for(RoutineDTO dto:list) {
			Map record = new HashMap();
			record.put("no", dto.getRoutine_no());
			record.put("ru_name", dto.getRoutine_name());
			record.put("name", dto.getName());
			record.put("create_date", dto.getCreate_at().toString());
			collections.add(record);
		}
		String pagingString= PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+ "/freeboard.do?");
		//map.put("pagingString", pagingString);//페이징스트링 맵에 담아 넘겨주기
		//collections.add(map);
		//데이타 저장]
		//뷰정보 반환]
		return JSONArray.toJSONString(collections);
	}///////////ajaxJson
	
	
	
	
	
	
	
	@RequestMapping("/write.do")
	public String write(@RequestParam Map map,
			@RequestParam(required = false,defaultValue = "1") int nowPage) {
		return "/Write.tiles";
	}
	
	@RequestMapping("/Update.do")
	public String update(HttpServletRequest req,
			@RequestParam(required = false,defaultValue = "1") int nowPage,
			Model model) {
		String no=req.getParameter("no");
		BoardDAO dao = new BoardDAO(req.getServletContext());
		BoardDTO record = dao.selectone(no);
		model.addAttribute("record",record);
		model.addAttribute("nowPage",nowPage);
		
		return "/Update.tiles";
	}
	
	
	
	@RequestMapping(value="/WriteOK.do", method=RequestMethod.POST)
	public void upload(Locale locale, Model model, HttpServletRequest req, 
			 HttpServletResponse resp) throws ServletException, IOException {
		WriteTB write = new WriteTB();
		write.upload(req, resp, req.getSession().getServletContext());
		resp.sendRedirect("/sixone/freeboard.do");

		//return "/TimeLine.tiles:for";
	}
	
	@RequestMapping(value="/UpdateOK.do", method=RequestMethod.POST)
	public void update(Locale locale, Model model, HttpServletRequest req, 
			 HttpServletResponse resp) throws ServletException, IOException {
		WriteTB write = new WriteTB();
		write.upload(req, resp, req.getSession().getServletContext());
		resp.sendRedirect("/sixone/freeboard.do");

		//return "/TimeLine.tiles:for";
	}

	
	
	
	
	
	//목록으로 이동]
//	@RequestMapping("/FileUpDown/List.do")
//	public String list(HttpServletRequest req) {
//		//1]서버의 물리적 경로 얻기
//		String phisicalPath=req.getServletContext().getRealPath("/uploadimage");
//		//2]File객체 생성
//		File f = new File(phisicalPath);
//		File[] files = f.listFiles();
//		//3]리퀘스트 영역에 저장
//		//방법1]File[]배열 저장	
//		req.setAttribute("files",files);
//		//방법2]컬렉션 저장
//		List<Map> list = new Vector<Map>();
//		for(File file : files) {
//			Map map = new HashMap();
//			map.put("name", file.getName());
//			map.put("size", (int)Math.ceil(file.length()/1024.0));
//			list.add(map);
//		}
//		req.setAttribute("list", list);
//		
//		//4]뷰정보 반환
//		return "/FileUpDown13/List.jsp";
//	}
	
	

}
