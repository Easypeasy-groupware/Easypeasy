package com.ep.spring.login.model.service;

import java.util.ArrayList;

import com.ep.spring.login.model.vo.Department;
import com.ep.spring.login.model.vo.Employee;

public interface EmployeeService {
	
	// 로그인 서비스
	Employee loginEmployee(Employee e);
	
	// 아이디 찾기
	Employee findId(Employee e);
	
	// 비밀번호 찾기
	
	// 비밀번호 수정
	int updatePwd(Employee e);
	
	// 마이페이지 조회
	//Employee selectEmployee(Employee e);
	
	// 마이페이지 수정
	int updateEmployee(Employee e);
	
	// 프로필사진 변경
	int updateProfile(Employee e);
	
	
	
	// [추가] 부서 전체 조회
	ArrayList<Department> selectDeptList();

	int updateDefaultProfile(Employee e);

}
