package com.team.sixone;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.team.sixone.service.RoutineDTO;
import com.team.sixone.service.impl.RoutineServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private NaverLoginBO naverLoginBO; 
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}// 네이버 로그인
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	
	@Resource(name="routineService")
	private RoutineServiceImpl routineDAO;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@RequestParam Map map, Model model,HttpSession session) {
		List<RoutineDTO> list = routineDAO.selectOne(map);
		model.addAttribute("bestRoutine", list);
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		session.setAttribute("url", naverAuthUrl);
		return "home.tiles";
	}//시작할때 네이버 인증 url생성
	
	@RequestMapping("/home.do")
	public String moveHome() {

		return"home.tiles";
	}
	
	
}
