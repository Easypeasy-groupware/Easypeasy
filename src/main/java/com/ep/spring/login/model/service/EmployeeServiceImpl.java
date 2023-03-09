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

	@Override
	public Employee loginEmployee(Employee e) {
		
		return eDao.loginEmployee(sqlSession, e);
	}

	@Override
	public int findId(Employee e) {
		
		return eDao.findId(sqlSession, e);
	}

	@Override
	public Employee selectEmployee(Employee e) {
		
		return null;
	}
	
	

}
