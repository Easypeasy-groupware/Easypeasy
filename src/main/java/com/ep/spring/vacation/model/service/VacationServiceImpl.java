package com.ep.spring.vacation.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.vacation.model.dao.VacationDao;



@Service
public class VacationServiceImpl implements VacationService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private VacationDao vDao;

}
