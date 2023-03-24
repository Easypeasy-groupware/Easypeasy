package com.ep.spring.alarm.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.alarm.model.vo.Alarm;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.mail.model.vo.Mail;

@Repository
public class AlarmDao {

	public int insertReceiveMailAlarm(Mail m, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("alarmMapper.insertReceiveMailAlarm", m);
	}
	
	public int selectAlarmListCount(int empNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("alarmMapper.selectAlarmListCount", empNo);
	}

	public ArrayList<Alarm> selectPagingAlarmList(PageInfo alarmPi, int empNo, SqlSessionTemplate sqlSession) {
		int offset = (alarmPi.getCurrentPage() - 1) * alarmPi.getBoardLimit();
		int limit = alarmPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("alarmMapper.selectPagingAlarmList", empNo, rowBounds);
	}

}
