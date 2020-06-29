package com.team.sixone;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.github.scribejava.core.model.OAuth2AccessToken;

/*
 * Handles requests for the application home page.
 */

@Controller
public class NaverLoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}


//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		BoardDAO dao = new BoardDAO(null);
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		System.out.println("api리절트"+apiResult);
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		//3. 데이터 파싱 Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		//response의 nickname값 파싱
		String name = (String) response_obj.get("name");//그냥 이름
		String email = (String) response_obj.get("email");
		String[] idsplit= email.split("@");//이메일 @앞쪽으로 id 지정
		String id= idsplit[0];
		System.out.println(id);
		System.out.println(name);
		System.out.println(email);
		int affected=dao.findid(id);
		if(affected == 0) {
			model.addAttribute("id",id);
			model.addAttribute("name",name);
			return "/NaverNewmember.tiles";
		}
		//4.파싱 닉네임 세션으로 저장
		session.setAttribute("LoginSuccess", id); // 로그인 활성화
		session.setAttribute("name", name);
		model.addAttribute("result", apiResult);
		
		
		return "home.tiles";
	}
	
	@RequestMapping("/Navermember.do")
	public String Join(HttpServletRequest req,MultipartRequest request,@RequestParam Map map,HttpSession session) throws IllegalStateException, IOException {
		BoardDAO dao = new BoardDAO(null);
		MultipartFile upload = (MultipartFile) request.getFile("upload");
		String phisicalPath = req.getServletContext().getRealPath("/resources/Profile");
		//String phisicalPath = "C:\\Users\\kosmo_11\\git\\SIX-ONE\\SIX-ONEproj\\src\\main\\webapp\\resources\\Profile";
		String profile = upload.getOriginalFilename().toString();
		map.put("id", req.getParameter("id"));
		map.put("name", req.getParameter("name"));
		map.put("gender", req.getParameter("gender"));
		map.put("weight", req.getParameter("weight"));
		map.put("height", req.getParameter("height"));
		map.put("goal", req.getParameter("goal"));
		if(profile.equals("")) {
			File file = new File(phisicalPath+File.separator+profile);
			map.put("profile", profile);
			dao.tomember(map);
			session.setAttribute("LoginSuccess", map.get("id"));
			session.setAttribute("LoginSuccess", map.get("name"));
		}
		else {
			String renameFile = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
			File file = new File(phisicalPath+File.separator+renameFile);
			map.put("profile", renameFile);
			upload.transferTo(file);
			dao.tomember(map);
			session.setAttribute("LoginSuccess", map.get("id"));
			session.setAttribute("LoginSuccess", map.get("name"));
		}

		return "home.tiles";
	}/////NewMember
	


}
