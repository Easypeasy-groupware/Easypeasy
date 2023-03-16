package com.ep.spring.commute.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.approval.model.vo.VacationForm;
import com.ep.spring.commute.model.vo.Commute;
import com.ep.spring.commute.model.vo.VacationRecode;
import com.ep.spring.login.model.vo.Employee;


@Repository
public class CommuteDao {
	
	//출근시간 등록
	public int inTime(SqlSessionTemplate sqlSession, Commute c) {
		return sqlSession.update("commuteMapper.inTime", c);
	}
	
	//근태관리 메인페이지 응답시 Commute 조회
	public Commute commuteMainPage(SqlSessionTemplate sqlSession, int empNo) {
		Commute c = sqlSession.selectOne("commuteMapper.commuteMainPage", empNo);
		System.out.println(c);
		System.out.println(empNo);
		return sqlSession.selectOne("commuteMapper.commuteMainPage", empNo);
	}
	
	public int updateStatus(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("commuteMapper.updateStatus", e);
	}
	
	//퇴근시간 등록
	public int outTime(SqlSessionTemplate sqlSession, Commute c) {
		return sqlSession.update("commuteMapper.outTime", c);
	}
	
	public int insertCommuteDay(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("commuteMapper.insertCommuteDay");
	}
	
	public ArrayList<VacationRecode> selectVacMain(SqlSessionTemplate sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("commuteMapper.selectVacMain", empNo);
	}
	
	public ArrayList<VacationForm> selectVacForm(SqlSessionTemplate sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("commuteMapper.selectVacForm", empNo);
	}

}
