package com.team.sixone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.sixone.service.LoginService;
import com.team.sixone.service.MemberDTO;
import com.team.sixone.service.MemberService;
@Repository
public class MemberDAO implements MemberService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<MemberDTO> MyPage(String SessionID) {
		return sqlMapper.selectList("MyPage",SessionID);
	}

	@Override
	public int weightUpdate(Map map) {
		return sqlMapper.update("weightUpdate",map);
	}

	@Override
	public int kakaoLoginFirstCheck(Map map) {
		return sqlMapper.selectOne("kakaoCheck",map);
	}

	@Override
	public int kakaomemberinsert(Map map) {
		return sqlMapper.insert("kakaomemberinsert",map);
	}

	@Override
	public int kakaomemberlastinsert(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("kakaomemberlastinsert",map);
	}

	@Override
	public int profileupdate(Map map) {
		return sqlMapper.update("profileupdate",map);
	}

	@Override
	public int memberjoin(Map map) {
		return sqlMapper.insert("memberjoin", map);
	}

	@Override
	public int kgUpdate(Map map) {
		return sqlMapper.update("kgUpdate", map);
	}

	@Override
	public int kgDown(Map map) {
		return sqlMapper.update("kgDown", map);
	}

	
	
	
	
	
}
