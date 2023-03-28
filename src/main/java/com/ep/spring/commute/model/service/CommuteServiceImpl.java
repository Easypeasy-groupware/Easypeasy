package com.ep.spring.commute.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.approval.model.vo.VacationForm;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.commute.model.dao.CommuteDao;
import com.ep.spring.commute.model.vo.Commute;
import com.ep.spring.commute.model.vo.VacationRecode;
import com.ep.spring.login.model.vo.Employee;


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
	public int updateStatus(Employee e) {
		
		return cDao.updateStatus(sqlSession, e);
	}

	//퇴근시간 등록
	@Override
	public int outTime(Commute c) {
		
		return cDao.outTime(sqlSession, c);
	}
	
	//근무시간 등록
	@Override
	public int workTime(Commute c) {
		
		return cDao.workTime(sqlSession, c);
	}
	

	//12시마다 insert 스케쥴링
	@Override
	public int insertCommuteDay() {
		
		return cDao.insertCommuteDay(sqlSession);
	}

	//휴가 기록 조회
	@Override
	public ArrayList<VacationRecode> selectVacMain(int empNo) {
		
		return cDao.selectVacMain(sqlSession, empNo);
	}

	//휴가 신청 기록 조회
	@Override
	public ArrayList<VacationForm> selectVacForm(int empNo) {
		
		return cDao.selectVacForm(sqlSession, empNo);
	}

	//인사계정 사원정보 리스트 조회
	@Override
	public ArrayList<Employee> selectEmpList(PageInfo pi) {
		
		return cDao.selectEmpList(sqlSession, pi);
	}

	@Override
	public int selectListCount() {
		
		return cDao.selectListCount(sqlSession);
	}

	//근무현황 및 계획 (일반)
	@Override
	public ArrayList<Commute> monthlyWorkingStatus(int empNo) {
		
		return cDao.monthlyWorkingStatus(sqlSession, empNo);
	}

	// 근무시간 확인 및 수정=>클릭된 사원의 정보
	@Override
	public Employee selectEmployeeInformation(int empNo) {
		
		return cDao.selectEmployeeInformation(sqlSession, empNo);
	}

	// 근무시간 수정(인사계정)
	@Override
	public int updateTimeHR(Commute c) {
		
		return cDao.updateTimeHR(sqlSession, c);
	}

	//출근 등록시 지각,정상근무 변경
	@Override
	public int updateComStatus(Commute c) {
		
		return cDao.updateComStatus(sqlSession, c);
	}

	//퇴근 등록시 조퇴상태 변경
	@Override
	public int updateLeStatus(Commute c) {
		
		return cDao.updateLeStatus(sqlSession, c);
	}

	//지각 횟수
	@Override
	public int countTr(int empNo) {
		
		return cDao.countTr(sqlSession, empNo);
	}

	//조퇴 횟수
	@Override
	public int countLe(int empNo) {
		
		return cDao.countLe(sqlSession, empNo);
	}

	// 결근 횟수
	@Override
	public int countAb(int empNo) {
		
		return cDao.countAb(sqlSession, empNo);
	}

	//퇴근 미체크 횟수
	@Override
	public int countEnd(int empNo) {
		
		return cDao.countEnd(sqlSession, empNo);
	}

	//휴가 지급(인사계정)
	@Override
	public int insertVacRecodePlus(VacationRecode vr) {
		
		return cDao.insertVacRecodePlus(sqlSession, vr);
	}

	//휴가 차감(인사게정)
	@Override
	public int insertVacRecodeMinus(VacationRecode vr) {
		
		return cDao.insertVacRecodeMinus(sqlSession, vr);
	}

	//잔여휴가 조회
	@Override
	public VacationRecode selectVacRemaining(int empNo) {
		
		return cDao.selectVacRemaining(sqlSession, empNo);
	}

	//일반휴가 조회
	@Override
	public int selectGVac(int empNo) {
		
		return cDao.selectGVac(sqlSession, empNo);
	}

	//특별휴가 조회
	@Override
	public int selectSVac(int empNo) {
		
		return cDao.selectSVac(sqlSession, empNo);
	}

	//사용한 휴가 갯수 조회
	@Override
	public int selectUseVac(int empNo) {

		return cDao.selectUseVac(sqlSession, empNo);
	}


	


	
	


}
