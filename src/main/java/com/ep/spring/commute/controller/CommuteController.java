package com.ep.spring.commute.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.commute.model.service.CommuteService;
import com.ep.spring.login.model.vo.Employee;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService cService;
	
	//근태관리 메인페이지(일반사용자)
		@RequestMapping("commute.ep")
		public String commuteMainForm() {
			return "commute/commuteMain";
		}
		
		//출근시간 등록
		@RequestMapping("inTime.co")
		public void inTime(String time, HttpSession session) {
		
			
			
		}
		
		
	

}
