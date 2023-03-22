package com.ep.spring.alarm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import com.ep.spring.alarm.model.vo.Alarm;

@Controller
public class AlarmController {
	
	private HttpSession session;
	
	// 웹소켓 클래스로 이동 - 메일
	public String mailAlram(ArrayList<Alarm> alList) {
		System.out.println(alList);
		session.setAttribute("alarmList", alList);
		return "forward:/alarm";
	}
	
}
