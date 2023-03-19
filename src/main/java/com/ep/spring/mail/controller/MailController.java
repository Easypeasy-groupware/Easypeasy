package com.ep.spring.mail.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.common.model.vo.AlertMsg;
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
	public ModelAndView selectMailList(HttpSession session, ModelAndView mv) {
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<Mail> mailList = mService.selectReceiveMailList(email);
		ArrayList<MailTag> tagList = mService.selectTagList(empNo);
		
		session.setAttribute("tagList", tagList);
		mv.addObject("mailList", mailList);
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
			mv.addObject("successMsg", "태그가 추가되었습니다");
		}else {
			mv.addObject("failMsg", "태그 추가에 실패하였습니다");
		}
		mv.setViewName("redirect:list.ma");
		return mv;
		
	}

	
	@RequestMapping(value = "send.ma")
	public ModelAndView sendMail(@RequestParam List<MultipartFile> originNames , Mail m, ModelAndView mv, 
			  					 HttpSession session, String recMailAdd, String refList, String hRefList) {

		String mAddList = recMailAdd.substring(0, recMailAdd.length()-1);
		String[] receiverAddList = mAddList.split(",");
		String[] refAddList = refList.split("참조 - ");
		String[] hidRefAddList = hRefList.split("숨은 참조 - ");
		ArrayList<Mail> mList = new ArrayList<>();
		ArrayList<Attachment> atList = new ArrayList<>();
		
		// mList에 수신 메일 추가
		for(int i=0; i<receiverAddList.length; i++) {
			Mail mail = new Mail();
			mail.setSendMailAdd(m.getSendMailAdd());
			mail.setMailTitle(m.getMailTitle());
			mail.setMailContent(m.getMailContent());
			mail.setRecMailAdd(receiverAddList[i]);
			mail.setReference("N");
			mail.setHiddenReference("N");
			if(m.getImporMail() == "on") {
				mail.setImporMail("Y");
			}else {
				mail.setImporMail("N");
			}
			mList.add(mail);
		}
		
		// mList에 참조 메일 추가
		for(int i=1; i<refAddList.length; i++) {
			Mail mail = new Mail();
			mail.setSendMailAdd(m.getSendMailAdd());
			mail.setMailTitle(m.getMailTitle());
			mail.setMailContent(m.getMailContent());
			mail.setRecMailAdd(refAddList[i]);
			mail.setReference("Y");
			mail.setHiddenReference("N");
			if(m.getImporMail() == "on") {
				mail.setImporMail("Y");
			}else {
				mail.setImporMail("N");
			}
			mList.add(mail);
		}
		
		// mList에 숨은 참조 메일 추가
		for(int i=1; i<hidRefAddList.length; i++) {
			Mail mail = new Mail();
			mail.setSendMailAdd(m.getSendMailAdd());
			mail.setMailTitle(m.getMailTitle());
			mail.setMailContent(m.getMailContent());
			mail.setRecMailAdd(hidRefAddList[i]);
			mail.setReference("N");
			mail.setHiddenReference("Y");
			if(m.getImporMail() == "on") {
				mail.setImporMail("Y");
			}else {
				mail.setImporMail("N");
			}
			mList.add(mail);
		}
		
		// 첨부파일 처리
		if(originNames.size() > 1) {
			String path = "resources/mail_attachFiles/";
			for (MultipartFile mf : originNames) {
				Attachment attach = new Attachment();
				String originFileName = mf.getOriginalFilename();
				String saveFilePath = FileUpload.saveFile(mf, session, path);
				String[] changeNameArr = saveFilePath.split("/");
				String changeName = changeNameArr[2];
				attach.setOriginName(originFileName);
				attach.setChangeName(changeName);
				attach.setFilePath(saveFilePath);
				atList.add(attach);
			}
		}
		
		int sendResult = mService.sendMail(m, mList, atList);
		
		if(sendResult > 0) {
			mv.addObject("successMsg", "메일을 성공적으로 발송했습니다");
		}else {
			mv.addObject("failMsg", "메일 발송에 실패했습니다");
		}
		mv.setViewName("redirect:list.ma");
		return mv;
	}
	
	// 메일 상세 조회
	@RequestMapping("select.ma")
	public ModelAndView selectMail(HttpSession session, ModelAndView mv, Mail m) {
		m.setRecMailAdd(((Employee)session.getAttribute("loginUser")).getEmail());
		mService.readMail(m);
		int unReadCount = mService.unReadCount(m);
		Mail mail = mService.selectMail(m);
		ArrayList<Mail> receiverList = mService.selectReceiverList(m);
		ArrayList<Attachment> attachmentList = mService.selectAttachmentList(m);
		ArrayList<Mail> mailList = mService.selectReceiveMailList(m.getRecMailAdd());
		
		mv.addObject("mail", mail);
		mv.addObject("receiverList", receiverList);
		mv.addObject("attachmentList", attachmentList);
		mv.addObject("mailList", mailList);
		mv.setViewName("mail/receiveMail");
		return mv;
	}
	
	// 메일 읽음/안읽음 처리
	@ResponseBody
	@RequestMapping(value="updateReadUnread.ma")
	public void updateReadMail(HttpServletResponse response, HttpSession session, Mail m) throws IOException {
		int result = mService.updateReadUnreadMail(m);
		if(result > 0) {
			m = mService.selectMail(m);
			String recCheck = m.getRecCheck();
			
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(recCheck);
		}
	}
	
	@RequestMapping("delete.ma")
	public ModelAndView deleateMail(ModelAndView mv, Mail m, int empNo) {
		int result = mService.deleteMail(m);
		
		AlertMsg msg = new AlertMsg();
		if(result > 0) {
			ArrayList<Mail> mailList = mService.selectReceiveMailList(m.getRecMailAdd());
			ArrayList<MailTag> tagList = mService.selectTagList(empNo);
			
			mv.addObject("mailList", mailList);
			mv.addObject("tagList", tagList);
			
			msg.setTitle("메일 삭제");
			msg.setContent("메일을 성공적으로 삭제했습니다.");
			mv.addObject("successMsg", msg);
			mv.setViewName("mail/receiveMailBox");
			return mv;
		}else {
			msg.setTitle("메일 삭제");
			msg.setContent("메일을 성공적으로 삭제했습니다.");
			mv.addObject("failMsg", msg);
			mv.setViewName("mail/receiveMailBox");
			return mv;
		}
		
	}
	
	@RequestMapping("deleteList.ma")
	public ModelAndView deleteMailList(ModelAndView mv, HttpSession session) {
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		ArrayList<Mail> mailList = mService.selectReceiveMailList(email);
		
		mv.addObject("mailList", mailList);
		mv.setViewName("mail/deleteMailBox");
		return mv;
	}
	
	@RequestMapping("completeDelete.ma")
	public String completeDeleteMail(Mail m) {
		System.out.println(m);
		int result = mService.completeDeleteMail(m);
		
		return "mail/receiveMailBox";
	}
	
}
