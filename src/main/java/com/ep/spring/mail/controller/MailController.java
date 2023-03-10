package com.ep.spring.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.mail.model.service.MailService;
import com.ep.spring.mail.model.vo.MailTag;
import com.ep.spring.mail.model.vo.ReceiveMail;

@Controller
public class MailController {

	@Autowired
	private MailService mService;
	
	@RequestMapping("list.ma")
	public ModelAndView selectMailList(String email, HttpSession session, ModelAndView mv) {
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<ReceiveMail> mailList = mService.selectReceiveMailList(email);
		ArrayList<MailTag> tagList = mService.selectTagList(empNo);
		
		mv.addObject("mailList", mailList);
		mv.addObject("tagList", tagList);
		mv.setViewName("mail/receiveMailBox");
		return mv;
	}
	
	@RequestMapping("enrollForm.sm")
	public String enrollFormSendMail() {
		return "mail/sendMail";
	}
	
	
	@RequestMapping("insert.tg")
	public ModelAndView insertTag(MailTag t, ModelAndView mv) {
		
		System.out.println(t);
		int result = mService.insertTag(t);
		
		if(result > 0) {
			mv.addObject("alertMsg", "태그가 추가되었습니다");
		}else {
			mv.addObject("alertMsg", "태그 추가에 실패하였습니다");
		}
		mv.setViewName("redirect:list.ma");
		return mv;
		
	}
	
//	@RequestMapping("send.ma")
//	public String 
	
	
}
