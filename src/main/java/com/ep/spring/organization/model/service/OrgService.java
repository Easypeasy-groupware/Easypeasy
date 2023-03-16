package com.ep.spring.organization.model.service;

import java.util.ArrayList;

import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Department;
import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.login.model.vo.Job;

public interface OrgService {

	// 1-1. 조회 서비스
	ArrayList<Employee> selectOrgList(int no);
	ArrayList<Department> selectDept();
	ArrayList<Job> selectJob();
	
	// 1-2. 멤버 리스트 조회 서비스 (페이징)
	int selectListCount();
	ArrayList<Employee> selectList(PageInfo pi);
	
	// 2. 멤버 회원가입 서비스
	int insertMember(Employee e);
	
	// 3. 사원번호 중복체크 서비스 (ajax)
	int noCheck(String checkNo);
	
	// 4. 사원 정보 조회 서비스
	Employee selectDetailForm(int no);
	
	// 5. 사원 정보수정 서비스
	int updateMember(Employee e);
	
	// 6. 사원 삭제 서비스
	int deleteMember();
	
	/*
	 * // 7. 설정 조회 서비스 ArrayList<Employee> selectSettingForm(Employee e);
	 */
	
	// 8. 사원 검색 서비스
	int selectSearchCount();
	ArrayList<Employee> selectSearchList(PageInfo pi);
}
