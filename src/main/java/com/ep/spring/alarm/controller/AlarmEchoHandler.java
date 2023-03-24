package com.ep.spring.alarm.controller;

import java.util.ArrayList;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ep.spring.alarm.model.service.AlarmService;
import com.ep.spring.alarm.model.vo.Alarm;
import com.ep.spring.login.model.vo.Employee;


public class AlarmEchoHandler extends TextWebSocketHandler {

	private ArrayList<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private AlarmService aService; 
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		int empNo = ((Employee)session.getAttributes().get("loginUser")).getEmpNo();
//		ArrayList<Alarm> alList = aService.selectAlarmList(empNo);
		
		for(WebSocketSession wss : sessionList) {

		}
	}
	
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		
		for(WebSocketSession wss : sessionList) {
			String msg = (String) message.getPayload();
			System.out.println(message);
			System.out.println(msg);
		}
		
	}
	
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}

}
