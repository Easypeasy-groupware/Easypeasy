package com.ep.spring.approval.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ep.spring.approval.model.service.ApprovalService;
import com.ep.spring.approval.model.vo.Approval;
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
	@RequestMapping(value="enrolldraftinfo.ap", produces="application/json; charset=UTF-8")
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
	
	

}
