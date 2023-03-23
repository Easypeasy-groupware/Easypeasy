package com.ep.spring.commute.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.approval.model.vo.VacationForm;
import com.ep.spring.common.model.vo.PageInfo;
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
//		Commute c = sqlSession.selectOne("commuteMapper.commuteMainPage", empNo);
//		System.out.println(c);
//		System.out.println(empNo);
		return sqlSession.selectOne("commuteMapper.commuteMainPage", empNo);
	}
	
	// 근무상태 변경 
	public int updateStatus(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("commuteMapper.updateStatus", e);
	}
	
	//퇴근시간 등록
	public int outTime(SqlSessionTemplate sqlSession, Commute c) {
		return sqlSession.update("commuteMapper.outTime", c);
	}
	
	//12시 정각마다 실행되는 스케줄링
	public int insertCommuteDay(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("commuteMapper.insertCommuteDay");
	}
	
	//휴가내역 기록 조회
	public ArrayList<VacationRecode> selectVacMain(SqlSessionTemplate sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("commuteMapper.selectVacMain", empNo);
	}
	
	//휴가 신청 기록 조회
	public ArrayList<VacationForm> selectVacForm(SqlSessionTemplate sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("commuteMapper.selectVacForm", empNo);
	}
	
	//사원 정보 갯수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("commuteMapper.selectListCount");
	}
	
	//인사계정 사원 정보 리스트 조회
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.selectEmpList", null, rowBounds);
	}
	
	//근무현황 및 계획(일반)
	public ArrayList<Commute> monthlyWorkingStatus(SqlSessionTemplate sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("commuteMapper.monthlyWorkingStatus", empNo);
	}
	
	// 근무시간 확인 및 수정=>클릭된 사원의 정보
	public Employee selectEmployeeInformation(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("commuteMapper.selectEmployeeInformation", empNo);
	}
	
	// 근무시간 수정(인사계정)
	public int updateTimeHR(SqlSessionTemplate sqlSession, Commute c) {
		return sqlSession.update("commuteMapper.updateTimeHR", c);
	}
	


}
