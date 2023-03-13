package com.ep.spring.address.model.service;

import java.util.ArrayList;

import com.ep.spring.address.model.vo.AddDept;
import com.ep.spring.address.model.vo.AddGroup;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Employee;

public interface AddressService {
	
	// 0. 로그인한 사원이 등록한 연락처 그룹 리스트
	ArrayList<AddGroup> selectPersonalAddGroup(Employee e);
	
	// 1. 즐겨찾기 리스트 조회 서비스
	
	// 2. 전체 사내주소록 조회
	int selectEntEmpListCount(int no);
	ArrayList <Employee> selectEntEmpList(PageInfo pi, int no);
	
	// 2.5 사내주소록 내에서 사용자가 즐겨찾기한 사원 리스트
	ArrayList <Employee> selectEmpFavList(int no);
	
	// 3. 부서별 사내주소록 조회
	int selectDeptEmpListCount(AddDept ad);
	ArrayList<Employee> selectDeptEmpList(PageInfo pi, AddDept ad);
	
	// 4. 사내 연락처 상세 조회
	Employee selectEmpAddDetail(int no);
	
	

}
