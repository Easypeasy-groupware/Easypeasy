package com.ep.spring.login.controller;

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
	public void loginEmployee(Employee e) {
		
		Employee loginEmployee = eService.loginEmployee(e);
		
		if(loginEmployee == null) {//로그인실패
			
		}else {//로그인성공
			
		}
		
	}
	

}
