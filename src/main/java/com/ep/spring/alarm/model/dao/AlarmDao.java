package com.ep.spring.alarm.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.alarm.model.vo.Alarm;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.mail.model.vo.Mail;

@Repository
public class AlarmDao {

	public int insertReceiveMailAlarm(Mail m, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("alarmMapper.insertReceiveMailAlarm", m);
	}

	public Alarm selectReceiveMailAlarm(Mail m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("alarmMapper.selectReceiveMailAlarm", m);
	}

	public ArrayList<Alarm> selectAlarmList(int empNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("alarmMapper.selectAlarmList", empNo);
	}

}
