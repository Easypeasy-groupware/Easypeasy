package com.ep.spring.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.login.model.service.EmployeeService;
import com.ep.spring.login.model.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService eService;
	
	@RequestMapping("login.ep")
	public String loginEmployee(Employee e, HttpSession session) {
		
		Employee loginUser = eService.loginEmployee(e);
		
		if(loginUser == null) {//로그인실패
			session.setAttribute("alertMsg", "로그인에 실패했습니다. 다시 시도 해주세요.");
			return "redirect:/";
		}else {//로그인성공
			session.setAttribute("loginUser", loginUser);
			return "common/main";
		}
		
	}
	

}
