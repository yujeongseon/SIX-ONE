package com.team.sixone.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberService {
	List<MemberDTO> MyPage(String SessionID);
	int weightUpdate(Map map);//마이페이지 몸무게 수정
	
	int kakaoLoginFirstCheck(Map map);//카카오톡 처음 로그인인지 판단
	
	int kakaomemberinsert(Map map);//카카오톡 처음 로그인시 카카오톡 아이디와 이름 저장
	
	int kakaomemberlastinsert(Map map);
	
	int profileupdate(Map map);
	
	int memberjoin(Map map);
	
	int kgUpdate(Map map);
	
	int kgDown(Map map);
}
