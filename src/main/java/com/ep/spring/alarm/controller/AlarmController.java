package com.ep.spring.alarm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.alarm.model.service.AlarmService;
import com.ep.spring.alarm.model.vo.Alarm;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.common.template.Pagination;
import com.ep.spring.login.model.vo.Employee;

@Controller
public class AlarmController {
	
	@Autowired
	private AlarmService aService;
	
//	@RequestMapping()
	
	@ResponseBody
	@RequestMapping(value="alarm.al")
	public String selectAlarmList(@RequestParam(value="cpage", defaultValue="1", required = false) int currentPage, 
								  ModelAndView mv, HttpSession session) throws Exception {
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int alarmListCount = aService.selectAlarmListCount(empNo);
		PageInfo alarmPi = Pagination.getPageInfo(alarmListCount, currentPage, 5, 10);
		ArrayList<Alarm> pagingAlarmList = aService.selectPagingAlarmList(alarmPi, empNo);
		System.out.println(pagingAlarmList);
		System.out.println(alarmPi);
		
		session.setAttribute("pgAlarmList", pagingAlarmList);
		session.setAttribute("alarmPi", alarmPi);
		return "Y";
	}
}
