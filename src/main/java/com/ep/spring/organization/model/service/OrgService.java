package com.ep.spring.organization.model.service;

import java.util.ArrayList;

import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Employee;

public interface OrgService {

	// 1. 멤버 리스트 조회 서비스 (페이징)
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
	
}
