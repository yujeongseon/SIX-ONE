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
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.SessionScope;
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
            //@ModelAttribute("LoginSuccess") String id, //로그인 해야만 현 메소드로 들어오게 하기 위한 인자
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
//         PrintWriter out = resp.getWriter();
//         if(affected==0) {
//         out.println("<script>alert('삭제 완료'); </script>");
//         out.flush();
//         }
//         else {
//            out.println("<script>alert('삭제 실패'); </script>");
//            out.flush();
//         }

         resp.sendRedirect("/sixone/freeboard.do");
      }/////////list
      
      //ajax 구독
      @RequestMapping(value="/Ajax/gudok.do",produces ="text/html; charset=UTF-8")
      @ResponseBody
      public String ajaxgudok(String no, String id) {
    	  String num;
    	  RoutineDAO dao= new RoutineDAO(null);
    	  dao.gudokin(no, id);
    	  num=dao.gudoknum(no);
    	  if(num==null) num="0";
    	  return num;
      }
      
    //ajax 구독취소
      @RequestMapping(value="/Ajax/gudNO.do",produces ="text/html; charset=UTF-8")
      @ResponseBody
      public String ajaxgudno(String no, String id) {
    	  int and;
    	  String num;
    	  String answer;
    	  RoutineDAO dao= new RoutineDAO(null);
    	  and=dao.gudokout(no, id);
    	  num=dao.gudoknum(no);
    	  if(num==null) num="0";
    	  answer="구독완료";
    	  return num;
      }
      
    //ajax 운동명 이미지파일 값 가져오기
      @RequestMapping(value="/Ajax/exeimage.do",produces ="text/html; charset=UTF-8")
      @ResponseBody
      public String ajaximage(String name) {
    	  String imagename;
    	  RoutineDAO dao= new RoutineDAO(null);
    	  imagename=dao.geticon(name);
    	  return imagename;
      }
      
      
      
    //ajax 루틴 삭제
      @RequestMapping(value="/Ajax/delok.do",produces ="text/html; charset=UTF-8")
      @ResponseBody
      public void ajaxroudelete(int no) {
    	  RoutineDAO dao= new RoutineDAO(null);
    	  //루틴 rou_exe삭제
    	  System.out.println("삭제위해 이곳에"+no);
    	  dao.deleterouagain(no);
    	  //구독 삭제
    	  dao.deletesub(no);
    	  //루틴삭제
    	  dao.deleterou(no);
      }
      
    //ajax 루틴 제목 작성
      @RequestMapping(value="/Ajax/writerou.do",produces ="text/html; charset=UTF-8")
      @ResponseBody
      public void ajaxroutinewrite(String title,String id) {
    	  RoutineDAO dao= new RoutineDAO(null);
    	  dao.writerou(title, id);
      }
      
      //루틴 상세내용 작성
      @RequestMapping(value="/Ajax/writedetail.do",produces ="text/html; charset=UTF-8")
      @ResponseBody
      public void ajaxroutinedetailwrite(String exename,String roucount,String rouset, int days) {
    	  RoutineDAO dao= new RoutineDAO(null);
    	  if(days > 7) {
    		  days=days-7;
    	  }
    	  
    	  dao.writeroudetail(exename,roucount,rouset,days);
      }
      
    //ajax 루틴 삭제
      @RequestMapping(value="/Ajax/roudelete.do",produces ="text/html; charset=UTF-8")
      @ResponseBody
      public void ajaxroudel(int no) {
    	  RoutineDAO dao= new RoutineDAO(null);
    	  System.out.println("rou딜리트 들어오냐"+no);
    	  dao.deleterouagain(no);
      }
      
      
      
      @RequestMapping(value="/Ajax/rouupdate.do",produces ="text/html; charset=UTF-8")
      @ResponseBody
      public void ajaxroutinedetailupdate(String exename,String roucount,String rouset, int days,int no) {
    	  RoutineDAO dao= new RoutineDAO(null);
    	  switch(days) {
    	  case 1 :
    	  case 2 :  days=1; break;
    	  case 3 :
    	  case 4 :  days=2; break;
    	  case 5 :
    	  case 6 :  days=3; break;
    	  case 7 :
    	  case 8 :  days=4; break;
    	  case 9 :
    	  case 10 :  days=5; break;
    	  case 11:
    	  case 12 :  days=6; break;
    	  case 13 :
    	  case 14 :  days=7; break;
    	  default :
    	  }
    	  System.out.println("이거 적힌만큼만 들어와야 정상인데"+days+"날짜 확인 정상으로 들어오냐");
    	  dao.writerouagain(exename,roucount,rouset,days,no);
      }
      
  
   
   //루틴뿌려주기
   @RequestMapping(value="/routine.do",produces ="text/html; charset=UTF-8")
   public String Routine(@RequestParam Map map,//검색어 받기
         @RequestParam(required = false,defaultValue = "1") int nowPage,
         HttpServletRequest req,//컨텍스트 루트 얻기용
         HttpSession session,
         Model model) {//id는 게시판 구분용으로
      //JSON데이타 타입으로 반환하기위해 JSONObject객체 생성
      int pageSize = 5;
      int blockPage = 5;
     
      String id= session.getAttribute("LoginSuccess").toString();
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
      List<RoutineDTO> list=dao.selectList(map,id);

      String pagingString= PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+ "/routine.do?");
      //데이타 저장]
      
      model.addAttribute("list", list);
      model.addAttribute("pagingString", pagingString);
      //model.addAttribute("rlist",rlist);
      //뷰정보 반환]
      return "/routineboard.tiles";
   }///////////루틴게시판 이동
   
   
   //루틴 구독순으로 정렬
   @RequestMapping(value="/routinedesc.do",produces ="text/html; charset=UTF-8")
   public String Routinedesc(@RequestParam Map map,//검색어 받기
         @RequestParam(required = false,defaultValue = "1") int nowPage,
         HttpServletRequest req,//컨텍스트 루트 얻기용
         HttpSession session,
         Model model) {//id는 게시판 구분용으로
      //JSON데이타 타입으로 반환하기위해 JSONObject객체 생성
      int pageSize = 5;
      int blockPage = 5;
     
      String id= session.getAttribute("LoginSuccess").toString();
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
      List<RoutineDTO> list=dao.gudokupList(map,id);

      String pagingString= PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+ "/routine.do?");
      //데이타 저장]
      
      model.addAttribute("list", list);
      model.addAttribute("pagingString", pagingString);
      //model.addAttribute("rlist",rlist);
      //뷰정보 반환]
      return "/routineboarddesc.tiles";
   }///////////루틴게시판 이동
   
   
   @RequestMapping(value="/Ajax/selectone.do",produces ="text/html; charset=UTF-8")
   @ResponseBody
   public String ajaxRoutineOne(String no) {
      Map map = new HashMap();
      RoutineDAO dao= new RoutineDAO(null);
      List<RoutineDTO> list = dao.selectone(no);
      dao.close();
      List<Map> collections = new Vector<Map>();
      for(RoutineDTO dto:list) {
         Map record = new HashMap();
         record.put("exename", dto.getExe_no());//운동명
         record.put("count", dto.getCount());//운동횟수
         record.put("set", dto.getSet());// 세트수
         record.put("days", dto.getDays());// 몇일차
         record.put("motions", dto.getExercise_motions());//아이콘
         collections.add(record);
      }
      return JSONArray.toJSONString(collections);
   }
   
   
   
   
   
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

      
   }

   
   

}