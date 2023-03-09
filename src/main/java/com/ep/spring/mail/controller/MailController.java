package com.ep.spring.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.mail.model.service.MailService;

@Controller
public class MailController {

	@Autowired
	private MailService mailService;
	
	@RequestMapping("list.ma")
	public String selectMailList() {
		return "mail/receiveMailBox";
	}
	
	@RequestMapping("enrollForm.sm")
	public String enrollFormSendMail() {
		return "mail/sendMail";
	}
	
	@RequestMapping("send.ma")
	public String 
	
	
}
