package com.team.sixone;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

@Controller
public class WriteTB {
	
	@RequestMapping(value="/WriteOK.do", method=RequestMethod.POST)
	public void writeboard(HttpServletRequest req,MultipartRequest request,@RequestParam Map map,HttpServletResponse resp) throws IllegalStateException, IOException {
		BoardDAO dao = new BoardDAO(null);
		MultipartFile upload = (MultipartFile) request.getFile("upload");
		String phisicalPath = req.getServletContext().getRealPath("/resources/uploadimage");
		String profile = upload.getOriginalFilename().toString();
		map.put("no", req.getParameter("no"));
		map.put("id", req.getParameter("id"));
		map.put("name", req.getParameter("name"));
		map.put("gender", req.getParameter("content"));
		map.put("weight", req.getParameter("title"));
		map.put("height", req.getParameter("category"));
		if(profile.equals("")) {
			File file = new File(phisicalPath+File.separator+profile);
			map.put("upload", profile);
		}
		else {
			String renameFile = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
			File file = new File(phisicalPath+File.separator+renameFile);
			map.put("upload", renameFile);
			upload.transferTo(file);
		}
		String WorU = req.getParameter("WorU");
		
		if(WorU.equals("W")) {
			dao.write(map);
		resp.sendRedirect("/sixone/freeboard.do");
		}
		else { 
			dao.update(map);
			resp.sendRedirect("/sixone/freeboard.do");
		}

	}/////NewMember
	
	
	
}