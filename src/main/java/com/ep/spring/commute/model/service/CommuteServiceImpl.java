package com.ep.spring.commute.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.commute.model.dao.CommuteDao;
import com.ep.spring.commute.model.vo.Commute;

@Service
public class CommuteServiceImpl implements CommuteService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CommuteDao cDao;
	
	
	@Override
	public int inTime(Commute c) {
		
		return 0;
	}
	
	


}
