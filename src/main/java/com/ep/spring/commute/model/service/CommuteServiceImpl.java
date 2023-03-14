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
	
	//출근하기 등록
	@Override
	public int inTime(Commute c) {
		
		return 0;
	}

	//근태관리 메인페이지
	@Override
	public Commute commuteMainPage(int empNo) {
		
		return cDao.commuteMainPage(sqlSession, empNo);
	}
	
	


}
