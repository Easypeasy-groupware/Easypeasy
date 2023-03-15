package com.ep.spring.commute.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.approval.model.vo.VacationForm;
import com.ep.spring.commute.model.dao.CommuteDao;
import com.ep.spring.commute.model.vo.Commute;
import com.ep.spring.commute.model.vo.VacationRecode;


@Service
public class CommuteServiceImpl implements CommuteService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CommuteDao cDao;
	
	//출근시간 등록
	@Override
	public int inTime(Commute c) {
		
		return cDao.inTime(sqlSession, c);
	}

	//근태관리 메인페이지
	@Override
	public Commute commuteMainPage(int empNo) {
		
		return cDao.commuteMainPage(sqlSession, empNo);
	}
	
	//상태변경
	@Override
	public int updateStatus(Commute c) {
		
		return cDao.updateStatus(sqlSession, c);
	}

	//퇴근시간 등록
	@Override
	public int outTime(Commute c) {
		
		return cDao.outTime(sqlSession, c);
	}

	//12시마다 insert 스케쥴링
	@Override
	public int insertCommuteDay() {
		
		return cDao.insertCommuteDay(sqlSession);
	}

	@Override
	public ArrayList<VacationRecode> selectVacMain(int empNo) {
		
		return cDao.selectVacMain(sqlSession, empNo);
	}

	@Override
	public ArrayList<VacationForm> selectVacForm(int empNo) {
		
		return cDao.selectVacForm(sqlSession, empNo);
	}
	
	


}
