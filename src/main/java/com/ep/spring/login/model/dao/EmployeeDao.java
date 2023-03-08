package com.ep.spring.login.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.login.model.vo.Employee;

@Repository
public class EmployeeDao {
	
	public Employee loginEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("employeeMapper.loginEmployee", e);
	}
	
	

}
