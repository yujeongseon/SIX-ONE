package com.team.sixone;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
public class WriteTB {
	
	public void upload(HttpServletRequest req, HttpServletResponse resp, javax.servlet.ServletContext application) throws ServletException, IOException {
		
		// 1] 한글처리 (POST 방식이기 때문에)
		req.setCharacterEncoding("UTF-8");

		// 2] MultipartRequest 객체 생성자의 인자들을 각각 변수로 만들어주는 작업
		// 2-1] 업로드할 서버의 물리적 디렉토리를 얻어옴
	//	String saveDirectory = application.getRealPath("/Upload");
		
		String saveDirectory = req.getServletContext().getRealPath("/resources/uploadimage");//강제주소주입
		System.out.println(saveDirectory);
		int maxPostSize = 1024 * 500; // 500Kb
		String encoding = "UTF-8";

		// 2-4] 파일명이 중복된 경우 파일명을 재정의하도록 FileRenamePolicy 객체 얻기 (인덱스 자동 부여)
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		// 3] MultipartRequest 객체 생성
		MultipartRequest mr = null;

		
		StringBuffer buffer = new StringBuffer();
		try{
			mr = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, policy);
			System.out.println("파일오리지널명 : "+mr.getOriginalFileName("upload"));
			
			
			
		
//얘는 카루셀할때
//			String[] inters = mr.getParameterValues("image");
//			for(String inter : inters){
//				buffer.append(inter);
//			}
			String content = mr.getParameter("content").replace("\r\n", "</br>");
			String id = mr.getParameter("id");
			String title = mr.getParameter("title");
			String category = mr.getParameter("category");
			String no = mr.getParameter("no");
			//얘는정상작동
			String filename = mr.getFilesystemName("upload");
			String WorU = mr.getParameter("WorU");
			
			
			System.out.println("inscontent"+ content);
			System.out.println("id"+ id);
			System.out.println("파일명 : " + filename);
			System.out.println("title:"+title);
			//파일 경로
			BoardDAO dao = new BoardDAO(req.getSession().getServletContext());
			
			//String AAAADir = "resources/uploadimage/"; //강제주입한 주소 테스트
			if(WorU.equals("W")) 
				dao.write(category,title, filename, content, id);
			else 
				dao.update(category,title, filename, content,no);
			
			
			String image = mr.getParameter("upload");
			buffer.append(image);
		}
		catch(IOException e){
			// 에러내용을 리퀘스트 영역에 저장
			e.printStackTrace();
			req.setAttribute("error", "최대파일 용량을(500KB)초과하였습니다.");
			req.getRequestDispatcher("http://localhost:7070/sixone").forward(req, resp);
		}
	}
}