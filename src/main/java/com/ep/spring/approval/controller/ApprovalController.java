package com.ep.spring.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.approval.model.service.ApprovalService;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService ApprovalService;
	
	@RequestMapping("main.ap")
	public String selectAppMain() {
		return "approval/appMain";
	}

}
