package com.ep.spring.login.model.service;

import com.ep.spring.login.model.vo.Employee;

public interface EmployeeService {
	
	// 로그인 서비스
	Employee loginEmployee(Employee e);
	
	// 아이디 찾기
	int findId(Employee e);
	
	// 비밀번호 찾기
	
	// 비밀번호 수정
	
	// 마이페이지 조회
	Employee selectEmployee(Employee e);
	
	// 마이페이지 수정
	
	

}
