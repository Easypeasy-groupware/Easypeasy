package com.ep.spring.approval.controller;

import java.util.ArrayList;
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
	public String enrollForm(int newForm) {
		
		System.out.println(newForm);
		
		if(newForm == 1) {
			
		}else if(newForm == 2) {
			
		}else if(newForm == 3) {
			
		}else if(newForm == 4) {
			
		}
		
		return "";
	}
	
	

}
