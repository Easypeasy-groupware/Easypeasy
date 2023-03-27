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

	// 일정 상세 조회
	Schedule selectSchedule(int scNo);
	ArrayList<Attendee> selectAttendee(int scNo);

	// 일정 수정
	int scheduleUpdate(Schedule s);
	// 참석자 삭제
	int deleteAttendee(int scNo);
	// 참석자 다시 등록
	int insertUpAttendee(ArrayList<Attendee> atList);

	// 일정 삭제(status = 'N')
	int scheduleDelete(int scNo);

	// 메인페이지 일정top3 조회
	ArrayList<Schedule> scheduleTopList(int empNo);

	// 검색
	ArrayList<Schedule> seheduleSearchList(String keyword);
	

}
