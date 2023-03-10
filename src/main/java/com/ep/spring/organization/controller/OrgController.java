package com.ep.spring.organization.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.board.model.service.BoardService;

@Controller
public class OrgController {

	@Autowired
	private BoardService oService;
	
	@RequestMapping("list.org")
	public String orgList() {
		return "organization/orgMain";
	}
	
	@RequestMapping("adminList.org")
	public String adminList() {
		return "organization/orgMainAdmin";
	}
	/*
	@RequestMapping("memberList.org")
	public void memberList() {
		
	}
	*/
	
	
}
