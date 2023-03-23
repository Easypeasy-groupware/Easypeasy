package com.ep.spring.alarm.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.alarm.controller.AlarmController;
import com.ep.spring.alarm.model.dao.AlarmDao;
import com.ep.spring.alarm.model.vo.Alarm;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.mail.model.vo.Mail;

@Service
public class AlarmServiceImpl implements AlarmService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private AlarmController aController;
	
	@Autowired
	private AlarmDao aDao;

	public void receiveMailAlarm(ArrayList<Mail> mList, int mailNo) {
		ArrayList<Alarm> alList = new ArrayList<Alarm>();
		int result = 0;
		for(Mail m : mList) {
			Alarm al = new Alarm();
			m.setMailNo(mailNo);
			result += aDao.insertReceiveMailAlarm(m, sqlSession);
		}
		
	}
	
	@Override
	public int selectAlarmListCount(int empNo) {
		int a = aDao.selectAlarmListCount(empNo, sqlSession);
		System.out.println(a);
		return a;
	}

	@Override
	public ArrayList<Alarm> selectPagingAlarmList(PageInfo alarmPi, int empNo) {
		return aDao.selectPagingAlarmList(alarmPi, empNo, sqlSession);
	}


	


}
