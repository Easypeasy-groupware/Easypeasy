package com.ep.spring.commute.model.service;

import com.ep.spring.commute.model.vo.Commute;

public interface CommuteService {
	
	//근태관리 메인페이지 
	Commute commuteMainPage(int empNo);
	
	//출근등록 
	int inTime(Commute c);
	
	//퇴근등록
	int outTime(Commute c);
	
	//Employee상태변경(근무,회의,외출,외근)
	int updateStatus(Commute c);
	

}
