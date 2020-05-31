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
public class Upload {
	
	public void upload(HttpServletRequest req, HttpServletResponse resp, javax.servlet.ServletContext application) throws ServletException, IOException {
		
		// 1] 한글처리 (POST 방식이기 때문에)
		req.setCharacterEncoding("UTF-8");

		// 2] MultipartRequest 객체 생성자의 인자들을 각각 변수로 만들어주는 작업
		// 2-1] 업로드할 서버의 물리적 디렉토리를 얻어옴
		String saveDirectory = application.getRealPath("/Upload");
		System.out.println(saveDirectory);
		int maxPostSize = 1024 * 500; // 500Kb
		String encoding = "UTF-8";

		// 2-4] 파일명이 중복된 경우 파일명을 재정의하도록 FileRenamePolicy 객체 얻기 (인덱스 자동 부여)
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		// 3] MultipartRequest 객체 생성
		MultipartRequest mr = null;

		String name = null;
		String title = null;
		StringBuffer buffer = new StringBuffer();
		try{
			mr = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, policy);
			
			// 4] 기타 폼의 하위 요소(파라미터)받기
			// MultipartRequest 객체로 받는다.
			// 이 객체가 request 를 가로채기 때문에 일반적인 request 객체로 파라미터 못받음 (중요!)
			name = mr.getParameter("image");
			title = mr.getParameter("title");
			System.out.println(name + "왼네임 오타이틀" + title);
			
			
			//얘는 카루셀할때
//			String[] inters = mr.getParameterValues("image");
//			for(String inter : inters){
//				buffer.append(inter);
//			}
			
			
			//업로드한 파일 이름 받기
			String filename = mr.getFilesystemName("image");
			System.out.println("파일명 : " + filename);
			//파일 경로
			String realFolder = req.getRealPath("Upload");
			System.out.println("파일경로 : "  +realFolder);
			DAO dao = new DAO(req.getSession().getServletContext());
			
			dao.uploadtest(saveDirectory, filename);
			
			String image = mr.getParameter("image");
			buffer.append(image);
		}
		catch(IOException e){
			// 에러내용을 리퀘스트 영역에 저장
			e.printStackTrace();
			req.setAttribute("error", "최대파일 용량을(500KB)초과하였습니다.");
			req.getRequestDispatcher("http://localhost:8080/sixone").forward(req, resp);
		}
	}
}
