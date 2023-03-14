package com.ep.spring.commute.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ep.spring.commute.model.service.CommuteService;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService cService;
	

}
