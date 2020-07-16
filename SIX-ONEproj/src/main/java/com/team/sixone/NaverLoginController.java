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
		OAuth2AccessToken oauthToken;//네이버 API에서 제공하는 토근을 받아오기위해 토큰선언
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		//3. 데이터 파싱 Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		//4. response의 name과 email값 파싱
		String name = (String) response_obj.get("name");
		String email = (String) response_obj.get("email");
		//회원가입이 안돼있을때 회원가입으로 이동
		int affected=dao.findid(email);
		String rea;
	  	AdminDAO admin = new AdminDAO(null);
	  	rea=admin.band(email);
	  	if(!(rea.equals("1"))) {//벤 여부 확인
	  		session.setAttribute("ban", rea);
	  		return "banpage";
	  	}
		if(affected == 0) {
			model.addAttribute("id",email);
			model.addAttribute("name",name);
			return "/NaverNewmember.tiles";
		}
		//5. 파싱 닉네임 세션으로 저장
		session.setAttribute("LoginSuccess", email); // 로그인 활성화
		session.setAttribute("Name", name);
		model.addAttribute("result", apiResult);
		return "redirect:/";
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
			session.setAttribute("Name", map.get("name"));
		}
		else {
			String renameFile = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
			File file = new File(phisicalPath+File.separator+renameFile);
			map.put("profile", renameFile);
			upload.transferTo(file);
			dao.tomember(map);
			session.setAttribute("LoginSuccess", map.get("id"));
			session.setAttribute("Name", map.get("name"));
		}

		return "redirect:/";
	}/////NewMember
	


}
