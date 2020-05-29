package com.team.sixone.service;

import java.util.List;
import java.util.Map;

public interface CalendarService {

	//목록 불러오기
	List<CalendarDTO> selectList();
	
	//하나 불러오기
	CalendarDTO selectOne(Map map);
	
	//입력 수정 삭제
	int insert(Map map);
	int update(Map map);
	int delete(Map map);
	
	
	
	
	
}
