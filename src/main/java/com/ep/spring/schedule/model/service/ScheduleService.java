package com.ep.spring.schedule.model.service;

import java.util.ArrayList;

import com.ep.spring.schedule.model.vo.Calendar;

public interface ScheduleService {

	// 사원등록 캘린더 추가
	int insertDefaultCalendar();
	
	// 내캘린더 조회
	ArrayList<Calendar> selectMyCalendar(int empNo);
	
	// 내캘린더 추가
	int insertCalendar(Calendar c);
	
}
