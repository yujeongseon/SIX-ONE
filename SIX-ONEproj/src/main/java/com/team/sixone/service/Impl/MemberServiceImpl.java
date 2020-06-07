package com.team.sixone.service.Impl;

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
	

}
