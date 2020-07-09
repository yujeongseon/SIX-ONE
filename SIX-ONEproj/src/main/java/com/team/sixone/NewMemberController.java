package com.team.sixone;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.team.sixone.service.MemberService;
import com.team.sixone.service.UploadCommand;


@Controller
public class NewMemberController {
	@Resource(name="MemberService")
	private MemberService MemberService;
	

	
	@RequestMapping("/NewMember.do")
	public String NewMember() {
		
		
		 return"NewMember.tiles";
	}/////NewMember
	
	@RequestMapping("/NewkakaoMember.do")
	public String NewkakaoMember() {
		
		
		 return"KakaoNewmember.tiles";
	}/////NewMember

	
	@RequestMapping("/Profile.do")
	public String Join(HttpServletRequest req,MultipartRequest request,@RequestParam Map map,HttpSession session) throws IllegalStateException, IOException {
		MultipartFile upload = (MultipartFile) request.getFile("upload");
		String phisicalPath = req.getServletContext().getRealPath("/resources/Profile");
		System.out.println("phisicalPath : " + phisicalPath);
		///SIX-ONEproj/src/main/webapp/resources/Profile
		String profile = upload.getOriginalFilename().toString();
		if(profile.equals("")) {
			File file = new File(phisicalPath+File.separator+profile);
			map.put("profile", profile);
			MemberService.kakaomemberlastinsert(map);
			session.setAttribute("LoginSuccess", map.get("kakaoid"));
		}
		else {
			String renameFile = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
			File file = new File(phisicalPath+File.separator+renameFile);
			map.put("profile", renameFile);
			upload.transferTo(file);
			MemberService.kakaomemberlastinsert(map);
			session.setAttribute("LoginSuccess", map.get("kakaoid"));
		}

		return "home.tiles";
	}/////NewMember
	
	
	@RequestMapping("/memberjoin.do")
	public String memberjoin(HttpServletRequest req,MultipartRequest request,@RequestParam Map map,HttpSession session) throws IllegalStateException, IOException {
		MultipartFile upload = (MultipartFile) request.getFile("upload");
		String phisicalPath = req.getServletContext().getRealPath("/resources/Profile");
		String profile = upload.getOriginalFilename().toString();
		if(profile.equals("")) {
			File file = new File(phisicalPath+File.separator+profile);
			map.put("profile", profile);
			MemberService.memberjoin(map);
			session.setAttribute("LoginSuccess", map.get("newid"));
		}
		else {
			String renameFile = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
			File file = new File(phisicalPath+File.separator+renameFile);
			map.put("profile", renameFile);
			upload.transferTo(file);
			MemberService.memberjoin(map);
			session.setAttribute("LoginSuccess", map.get("newid"));
		}
		
		return "home.tiles";
	}
	
}
