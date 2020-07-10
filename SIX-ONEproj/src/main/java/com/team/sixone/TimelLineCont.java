package com.team.sixone;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import javafx.application.Application;


@Controller
public class TimelLineCont {
   private Connection conn;
   private PreparedStatement psmt;
   private ResultSet rs;
   private ServletContext context;
   
   
   @RequestMapping(value = "/TimeLine.do", method = RequestMethod.GET)
   public String TimeLine(Locale locale, Model model, HttpServletRequest req) {
      
      DAO dao = new DAO(req.getServletContext());
      Map map = new HashMap();
      
      
      
      return "/TimeLine.tiles";
   }
   
   @RequestMapping(value = "/TimeLine.do", method = RequestMethod.POST)
   public String TimeLinePOST(Locale locale, Model model, HttpServletRequest req) {
      
      return "/TimeLine.tiles";
   }
   
   
   
   @RequestMapping(value = "/exercise.do", method = RequestMethod.GET)
   public String exec(Locale locale, Model model) {
      return "/exercise.tiles";
   }
   
   @RequestMapping(value = "/blog.do", method = RequestMethod.GET)
   public String blog(Locale locale, Model model) {
      return "/ex.tiles";
   }
   @RequestMapping(value="/upload.do")
   public String upload(HttpServletRequest req,MultipartRequest request,@RequestParam Map map,HttpSession session, HttpServletResponse resp) throws ServletException, IOException {
      MultipartFile upload = (MultipartFile)request.getFile("image");
      String phisicalPath = req.getServletContext().getRealPath("/resources/images/TLImg");
      String profile = upload.getOriginalFilename().toString();
      String content = map.get("inscontent").toString();
      String id = map.get("id").toString();
      String renameFile = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
      File file = new File(phisicalPath+File.separator+renameFile);
      System.out.println("파일 겟앱솔루트"+file.getAbsolutePath());
      System.out.println("파일 겟패스"+file.getPath());
      upload.transferTo(file);
      
      DAO dao = new DAO(req.getServletContext());
      dao.uploadtest("/resources/images/TLImg/"+renameFile, content, id);
      
      
      //Upload upload_ = new Upload();
      
      //upload_.upload(req, resp, req.getSession().getServletContext());
      
      

      resp.sendRedirect("/sixone/TimeLine.do");
      return "/TimeLine.tiles";
   }
   
   
   @RequestMapping(value="/tlgood.do", method=RequestMethod.GET)
   public String tlgood(Locale locale, Model model, HttpServletRequest req, 
          HttpServletResponse resp, HttpSession session) throws ServletException, IOException {
      
      DAO dao = new DAO(req.getServletContext());
      
      int goodcount = dao.good(session.getAttribute("LoginSuccess").toString(), req.getParameter("no"));
      
      resp.sendRedirect("/sixone/TimeLine.do");
      return "/TimeLine.tiles";
   }
   

   @RequestMapping(value = "/del.do", method = RequestMethod.GET)
   public String del(Locale locale, Model model, HttpServletRequest req) {
      DAO dao = new DAO(req.getServletContext());
      String delimg = req.getParameter("img");
      dao.delTL(delimg);
      
      return "/TimeLine.tiles";
   }
   @RequestMapping(value = "/tlcom.do", method = RequestMethod.POST)
   public void tlcomment(Locale locale, Model model, HttpServletRequest req,HttpServletResponse resp, HttpSession session ) throws IOException {
      DAO dao = new DAO(req.getServletContext());
      String comment = req.getParameter("tlcom");
      String tlno = req.getParameter("tlno");
      
      System.out.println(comment);
      String id = (String)session.getAttribute("LoginSuccess"); // 아이디 받아오는거
      System.out.println("아이디는 " +id);
      System.out.println("영향받은 행 수 : cont.java" +dao.tlcomment(id, comment, tlno));

      
      /*
       * <form action="<c:url value='/tlcom.do'/>"  method="POST" id="commentform">
                     <input type="hidden" name="tlcomid" value="<%=id %>" id="id"/>
                     <input type="hidden" name="tlno" value="<%=j++ %>" id="tlno"/>
                     <input type="text" class="col-md-9" name="tlcom" class="ftlcom" id="tlcom" placeholder="댓글 입력" style="border-radius:10px;"></input>
                     <input type="submit"/>
       * 
       * */
      resp.sendRedirect("/sixone/TimeLine.do");
      //return "/TimeLine.tiles";
   }
//tl_full.do
   @RequestMapping(value = "/tl_full.do", method = RequestMethod.GET)
   public String tlselone(Locale locale, Model model, HttpServletRequest req, HttpSession session ) {
      
      System.out.println(req.getParameter("tlno"));
      DAO dao = new DAO(session.getServletContext());
      String[] tlplus = dao.selectone((String)req.getParameter("tlno"));
      DAO dao2 = new DAO(session.getServletContext());
      Map map = dao2.replys(tlplus[0]);
      String[] ids = (String[])map.get("ids");
      String[] comments = (String[])map.get("comments");
   
      
      model.addAttribute("tlone", tlplus);
      model.addAttribute("ids", ids);
      model.addAttribute("comments", comments);
   
      return "/selectone";
   }

}