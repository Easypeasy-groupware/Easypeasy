package com.ep.spring.approval.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ep.spring.approval.model.service.ApprovalService;
import com.ep.spring.approval.model.vo.Approval;
import com.ep.spring.approval.model.vo.ApprovalLine;
import com.ep.spring.approval.model.vo.ApprovalReply;
import com.ep.spring.approval.model.vo.OverTimeForm;
import com.ep.spring.approval.model.vo.VacationForm;
import com.ep.spring.common.model.vo.AlertMsg;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.common.template.Pagination;
import com.ep.spring.login.model.vo.Employee;
import com.google.gson.Gson;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	
	
	@RequestMapping("main.ap")
	public String selectAppMain(HttpSession session, Model model) {
		
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<Approval> list1 = aService.selectMainWList(eNo);
		
		ArrayList<Approval> list2 = aService.selectMainSList(eNo);
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		
		return "approval/appMain";
	}
	
	@ResponseBody
	@RequestMapping(value="recent.ap", produces="application/json; charset=UTF-8")
	public String selectRecentApp(HttpSession session, Model model) {
		
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<Approval> list1 = aService.selectMainWList(eNo);
		ArrayList<Approval> list2 = aService.selectMainSList(eNo);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list1", list1);
		map.put("list2", list2);
		
		return new Gson().toJson(map);
	}
	
	@RequestMapping("enrollForm.ap")
	public String enrollForm(int formCode, Model model, HttpSession session) {
				
		if(formCode == 1) {
			return "approval/appDraftEnrollForm";
		}else if(formCode == 2) {
			return "approval/appProposalEnrollForm";
		}else if(formCode == 3) {
			return "approval/appVacationEnrollForm";
		}else if(formCode == 4) {
			return "approval/appOvertimeEnrollForm";
		}else {
			session.setAttribute("alertMsg", "페이지 요청오류");
			return "redirect:/";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="enrollinfo.ap", produces="application/json; charset=UTF-8")
	public String selectInfoDraft(HttpSession session, Model model) {
		
		String currentTime = new SimpleDateFormat("yyMMdd").format(new Date());
		// 4자리랜덤숫자
		int ranNum = (int)(Math.random() * 9000 + 1000);
		String appChange = currentTime + ranNum;
			
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		Approval a = aService.selectEnrollInfo(eNo); 
		
		a.setAppChange(appChange); 
		
		return new Gson().toJson(a);
		
	}
	
	@RequestMapping("recWlist.ap")
	public String selectRecWList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectWaitingAListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectWatingAList(pi, eNo);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "approval/appRecWatingListView";
	}
	
	@RequestMapping("refWlist.ap")
	public String selectRefWList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectWaitingRListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectWaitingRList(pi, eNo);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "approval/appRefWatingListView";
	}
	
	@RequestMapping("sendList.ap")
	public String selectSendList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectSendListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectSendList(pi, eNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "approval/appSendListView";
	}
	
	@RequestMapping("tempList.ap")
	public String selectTempList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectTempListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectTempList(pi, eNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "approval/appTempStorListView";
	}
	
	@RequestMapping("recList.ap")
	public String selectRecList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectRecListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectRecList(pi, eNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "approval/appRecListView";
	}
	
	@RequestMapping("refList.ap")
	public String selectRefList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectRefListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectRefList(pi, eNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "approval/appRefListView";
	}
	
	@RequestMapping("dSendList.ap")
	public String selectDeptSendList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectDeptSendListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectDeptSendList(pi, eNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "approval/appDSendCompleteListView";
	}
	
	@RequestMapping("dRefList.ap")
	public String selectDeptRefList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectDeptRefListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list= aService.selectDeptRefList(pi, eNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "approval/appDRefListView";
	}
	
	@RequestMapping("detailSPrg.ap")
	public String selectDetailSPrg(@RequestParam(value="no") int appNo, @RequestParam(value="form") String formName,
								@RequestParam(value="st")String st, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		
		
		Approval a = new Approval();
		a.setAppNo(appNo);
		a.setFormName(formName);
		a.setWriterNo(eNo);
		
		if(st.equals("기안진행")) {
			a.setTstatus("진행중");
		}	
		
		Approval ap = aService.selectDetailSPrgAp(a);
			
		
		ArrayList<ApprovalLine> list1 = aService.selectDetailSPrgAl(a);
		ArrayList<Attachment> list3 = aService.selectDetailSPrgAt(a);
		
		model.addAttribute("ap", ap);
		model.addAttribute("list1", list1);
		model.addAttribute("list3", list3);

		if(a.getFormName().equals("업무기안")) {
			
			return "approval/appDraftDetailView";
			
		}else if(a.getFormName().equals("일반품의서")) {
			
			return"approval/appProposalDetailView";
			
		}else if(a.getFormName().equals("휴가신청서")) {
			
			VacationForm vf = aService.selectDetailSPrgVf(a);
			model.addAttribute("vf", vf);
			return"approval/appVacationDetailView";
			
		}else if(a.getFormName().equals("연장근무신청서")) {
			
			OverTimeForm ot = aService.selectDetailSPrgOt(a);
			model.addAttribute("ot",ot);
			return"approval/appOvertimeDetailView";
			
		}else {
			session.setAttribute("alertMsg", "페이지 요청에 실패했습니다.");
			return"redirect:main.ap";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.ap", produces="application/json; charset=UTF-8")
	public String selectReplyList(@RequestParam(value="no") int appNo) {
		
		ArrayList<ApprovalReply> list = aService.selectReplyList(appNo);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("rinsert.ap")
	public String insertReply(@RequestParam(value="replyContent") String content,
							@RequestParam(value="replyWriter") int writerNo,
							@RequestParam(value="appNo") int appNo) {
		ApprovalReply r = new ApprovalReply();
		r.setContent(content);
		r.setWriterNo(writerNo);
		r.setAppNo(appNo);
		int result = aService.insertReply(r);
		return result>0?"success" : "error";
	}
	
	@ResponseBody
	@RequestMapping("rdelete.ap")
	public String deleteReply(@RequestParam(value="no")int replyNo) {
		int result = aService.deleteReply(replyNo);
		return result>0?"success":"error";
	}
	
	@RequestMapping("delete.ap")
	public String deleteApproval(@RequestParam(value="no")int appNo, HttpSession session, ArrayList<String> filePath) {
		

		int result = aService.deleteApproval(appNo);
		
		System.out.println(result);
		
		if(result > 0) {
				for(int i= 0; i < filePath.size(); i++) {
					if(!filePath.get(i).equals("")) {
					new File(session.getServletContext().getRealPath(filePath.get(i))).delete();
				}
			}

			AlertMsg msg = new AlertMsg("문서삭제", "성공적으로 삭제되었습니다");
			session.setAttribute("successMsg", msg);
			return "redirect:main.ap";
		}else {
			AlertMsg msg = new AlertMsg("문서삭제", "삭제에 실패했습니다.");
			session.setAttribute("failMsg", msg);
			return "redirect:main.ap";
		}
		
	}
	
	@RequestMapping("detailRec.ap")
	public String selectRecDetail(int no, String form, String st, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		
		Approval a = new Approval();
		a.setAppNo(no);
		a.setFormName(form);
		a.setReceiverNo(eNo);
		
		if(st.equals("결재대기")) {
			a.setTstatus("진행중");
		}
		
		Approval ap = aService.selectDetailRec(a);
		
		if(st.equals("참조대기")) {
			ap.setSt("참조대기");
			
			int result = aService.updateCount(a);
			
			if(result < 0) {
				AlertMsg msg = new AlertMsg("페이지 요청실패", "페이지요청에 실패했습니다.");
				session.setAttribute("failMsg", msg);
				return"redirect:main.ap";
			}
			
		}else if(st.equals("참조전체")) {
			ap.setSt("참조전체");
		}
		
		
		ArrayList<ApprovalLine> list1 = aService.selectDetailSPrgAl(a);
		ArrayList<Attachment> list3 = aService.selectDetailSPrgAt(a);
		
		model.addAttribute("ap", ap);
		model.addAttribute("list1", list1);
		model.addAttribute("list3", list3);

		if(a.getFormName().equals("업무기안")) {
			
			return "approval/appDraftDetailView";
			
		}else if(a.getFormName().equals("일반품의서")) {
			
			return"approval/appProposalDetailView";
			
		}else if(a.getFormName().equals("휴가신청서")) {
			
			VacationForm vf = aService.selectDetailSPrgVf(a);
			model.addAttribute("vf", vf);
			return"approval/appVacationDetailView";
			
		}else if(a.getFormName().equals("연장근무신청서")) {
			
			OverTimeForm ot = aService.selectDetailSPrgOt(a);
			model.addAttribute("ot",ot);
			return"approval/appOvertimeDetailView";
			
		}else {
			AlertMsg msg = new AlertMsg("페이지 요청실패", "페이지요청에 실패했습니다.");
			session.setAttribute("failMsg", msg);
			return"redirect:main.ap";
		}
		
	}
	
	/*
	@RequestMapping("search.ap")
	public String selectSearchList(@RequestParam("r-page") String rPage, @RequestParam("period") String period, 
									@RequestParam("option") String option, @RequestParam("keyword") String keyword, 
									@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		String eNo = String.valueOf(((Employee)session.getAttribute("loginUser")).getEmpNo());
		HashMap<String, String> map = new HashMap<>();
		map.put("eNo", eNo);
		map.put("rPage", rPage);
		map.put("period", period);
		map.put("option", option);
		map.put("keyword", keyword);
		
		int listCount = aService.selectSearchListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectSearchList(pi, map);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		if(rPage.equals("cw")) {
			return "approval/appRecWatingListView";
		}else if(rPage.equals("fw")) {
			return "approval/appRefWatingListView";
		}else if(rPage.equals("s")) {
			return "approval/appSendListView";
		}else if(rPage.equals("t")) {
			return "approval/appTempStorListView";
		}else if(rPage.equals("c")) {
			return "approval/appRecListView";
		}else if(rPage.equals("f")) {
			return "approval/appRefListView";
		}else if(rPage.equals("ds")) {
			return "approval/appDSendCompleteListView";
		}else {
			return "approval/appDRefListView";
		}
		
		
	}
	*/
	
	
	

}
