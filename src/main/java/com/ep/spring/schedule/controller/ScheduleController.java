package com.ep.spring.schedule.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.schedule.model.service.ScheduleService;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService scService;
	
	@RequestMapping("main.sc")
	public String mainSchedule() {
		return "schedule/scheduleMainView";
	}
}
