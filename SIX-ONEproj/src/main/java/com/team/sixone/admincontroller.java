package com.team.sixone;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class admincontroller {

	@RequestMapping("/admin.do")
  	public String gohome(Model model) {
		Map map = new HashMap();
		
		AdminDAO dao = new AdminDAO(null);
		//남녀 비율
		map=dao.getmember();
		int man = (int) map.get("man");
		int woman = (int) map.get("woman");
		int hap = man + woman; //총 회원수
		int manpersent = ((man*100)/hap);// 남자 %
		int womanpersent = 100-manpersent;// 여자%
		map = dao.gettimeline();
		int timeline = (int) map.get("timelinehap");
		model.addAttribute("timeline",timeline);
		model.addAttribute("memberhap",hap);
		model.addAttribute("woman",woman);
		model.addAttribute("man",man);
		model.addAttribute("manpersent",manpersent);
		model.addAttribute("womanpersent",womanpersent);
		//루틴글 수
		map=dao.getroutine();
		int routinehap = (int) map.get("routinehap");
		int totalhap= routinehap + timeline;
		model.addAttribute("routinehap", routinehap);
		model.addAttribute("totalhap", totalhap);
		//월별 가입자
		map=dao.member_month();
		model.addAttribute("Jen", map.get("2020-01"));
		model.addAttribute("Feb", map.get("2020-02"));
		model.addAttribute("Mar", map.get("2020-03"));
		model.addAttribute("Apr", map.get("2020-04"));
		model.addAttribute("May", map.get("2020-05"));
		model.addAttribute("Jun", map.get("2020-06"));
		model.addAttribute("Jul", map.get("2020-07"));
		//월별 타임라인
		map=dao.timeline_month();
		model.addAttribute("time1", map.get("2020-01"));
		model.addAttribute("time2", map.get("2020-02"));
		model.addAttribute("time3", map.get("2020-03"));
		model.addAttribute("time4", map.get("2020-04"));
		model.addAttribute("time5", map.get("2020-05"));
		model.addAttribute("time6", map.get("2020-06"));
		model.addAttribute("time7", map.get("2020-07"));
		//웗별 루틴
		map=dao.routine_month();
		model.addAttribute("rou1", map.get("2020-01"));
		model.addAttribute("rou2", map.get("2020-02"));
		model.addAttribute("rou3", map.get("2020-03"));
		model.addAttribute("rou4", map.get("2020-04"));
		model.addAttribute("rou5", map.get("2020-05"));
		model.addAttribute("rou6", map.get("2020-06"));
		model.addAttribute("rou7", map.get("2020-07"));
		//회원가입경로
		map=dao.member_path();
		int naver= (int) map.get("naver");
		int kakao= (int) map.get("kakao");
		int sixone= hap-naver-kakao;
		int naverper = ((naver*100)/hap);// 네이버 %
		int kakaoper = ((kakao*100)/hap);// 카카오%
		int sixoneper = 100 - naverper - kakaoper;
		model.addAttribute("naver", naver);
		model.addAttribute("kakao", kakao);
		model.addAttribute("sixone", sixone);
		model.addAttribute("naverper", naverper);
		model.addAttribute("kakaoper", kakaoper);
		model.addAttribute("sixoneper", sixoneper);
		
		int exehap = dao.getexehap();
		int rank1,rank2,rank3,rank4,rank5;
		List list= dao.exerank();
		for(int i=0; i<list.size(); i+=2) {
			model.addAttribute("exename"+i, list.get(i));
			model.addAttribute("execount"+i,list.get(i+1));
			int exeper = (((int)list.get(i+1))*100)/exehap;
			model.addAttribute("exeper"+i,exeper);
			
		}
		
		
  		return "admin";
  	}
	
	
	@RequestMapping("/moris.do")
  	public String gomoris() {

  		return "adminmoris";
  	}
	
	@RequestMapping("/ban.do")
  	public String isban() {
  		return "banpage.tiles";
  	}
	
	@RequestMapping("/chart.do")
  	public String gochart() {

  		return "adminchart";
  	}
	
	@RequestMapping("/icon.do")
  	public String goicon() {

  		return "adminicon";
  	}
	//회원관리를 위한 회원정보 데이터 불러오기
	@RequestMapping("/table.do")
  	public String gotable( @RequestParam Map map, Model model) {
		AdminDAO dao = new AdminDAO(null);
		List<AdminMemberDTO> list= dao.selectmember(map);
		model.addAttribute("list",list);
  		return "admintable";
  	}
	 //각 회원별 상세정보 아이작스 처리
	 @RequestMapping(value="/Ajax/profile.do",produces ="text/html; charset=UTF-8")
	   @ResponseBody
	   public String ajaxRoutineOne(String id) {
	      AdminDAO dao= new AdminDAO(null);
	      List<AdminMemberDTO> list = dao.selectOne(id);
	      dao.close();
	      List<Map> collections = new Vector<Map>();
	      for(AdminMemberDTO dto:list) {
	         Map record = new HashMap();
	         record.put("id", id);
	         record.put("name", dto.getName());//이름
	         record.put("create_at", dto.getCreate_at());//가입일
	         record.put("gender", dto.getGender());// 성별
	         record.put("profile", dto.getProfile());// 사진
	         record.put("roucount", dto.getRoutinecount());//작성한 루틴 수
	         record.put("comment", dto.getCommentcount());//작성한 댓글 수
	         record.put("timelinecount", dto.getTimelinecount());//작성한 루틴 수
	         collections.add(record);
	      }
	      
	      return JSONArray.toJSONString(collections);
	   }
	 
	 @RequestMapping(value="/Ajax/Ban.do",produces ="text/html; charset=UTF-8")
	   @ResponseBody
	   public String Ban(String reason,String id) {
		 AdminDAO dao= new AdminDAO(null);
			dao.Ban(reason,id);
		 return "ban";
	 }
	 
	 @RequestMapping(value="/Ajax/isBan.do",produces ="text/html; charset=UTF-8")
	   @ResponseBody
	   public String isBan(String id) {
		 AdminDAO dao= new AdminDAO(null);
			String ban=dao.band(id);
		 return ban;
	 }
	 
	 @RequestMapping(value="/Ajax/offBan.do",produces ="text/html; charset=UTF-8")
	   @ResponseBody
	   public String offBan(String id) {
		 AdminDAO dao= new AdminDAO(null);
			dao.offband(id);
		 return "ban";
	 }
	 
}
