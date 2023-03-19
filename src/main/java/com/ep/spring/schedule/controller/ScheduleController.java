package com.ep.spring.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ep.spring.schedule.model.service.ScheduleService;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService scService;
	
}
