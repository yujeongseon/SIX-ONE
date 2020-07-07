package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.team.sixone.service.LoginService;
import com.team.sixone.service.MemberDTO;
import com.team.sixone.service.MemberService;
@Service("MemberService")
public class MemberServiceImpl implements MemberService{
	@Resource(name = "memberDAO")
	private MemberDAO dao;

	@Override
	public java.util.List<MemberDTO> MyPage(String SessionID) {
		return dao.MyPage(SessionID);
	}

	@Override
	public int weightUpdate(Map map) {
		return dao.weightUpdate(map);
	}

	@Override
	public int kakaoLoginFirstCheck(Map map) {
		return dao.kakaoLoginFirstCheck(map);
	}

	@Override
	public int kakaomemberinsert(Map map) {
		return dao.kakaomemberinsert(map);
	}

	@Override
	public int kakaomemberlastinsert(Map map) {
		return dao.kakaomemberlastinsert(map);
	}

	@Override
	public int profileupdate(Map map) {
		return dao.profileupdate(map);
	}

	@Override
	public int memberjoin(Map map) {
		return dao.memberjoin(map);
	}

	@Override
	public List<MemberDTO> passsearch(Map map) {
		return dao.passsearch(map);
	}
	

}
