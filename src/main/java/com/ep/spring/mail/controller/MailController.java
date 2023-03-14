package com.ep.spring.mail.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.template.FileUpload;
import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.mail.model.service.MailService;
import com.ep.spring.mail.model.vo.Mail;
import com.ep.spring.mail.model.vo.MailTag;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	
	@RequestMapping("list.ma")
	public ModelAndView selectMailList(String email, HttpSession session, ModelAndView mv) {
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<Mail> mailList = mService.selectReceiveMailList(email);
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
		int result = mService.insertTag(t);
		
		if(result > 0) {
			mv.addObject("alertMsg", "태그가 추가되었습니다");
		}else {
			mv.addObject("alertMsg", "태그 추가에 실패하였습니다");
		}
		mv.setViewName("redirect:list.ma");
		return mv;
		
	}

	
	@RequestMapping(value = "send.ma")
	public ModelAndView sendMail(MultipartHttpServletRequest multipartRequest, Attachment at, Mail m, ModelAndView mv, HttpSession session) {
		ArrayList<Mail> mList = new ArrayList<>();
		Mail mail = null;
		System.out.println(m.getRecMailAdd());
		String[] receiverAddList = m.getRecMailAdd().split(",");
		for(int i=0; i<receiverAddList.length; i++) {
			System.out.println(receiverAddList[i]);
//			mail.setRecMailAdd(receiverAddList[i]);
//			mList.add(mail);
		}
		System.out.println(mList);
		int result = mService.sendMail(m);
		
		if(!multipartRequest.getFiles("orginNames").isEmpty()) {
			ArrayList<Attachment> atList = new ArrayList<>();
			List<MultipartFile> fileList = multipartRequest.getFiles("originNames");
			
			String path = "resources/mail_attachFiles/";
			for (MultipartFile mf : fileList) {
				String originFileName = mf.getOriginalFilename();
				String saveFilePath = FileUpload.saveFile(mf, session, path);
				at.setOriginName(mf.getOriginalFilename());
				at.setFilePath(FileUpload.saveFile(mf, session, path));
				atList.add(at);
				try {
					mf.transferTo(new File(saveFilePath));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}
		
		
		return mv;
	}
	
	
}
