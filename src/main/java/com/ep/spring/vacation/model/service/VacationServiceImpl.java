package com.ep.spring.vacation.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.vacation.model.dao.VacationDao;
import com.ep.spring.vacation.model.vo.Vacation;



@Service
public class VacationServiceImpl implements VacationService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private VacationDao vDao;
	
	
	@Override
	public Vacation selectVacMain(Employee e) {
		
		return null;
	}

}
