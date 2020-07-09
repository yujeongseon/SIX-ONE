package com.team.sixone;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
public class Upload {
	HttpServletRequest req;
	Upload(HttpServletRequest req1){
		req = req1;
	}
   
   public void upload( HttpServletResponse resp, javax.servlet.ServletContext application) throws ServletException, IOException {
      
      // 1] 한글처리 (POST 방식이기 때문에)
      req.setCharacterEncoding("UTF-8");

		// 2] MultipartRequest 객체 생성자의 인자들을 각각 변수로 만들어주는 작업
		// 2-1] 업로드할 서버의 물리적 디렉토리를 얻어옴
		String saveDirectory =req.getServletContext().getRealPath("/resources/images/TLImg");
		//String saveDirectory ="C:\\Users\\kosmo_26\\git\\SIX-ONE\\SIX-ONEproj\\src\\main\\webapp\\resources\\images\\TLImg";//강제주소주입

		System.out.println(saveDirectory);
		int maxPostSize = 1024 * 500; // 500Kb
		String encoding = "UTF-8";

      // 2-4] 파일명이 중복된 경우 파일명을 재정의하도록 FileRenamePolicy 객체 얻기 (인덱스 자동 부여)
      DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
      // 3] MultipartRequest 객체 생성
      com.oreilly.servlet.MultipartRequest mr = null;

      
      StringBuffer buffer = new StringBuffer();
      try{
         mr = new com.oreilly.servlet.MultipartRequest(req, saveDirectory, maxPostSize, encoding, policy);
         System.out.println("파일오리지널명 : "+mr.getOriginalFileName("image"));
         
         
         
      
//얘는 카루셀할때
//         String[] inters = mr.getParameterValues("image");
//         for(String inter : inters){
//            buffer.append(inter);
//         }
         String content = mr.getParameter("inscontent").replace("\r\n", "</br>");
         String id = mr.getParameter("id");
         
         //얘는정상작동
         String filename = mr.getFilesystemName("image");
         
         
         
         System.out.println("inscontent"+ content);
         System.out.println("id"+ id);
         System.out.println("파일명 : " + filename);
         //파일 경로
         DAO dao = new DAO(req.getSession().getServletContext());
         
         String AAAADir = "resources/images/TLImg/"; //강제주입한 주소 테스트
         
         dao.uploadtest(AAAADir, filename, content, id);
         
         String image = mr.getParameter("image");
         buffer.append(image);
      }
      catch(IOException e){
         // 에러내용을 리퀘스트 영역에 저장
         e.printStackTrace();
         //req.setAttribute("error", "최대파일 용량을(500KB)초과하였습니다.");
         //req.getRequestDispatcher("http://localhost:8080/sixone").forward(req, resp);
      }
   }
}