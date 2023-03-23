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
}
