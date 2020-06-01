package com.team.sixone;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Locale;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javafx.application.Application;


@Controller
public class TimelLineCont {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private ServletContext context;
	
	
	@RequestMapping(value = "/TimeLine.do", method = RequestMethod.GET)
	public String TimeLine(Locale locale, Model model, HttpServletRequest req) {
		
		
		DAO dao = new DAO(req.getSession().getServletContext());
		
		
		model.addAttribute("aaa", "resources/images/black.jpg");
		model.addAttribute("bbb", "resources/images/classes-1.jpg");
		String[] images = dao.test();
		
		req.setAttribute("images", images);
		System.out.println("기존2");
		
		///======================================
		
		return "/TimeLine.tiles";
	}
	@RequestMapping(value = "/TimeLine.do", method = RequestMethod.POST)
	public String TimeLine2(Locale locale, Model model, HttpServletRequest req) {
		
		
		DAO dao = new DAO(req.getSession().getServletContext());
		
		
		model.addAttribute("aaa", "resources/images/black.jpg");
		model.addAttribute("bbb", "resources/images/classes-1.jpg");
		String[] images = dao.test();
		
		req.setAttribute("images", images);
		System.out.println("기존2");
		
		///======================================
		
		return "/TimeLine.tiles";
	}
	
	
	@RequestMapping(value = "/exercise.do", method = RequestMethod.GET)
	public String exec(Locale locale, Model model) {
		return "/exercise.tiles";
	}
	
	@RequestMapping(value = "/blog.do", method = RequestMethod.GET)
	public String blog(Locale locale, Model model) {
		return "/Map.tiles";
	}
	@RequestMapping(value="/upload.do", method=RequestMethod.POST)
	public String upload(Locale locale, Model model, HttpServletRequest req, 
			 HttpServletResponse resp) throws ServletException, IOException {
		Upload upload_ = new Upload();
		
		upload_.upload(req, resp, req.getSession().getServletContext());
		return "/home.tiles";
	}


}
