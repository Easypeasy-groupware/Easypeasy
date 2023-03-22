package com.ep.spring.alarm.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.alarm.controller.AlarmController;
import com.ep.spring.alarm.model.dao.AlarmDao;
import com.ep.spring.alarm.model.vo.Alarm;
import com.ep.spring.mail.model.vo.Mail;

@Service
public class AlarmServiceImpl implements AlarmService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private AlarmController aController;
	
	@Autowired
	private AlarmDao aDao;

	@Override
	public void receiveMailAlarm(ArrayList<Mail> mList, int mailNo) {
		ArrayList<Alarm> alList = new ArrayList<Alarm>();
		int result = 0;
		for(Mail m : mList) {
			Alarm al = new Alarm();
			m.setMailNo(mailNo);
			result += aDao.insertReceiveMailAlarm(m, sqlSession);
			al = aDao.selectReceiveMailAlarm(m, sqlSession);
		}
		
	}

	@Override
	public ArrayList<Alarm> selectAlarmList(int empNo) {
		return aDao.selectAlarmList(empNo, sqlSession);
	}


}
