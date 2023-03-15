package com.ep.spring.vacation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.vacation.model.service.VacationService;



@Controller
public class VacationController {

	@Autowired
	private VacationService vService;
	
	@RequestMapping("vac.ep")
	public String selectVacMain() {
		return "vacation/vacationMain";
	}
}
