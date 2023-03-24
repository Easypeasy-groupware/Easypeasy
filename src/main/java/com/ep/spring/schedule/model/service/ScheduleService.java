package com.ep.spring.schedule.model.service;

import java.util.ArrayList;

import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.schedule.model.vo.Attendee;
import com.ep.spring.schedule.model.vo.Calendar;
import com.ep.spring.schedule.model.vo.Schedule;

public interface ScheduleService {

	// 사원등록 캘린더 추가
	int insertDefaultCalendar();
	
	// 내캘린더 조회
	ArrayList<Calendar> selectMyCalendar(int empNo);
	
	// 내캘린더 추가
	int insertCalendar(Calendar c);
	
	// 일정추가
	int insertSchedule(Schedule s);
	
	// 참석자 추가
	int insertAttendee(ArrayList<Attendee> atList);
	
	// 선택한 캘린더 조회
	Calendar selectCalendar(int calNo);
	
	// 캘린더 수정
	int updateCalendar(Calendar c);
	
	// 캘린더 삭제
	int deleteSchedule(int calNo);
	int deleteCalendar(int calNo);

	// 기본 캘린더 설정
	int defaultCalUpdate(int calNo);
	int defaultUpdate(int calNo);
	
	// 일정 조회
	ArrayList<Calendar> scheduleList(int empNo);

}
