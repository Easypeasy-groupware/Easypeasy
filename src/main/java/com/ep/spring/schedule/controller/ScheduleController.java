package com.ep.spring.schedule.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.schedule.model.service.ScheduleService;
import com.ep.spring.schedule.model.vo.Calendar;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService scService;
	
	@RequestMapping("main.sc")
	public String mainSchedule(HttpSession session) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<Calendar> myCalList = scService.selectMyCalendar(empNo); 
		
		session.setAttribute("myCalList", myCalList);
		
		return "schedule/scheduleMainView";
	}
	
	@RequestMapping("insert.cal")
	public String insertCalendar(Calendar c, Model model) {
		
		int result = scService.insertCalendar(c);
		
		if(result > 0) {
			model.addAttribute("c", c);
		}
		
		return "redirect:main.sc";
	}
	
}
