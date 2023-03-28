package com.ep.spring.mail.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.common.model.vo.AlertMsg;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.common.template.FileUpload;
import com.ep.spring.common.template.Pagination;
import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.mail.model.service.MailService;
import com.ep.spring.mail.model.vo.Mail;
import com.ep.spring.mail.model.vo.MailFavorite;
import com.ep.spring.mail.model.vo.MailTag;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	@RequestMapping("list.ma")
	public ModelAndView selectMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<Mail> mailList = mService.selectReceiveMailList(email);
		ArrayList<MailTag> tagList = mService.selectTagList(empNo);
		ArrayList<ArrayList<Attachment>> attachList = mService.selectAttachmentList(mailList);
		
		int listCount = mailList.size();
		PageInfo mailPi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<Mail> pagingMailList = mService.selectList(mailPi, email);
		
		session.setAttribute("tagList", tagList);
		mv.addObject("mailList", mailList);
		mv.addObject("pgMailList", pagingMailList);
		mv.addObject("mailPi", mailPi);
		mv.addObject("attachList", attachList);
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
		AlertMsg msg = new AlertMsg();
		if(result > 0) {
			msg.setTitle("태그 추가");
			msg.setContent("태그를 성공적으로 추가했습니다.");
			mv.addObject("successMsg", msg);
		}else {
			msg.setTitle("태그 추가");
			msg.setContent("태그 추가에 실패했습니다.");
			mv.addObject("failMsg", msg);
		}
		mv.setViewName("redirect:list.ma");
		return mv;
		
	}

	@ResponseBody
	@RequestMapping(value = "send.ma", method=RequestMethod.POST)
	public Object sendMail(@RequestPart(value = "key") Map<String, Object> param, 
						   @RequestPart(value = "originNames", required = false) List<MultipartFile> originNames, 
						   ModelAndView mv, HttpSession session) {
		ArrayList<Mail> mList = new ArrayList<>();
		ArrayList<Attachment> atList = new ArrayList<>();
		AlertMsg msg = new AlertMsg();
		
		String recMailAdd = (String)param.get("recAddList");
		String refList = (String)param.get("refList");
		String hRefList = (String)param.get("hRefList");
		String mAddList = recMailAdd.substring(0, recMailAdd.length()-1);
		
		
		String[] receiverAddList = mAddList.split(",");
		String[] refAddList = refList.split("참조 - ");
		String[] hidRefAddList = hRefList.split("숨은 참조 - ");
		Mail m = new Mail();
		String mailTitle = (String)param.get("mailTitle");
		String mailContent = (String)param.get("mailContent");
		String sendMailAdd = ((Employee)session.getAttribute("loginUser")).getEmail();
		String imporMail = (String)param.get("imporMail");
		String tempStorage = (String)param.get("tempStorage");
		String status;
		
		
		if(imporMail == null) {
			imporMail = "N";
		}else {
			imporMail = "Y";
		}
		
		if(tempStorage == null) {
			tempStorage = "N";
			status = "Y";
		}else {
			tempStorage = "Y";
			status = "T";
		}
		
		m.setMailTitle(mailTitle);
		m.setMailContent(mailContent);
		m.setSendMailAdd(sendMailAdd);
		m.setTempStorage(tempStorage);
		
		// mList에 수신 메일 추가
		for(int i=0; i<receiverAddList.length; i++) {
			Mail mail = new Mail();
			mail.setSendMailAdd(sendMailAdd);
			mail.setMailTitle(mailTitle);
			mail.setMailContent(mailContent);
			mail.setRecMailAdd(receiverAddList[i]);
			mail.setReference("N");
			mail.setHiddenReference("N");
			mail.setImporMail(imporMail);
			mail.setStatus(status);
			mList.add(mail);
		}
		System.out.println(mList);
		
		// mList에 참조 메일 추가
		for(int i=1; i<refAddList.length; i++) {
			Mail mail = new Mail();
			mail.setSendMailAdd(sendMailAdd);
			mail.setMailTitle(mailTitle);
			mail.setMailContent(mailContent);
			mail.setRecMailAdd(refAddList[i]);
			mail.setReference("Y");
			mail.setHiddenReference("N");
			mail.setImporMail(imporMail);
			mail.setStatus(status);
			mList.add(mail);
		}
		
		// mList에 숨은 참조 메일 추가
		for(int i=1; i<hidRefAddList.length; i++) {
			Mail mail = new Mail();
			mail.setSendMailAdd(sendMailAdd);
			mail.setMailTitle(mailTitle);
			mail.setMailContent(mailContent);
			mail.setRecMailAdd(hidRefAddList[i]);
			mail.setReference("N");
			mail.setHiddenReference("Y");
			mail.setImporMail(imporMail);
			mail.setStatus(status);
			mList.add(mail);
		}
		
		// 첨부파일 처리
		if(originNames != null) {
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
			msg.setTitle("메일 발송");
			msg.setContent("메일을 성공적으로 발송했습니다.");
			session.setAttribute("successMsg", msg);
			session.setAttribute("mList", mList);
			return 1;
		}else {
			msg.setTitle("메일 발송");
			msg.setContent("메일 발송에 실패했습니다.");
			session.setAttribute("failMsg", msg);
			return 0;
		}
	}
	
	// 메일 상세 조회
	@RequestMapping("select.ma")
	public ModelAndView selectMail(@RequestParam int div, Mail m, HttpSession session, ModelAndView mv) {
		m.setRecMailAdd(((Employee)session.getAttribute("loginUser")).getEmail());
		mService.readMail(m);
		Mail mail = mService.selectMail(m);
		ArrayList<Mail> receiverList = mService.selectReceiverList(m);
		ArrayList<Attachment> attachmentList = mService.selectMailAttachment(m);
		ArrayList<Mail> mailList = new ArrayList<Mail>();
		switch(div) {
			case 1: mailList = mService.selectReceiveMailList(m.getRecMailAdd());
				break;
			case 2: mailList = mService.selectTodayMailList(null, m.getRecMailAdd());
				break;
			case 3: mailList = mService.selectToMeMailList(null, m.getRecMailAdd());
				break;
			case 4: mailList = mService.selectAttachMailList(null, m.getRecMailAdd());
				break;
			case 5: mailList = mService.selectSendMailList(null, m.getRecMailAdd());
				break;
			case 6: mailList = mService.selectUnreadMailList(null, m.getRecMailAdd());
				break;
			case 7: mailList = mService.selectImporMailList(null, m.getRecMailAdd());
				break;
			case 8: mailList = mService.selectTempMailList(null, m.getRecMailAdd());
				break;
			case 9: mailList = mService.selectSendMailList(null, m.getRecMailAdd());
				break;
//			case 10:mailList = mService.select
//				break;
		}
		
		mv.addObject("division", div);
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
	public Object updateReadMail(@RequestParam String recMailNoListData, String recCheck, HttpSession session) throws IOException {
		String[] recMailNoList = recMailNoListData.split(",");
		int result = mService.updateReadUnreadMail(recMailNoList, recCheck);
		
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		ArrayList<Mail> selectMailList = mService.selectReceiveMailList(email);
		if(result > 0) {
			Map<String, Object> mailList = new HashMap<String, Object>();
			mailList.put("mailList", selectMailList);
			return mailList;
		}else {
			return null;
		}
	}
	
	@RequestMapping("delete.ma")
	public ModelAndView deleateMail(ModelAndView mv, Mail m, int[] recMailNoList, HttpSession session) {
		int result = mService.deleteMail(m, recMailNoList);
		
		AlertMsg msg = new AlertMsg();
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		ArrayList<Mail> mailList = mService.selectReceiveMailList(email);
		ArrayList<MailTag> tagList = mService.selectTagList(empNo);
		
		if(result > 0) {
			mv.addObject("mailList", mailList);
			mv.addObject("tagList", tagList);
			msg.setTitle("메일 삭제");
			msg.setContent("메일을 성공적으로 삭제했습니다.");
			mv.addObject("successMsg", msg);
			return deleteMailList(1, mv, session);
		}else {
			msg.setTitle("메일 삭제");
			msg.setContent("메일 삭제에 실패했습니다.");
			mv.addObject("failMsg", msg);
			mv.setViewName("mail/receiveMailBox");
			return mv;
		}
		
	}
	
	@RequestMapping("deleteList.ma")
	public ModelAndView deleteMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		ArrayList<Mail> mailList = mService.selectDeleteMailList(email);
		
		mv.addObject("mailList", mailList);
		mv.setViewName("mail/deleteMailBox");
		return mv;
	}
	
	/* 비우기 기능 */
	@RequestMapping("completeDelete.ma")
	public ModelAndView completeDeleteMail(Mail m, ModelAndView mv, int[] recMailNoList, HttpSession session) {
		AlertMsg msg = new AlertMsg();
		int result = mService.completeDeleteMail(m, recMailNoList);
		if(result > 0) {
			msg.setTitle("영구 삭제");
			msg.setContent("메일을 성공적으로 삭제했습니다.");
			mv.addObject("successMsg", msg);
		}else {
			msg.setTitle("영구 삭제");
			msg.setContent("메일 삭제에 실패했습니다.\n삭제할 메일이 있는지 확인해주세요.");
			mv.addObject("failMsg", msg);
		}
		return deleteMailList(1, mv, session);
	}
	
	@RequestMapping("spamEnroll.ma")
	public ModelAndView spamEnroll(Mail m, ModelAndView mv, int[] recMailNoList, HttpSession session) {
		AlertMsg msg = new AlertMsg();
		int result = mService.spamEnroll(m, recMailNoList);
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		ArrayList<Mail> mailList = mService.selectReceiveMailList(email);
		if(result > 0) {
			msg.setTitle("스팸 등록");
			msg.setContent("메일을 스팸 처리했습니다.");
			mv.addObject("successMsg", msg);
			mv.addObject("mailList", mailList);
		}else {
			msg.setTitle("스팸 등록");
			msg.setContent("메일 스팸 처리에 실패했습니다.");
			mv.addObject("failMsg", msg);
		}
		
		return selectMailList(1, session, mv);
	}
	
	@RequestMapping("spamList.ma")
	public ModelAndView spamMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		ArrayList<Mail> mailList = mService.selectReceiveMailList(email);
		
		mv.addObject("mailList", mailList);
		mv.setViewName("mail/spamMailBox");
		return mv;
	}
	
	@RequestMapping("spamClear.ma")
	public ModelAndView spamClear(Mail m, ModelAndView mv, int[] recMailNoList, HttpSession session) {
		AlertMsg msg = new AlertMsg();
		int result = mService.spamClear(m, recMailNoList);
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		ArrayList<Mail> mailList = mService.selectReceiveMailList(email);
		
		if(result > 0) {
			msg.setTitle("스팸 해제");
			msg.setContent("메일 스팸 해제를 성공했습니다.");
			mv.addObject("successMsg", msg);
			return selectMailList(1, session, mv);
		}else {
			msg.setTitle("스팸 해제");
			msg.setContent("메일 스팸 해제에 실패했습니다.");
			mv.addObject("failMsg", msg);
			return spamMailList(1, mv, session);
		}
	}
	
	@RequestMapping("reply.ma")
	public ModelAndView replyMail(Mail m, int replyForwadDiv,  ModelAndView mv) {
		Mail mail = mService.selectMail(m);
		ArrayList<Mail> receiverList = mService.selectReceiverList(m);
		ArrayList<Attachment> attachmentList = mService.selectMailAttachment(m);
		mv.addObject("mail", mail);
		mv.addObject("mailDiv", replyForwadDiv);
		mv.addObject("receiverList", receiverList);
		mv.addObject("attachmentList", attachmentList);
		mv.setViewName("mail/replyMail");
		System.out.println(mail);
		System.out.println(receiverList);
		return mv;
	}
	
	@RequestMapping("tag.ma")
	public ModelAndView tagMail(Mail m, MailTag t, int[] recMailNoList, ModelAndView mv, HttpSession session) {
		AlertMsg msg = new AlertMsg();
		m.setTagNo(t.getTagNo());
		int result = mService.tagMail(m, recMailNoList);
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		ArrayList<Mail> mailList = mService.selectReceiveMailList(email);
		
		if(result > 0) {
			msg.setTitle("태그 등록");
			msg.setContent("해당 메일을 태그 등록했습니다.");
			mv.addObject("successMsg", msg);
			mv.addObject("mailList", mailList);
			return selectTaggingMailList(1, mv, t, session);
		}else {
			msg.setTitle("태그 등록");
			msg.setContent("메일 태그 등록에 실패했습니다.");
			mv.addObject("failMsg", msg);
			mv.addObject("mailList", mailList);
			mv.setViewName("mail/receiveMailBox");
			return mv;
		}
	}
	
	@RequestMapping("todayList.ma")
	public ModelAndView selectTodayMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Mail m, HttpSession session) {
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		PageInfo mailPi = null;
		ArrayList<Mail> mailList = mService.selectTodayMailList(mailPi, email);
		ArrayList<MailTag> tagList = mService.selectTagList(empNo);
		ArrayList<ArrayList<Attachment>> attachList = mService.selectAttachmentList(mailList);
		
		int listCount = mailList.size();
		mailPi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<Mail> pagingMailList = mService.selectTodayMailList(mailPi, email);
		
		session.setAttribute("tagList", tagList);
		mv.addObject("mailList", mailList);
		mv.addObject("pgMailList", pagingMailList);
		mv.addObject("attachList", attachList);
		mv.addObject("mailPi", mailPi);
		mv.setViewName("mail/todayMailBox");
		return mv;
	}
	
	@RequestMapping("tomeList.ma")
	public ModelAndView selectToMeMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Mail m, HttpSession session) {
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		PageInfo mailPi = null;
		ArrayList<Mail> mailList = mService.selectToMeMailList(mailPi, email);
		ArrayList<MailTag> tagList = mService.selectTagList(empNo);
		ArrayList<ArrayList<Attachment>> attachList = mService.selectAttachmentList(mailList);
		
		int listCount = mailList.size();
		mailPi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<Mail> pagingMailList = mService.selectToMeMailList(mailPi, email);
		
		session.setAttribute("tagList", tagList);
		mv.addObject("mailList", mailList);
		mv.addObject("pgMailList", pagingMailList);
		mv.addObject("attachList", attachList);
		mv.addObject("mailPi", mailPi);
		mv.setViewName("mail/toMeMailBox");
		return mv;
	}
	
	@RequestMapping("attachList.ma")
	public ModelAndView selectAttachMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Mail m, HttpSession session) {
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		PageInfo mailPi = null;
		ArrayList<Mail> mailList = mService.selectAttachMailList(mailPi, email);
		ArrayList<MailTag> tagList = mService.selectTagList(empNo);
		ArrayList<ArrayList<Attachment>> attachList = mService.selectAttachmentList(mailList);
		
		int listCount = mailList.size();
		mailPi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<Mail> pagingMailList = mService.selectAttachMailList(mailPi, email);
		
		session.setAttribute("tagList", tagList);
		mv.addObject("mailList", mailList);
		mv.addObject("pgMailList", pagingMailList);
		mv.addObject("attachList", attachList);
		mv.addObject("mailPi", mailPi);
		mv.setViewName("mail/attachMailbox");
		return mv;
	}
	
	@RequestMapping("imporList.ma")
	public ModelAndView selectImporMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Mail m, HttpSession session) {
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		PageInfo mailPi = null;
		ArrayList<Mail> mailList = mService.selectImporMailList(mailPi, email);
		ArrayList<MailTag> tagList = mService.selectTagList(empNo);
		ArrayList<ArrayList<Attachment>> attachList = mService.selectAttachmentList(mailList);
		
		int listCount = mailList.size();
		mailPi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<Mail> pagingMailList = mService.selectImporMailList(mailPi, email);
		
		session.setAttribute("tagList", tagList);
		mv.addObject("mailList", mailList);
		mv.addObject("pgMailList", pagingMailList);
		mv.addObject("attachList", attachList);
		mv.addObject("mailPi", mailPi);
		mv.setViewName("mail/imporMailBox");
		return mv;
	}
	
	@RequestMapping("unreadList.ma")
	public ModelAndView selectUnreadMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Mail m, HttpSession session) {
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		PageInfo mailPi = null;
		ArrayList<Mail> mailList = mService.selectUnreadMailList(mailPi, email);
		ArrayList<MailTag> tagList = mService.selectTagList(empNo);
		ArrayList<ArrayList<Attachment>> attachList = mService.selectAttachmentList(mailList);
		
		int listCount = mailList.size();
		mailPi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<Mail> pagingMailList = mService.selectUnreadMailList(mailPi, email);
		
		session.setAttribute("tagList", tagList);
		mv.addObject("mailList", mailList);
		mv.addObject("pgMailList", pagingMailList);
		mv.addObject("attachList", attachList);
		mv.addObject("mailPi", mailPi);
		mv.setViewName("mail/unreadMailBox");
		return mv;
	}
	
	@RequestMapping("sendList.ma")
	public ModelAndView selectSendMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Mail m, HttpSession session) {
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		PageInfo mailPi = null;
		ArrayList<Mail> mailList = mService.selectSendMailList(mailPi, email);
		ArrayList<MailTag> tagList = mService.selectTagList(empNo);
		ArrayList<ArrayList<Attachment>> attachList = mService.selectAttachmentList(mailList);
		
		int listCount = mailList.size();
		mailPi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<Mail> pagingMailList = mService.selectSendMailList(mailPi, email);
		session.setAttribute("tagList", tagList);
		mv.addObject("mailList", mailList);
		mv.addObject("pgMailList", pagingMailList);
		mv.addObject("attachList", attachList);
		
		mv.addObject("mailPi", mailPi);
		mv.setViewName("mail/sendMailbox");
		return mv;
	}
	
	@RequestMapping("delete.sm")
	public ModelAndView deleteSendMail(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, int[] mailNoList, HttpSession session, Mail m) {
		int result = mService.deleteSendMail(mailNoList);
		
		return selectSendMailList(1, mv, m, session);
	}
	
	@RequestMapping("tempList.ma")
	public ModelAndView selectTempMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Mail m, HttpSession session) {
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		PageInfo mailPi = null;
		ArrayList<Mail> mailList = mService.selectTempMailList(mailPi, email);
		ArrayList<MailTag> tagList = mService.selectTagList(empNo);
		ArrayList<ArrayList<Attachment>> attachList = mService.selectAttachmentList(mailList);
		
		int listCount = mailList.size();
		mailPi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<Mail> pagingMailList = mService.selectTempMailList(mailPi, email);
		
		session.setAttribute("tagList", tagList);
		mv.addObject("mailList", mailList);
		mv.addObject("pgMailList", pagingMailList);
		mv.addObject("attachList", attachList);
		mv.addObject("mailPi", mailPi);
		mv.setViewName("mail/tempMailBox");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("imporEroll.ma")
	public String enrollImporMail(Mail m) {
		String result = Integer.toString(mService.enrollImporMail(m)); 
		return result;
	}
	
	@ResponseBody
	@RequestMapping("enrollFavorMailBox.ma")
	public String enrollFavorMailBox(MailFavorite mf, HttpSession session) {
		mf.setEmpNo(((Employee)session.getAttribute("loginUser")).getEmpNo());
		String result = Integer.toString(mService.enrollFavorMailBox(mf));
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("deleteFavorMailBox.ma")
	public String deleteFavorMailBox(MailFavorite mf, HttpSession session) {
		mf.setEmpNo(((Employee)session.getAttribute("loginUser")).getEmpNo());
		String result = Integer.toString(mService.deleteFavorMailBox(mf));
		
		return result;
	}
	
	@RequestMapping("tagginMailList.ma")
	public ModelAndView selectTaggingMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, MailTag t, HttpSession session) {
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		MailTag tag = mService.selectTag(t);
		
		PageInfo mailPi = null;
		ArrayList<Mail> mailList = mService.selectTaggingMailList(t, mailPi);
		ArrayList<ArrayList<Attachment>> attachList = mService.selectAttachmentList(mailList);
		
		int listCount = mailList.size();
		mailPi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<Mail> pagingMailList = mService.selectTaggingMailList(t, mailPi);
		
		mv.addObject("mailList", mailList);
		mv.addObject("pgMailList", pagingMailList);
		mv.addObject("attachList", attachList);
		mv.addObject("mailPi", mailPi);
		mv.addObject("tag", tag);
		mv.setViewName("mail/taggingMailBox");
		return mv;
	}
	
	@RequestMapping("restore.ma")
	public ModelAndView restoreDeleteMail(Mail m, ModelAndView mv, int[] recMailNoList, HttpSession session) {
		AlertMsg msg = new AlertMsg();
		int result = mService.restoreDeleteMail(m, recMailNoList);
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		ArrayList<Mail> mailList = mService.selectReceiveMailList(email);
		
		if(result > 0) {
			msg.setTitle("메일 복원");
			msg.setContent("메일을 복원 처리했습니다.");
			mv.addObject("successMsg", msg);
			mv.addObject("mailList", mailList);
			return selectMailList(1, session, mv);
		}else {
			msg.setTitle("메일 복원");
			msg.setContent("메일 복원 처리에 실패했습니다.");
			mv.addObject("failMsg", msg);
			mv.addObject("mailList", mailList);
			return deleteMailList(1, mv, session);
		}
	}
	
	@RequestMapping("completeDeleteAll.ma")
	public ModelAndView completeDeletAll(ModelAndView mv, HttpSession session, Mail m) {
		AlertMsg msg = new AlertMsg();
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		int result = mService.completeDeleteMailAll(email, m);
		ArrayList<Mail> mailList = mService.selectReceiveMailList(email);
			
		if(result > 0) {
			msg.setTitle("비우기");
			msg.setContent("비우기 처리에 성공했습니다.");
			mv.addObject("successMsg", msg);
			mv.addObject("mailList", mailList);
			return deleteMailList(1, mv, session);
		}else {
			msg.setTitle("비우기");
			msg.setContent("비우기 처리에 실패했습니다.");
			mv.addObject("failMsg", msg);
			return selectMailList(1, session, mv);
		}
		
	}
}
