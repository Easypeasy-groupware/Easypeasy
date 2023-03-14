package com.ep.spring.commute.model.service;

import com.ep.spring.commute.model.vo.Commute;

public interface CommuteService {
	
	//근태관리 메인페이지 
	Commute commuteMainPage(int empNo);
	
	//출근등록 
	int inTime(Commute c);

}
