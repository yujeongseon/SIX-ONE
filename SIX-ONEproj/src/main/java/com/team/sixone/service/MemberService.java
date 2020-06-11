package com.team.sixone.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberService {
	List<MemberDTO> MyPage(String SessionID);
	int weightUpdate(Map map);
}
