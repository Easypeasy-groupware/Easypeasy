package com.ep.spring.commute.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.commute.model.service.CommuteService;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService cService;
	
	//근태관리 메인페이지(일반사용자)
		@RequestMapping("commute.ep")
		public String commuteMainForm() {
			return "commute/commuteMain";
		}
	

}
