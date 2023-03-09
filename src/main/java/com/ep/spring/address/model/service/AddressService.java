package com.ep.spring.address.model.service;

import java.util.ArrayList;

import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Employee;

public interface AddressService {
	
	// 1. 즐겨찾기 리스트 조회 서비스
	
	// 2. 전체 사내주소록 조회
	int selectEntEmpListCount();
	ArrayList <Employee> selectEntEmpListCount(PageInfo pi);
	
	// 3. 부서별 사내주소록 조회
	int selectDeptEmpListCount(String dept);
	ArrayList<Employee> selectDeptEmpList(PageInfo pi, String dept);
}
