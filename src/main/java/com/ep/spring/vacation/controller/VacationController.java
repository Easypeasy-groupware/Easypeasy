package com.ep.spring.vacation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ep.spring.vacation.model.service.VacationService;



@Controller
public class VacationController {

	@Autowired
	private VacationService vService;
}
