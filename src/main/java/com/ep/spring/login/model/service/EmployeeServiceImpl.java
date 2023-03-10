package com.ep.spring.login.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.login.model.dao.EmployeeDao;
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
	public int findId(Employee e) {
		
		return eDao.findId(sqlSession, e);
	}

	@Override //마이페이지 정보수정
	public int updateEmployee(Employee e) {
		
		return eDao.updateEmployee(sqlSession, e);
	}

	
	
	

}
