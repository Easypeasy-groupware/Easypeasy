package com.ep.spring.schedule.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.schedule.model.dao.ScheduleDao;
import com.ep.spring.schedule.model.vo.Calendar;

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
}
