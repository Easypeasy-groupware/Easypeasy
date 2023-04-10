package com.ep.spring.login.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.login.model.dao.EmployeeDao;
import com.ep.spring.login.model.vo.Department;
import com.ep.spring.login.model.vo.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private EmployeeDao eDao;

	@Override //로그인
	public Employee loginEmployee(Employee e) {
		
		return eDao.loginEmployee(sqlSession, e);
	}

	@Override //아이디찾기
	public Employee findId(Employee e) {
		
		return eDao.findId(sqlSession, e);
	}

	@Override //마이페이지 정보수정
	public int updateEmployee(Employee e) {
		
		return eDao.updateEmployee(sqlSession, e);
	}

	@Override //비밀번호 변경
	public int updatePwd(Employee e) {
		
		return eDao.updatePwd(sqlSession, e);
	}

	@Override //프로필 사진변경
	public int updateProfile(Employee e) {
		
		return eDao.updateProfile(sqlSession, e);
	}

	
	
	// [추가] 부서 전체 조회
	@Override
	public ArrayList<Department> selectDeptList() {
		return eDao.selectDeptList(sqlSession);
	}

	@Override
	public int updateDefaultProfile(Employee e) {
		return eDao.updateDefaultProfile(sqlSession, e);
	}

	// [메일] 사원 전체 메일 주소 조회
	@Override
	public ArrayList<Employee> selectMailList() {
		return eDao.selectMailList(sqlSession);
	}

	
	
	

}
