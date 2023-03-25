package com.ep.spring.schedule.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.schedule.model.dao.ScheduleDao;
import com.ep.spring.schedule.model.vo.Attendee;
import com.ep.spring.schedule.model.vo.Calendar;
import com.ep.spring.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ScheduleDao scDao;

	@Override
	public int insertDefaultCalendar() {
		return scDao.insertDefaultCalendar(sqlSession);
	}

	@Override
	public ArrayList<Calendar> selectMyCalendar(int empNo) {
		return scDao.selectMyCalendar(sqlSession, empNo);
	}

	@Override
	public int insertCalendar(Calendar c) {
		return scDao.insertCalendar(sqlSession, c);
	}

	@Override
	public int insertSchedule(Schedule s) {
		return scDao.insertSchedule(sqlSession, s);
	}

	@Override
	public int insertAttendee(ArrayList<Attendee> atList) {
		return scDao.insertAttendee(sqlSession, atList);
	}

	@Override
	public Calendar selectCalendar(int calNo) {
		return scDao.selectCalendar(sqlSession, calNo);
	}

	@Override
	public int updateCalendar(Calendar c) {
		return scDao.updateCalendar(sqlSession, c);
	}

	@Override
	public int deleteSchedule(int calNo) {
		return scDao.deleteSchedule(sqlSession, calNo);
	}

	@Override
	public int deleteCalendar(int calNo) {
		return scDao.deleteCalendar(sqlSession, calNo);
	}

	@Override
	public int defaultCalUpdate(int calNo) {
		return scDao.defaultCalUpdate(sqlSession, calNo);
	}

	@Override
	public int defaultUpdate(int calNo) {
		return scDao.defaultUpdate(sqlSession, calNo);
	}

	@Override
	public ArrayList<Calendar> scheduleList(int empNo) {
		return scDao.scheduleList(sqlSession, empNo);
	}
	

	@Override
	public Schedule selectSchedule(int scNo) {
		return scDao.selectSchedule(sqlSession, scNo);
	}

	@Override
	public ArrayList<Attendee> selectAttendee(int scNo) {
		return scDao.selectAttendee(sqlSession, scNo);
	}

	@Override
	public int scheduleUpdate(Schedule s) {
		return scDao.scheduleUpdate(sqlSession, s);
	}

	/*
	@Override
	public int updateAttendee(ArrayList<Attendee> atList) {
		return scDao.updateAttendee(sqlSession, atList);
	}
	*/
	
	@Override
	public int insertUpAttendee(ArrayList<Attendee> atList) {
		return scDao.insertUpAttendee(sqlSession, atList);
	}
	
	@Override
	public int deleteAttendee(int scNo) {
		return scDao.deleteAttendee(sqlSession, scNo);
	}

	@Override
	public int scheduleDelete(int scNo) {
		return scDao.scheduleDelete(sqlSession, scNo);
	}
}
