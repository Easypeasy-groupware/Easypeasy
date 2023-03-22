package com.ep.spring.alarm.model.service;

import java.util.ArrayList;

import com.ep.spring.alarm.model.vo.Alarm;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.mail.model.vo.Mail;

public interface AlarmService {
	
	/* 메일 수신 알람 등록 */
	void receiveMailAlarm(ArrayList<Mail> mList, int mailNo);

	/* 알람 리스트 조회 */
	ArrayList<Alarm> selectAlarmList(int empNo);

}
