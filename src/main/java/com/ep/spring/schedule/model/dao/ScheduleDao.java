package com.ep.spring.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.schedule.model.vo.Calendar;

@Repository
public class ScheduleDao {

	public int insertDefaultCalendar(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("scheduleMapper.insertDefaultCalendar");
	}
	
	public ArrayList<Calendar> selectMyCalendar(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectMyCalendar", empNo);
	}
	
	public int insertCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("scheduleMapper.insertCalendar", c);
	}
}
