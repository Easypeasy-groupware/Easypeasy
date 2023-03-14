package com.ep.spring.commute.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.common.model.vo.AlertMsg;
import com.ep.spring.commute.model.service.CommuteService;
import com.ep.spring.commute.model.vo.Commute;
import com.ep.spring.login.model.vo.Employee;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService cService;
	
		//근태관리 메인페이지(일반사용자)
		@RequestMapping("commute.ep")
		public ModelAndView commuteMainForm(HttpSession session, ModelAndView mv) {
			int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
			
			Commute c = cService.commuteMainPage(empNo);
			
			 
			if(c != null) {
				mv.addObject("c", c)
				  .setViewName("commute/commuteMain");
				return mv;
			}else {
				AlertMsg msg = new AlertMsg("근태관리","나의 근무정보 조회에 실패했습니다. 다시시도 해주세요.");
				mv.addObject("failMsg", msg)
				  .setViewName("common/main");
				return mv;
			}
			
			  
			 
			
			
		
		}
		
		//출근시간 등록
		@ResponseBody
		@RequestMapping("inTime.co")
		public String inTime(Commute c) {
			
			
			int result = cService.inTime(c);
			
			return result >0 ? "success" : "fail";
			
		}
		
		
	

}
