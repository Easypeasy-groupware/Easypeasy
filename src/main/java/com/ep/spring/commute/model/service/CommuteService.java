package com.ep.spring.commute.model.service;

import java.util.ArrayList;

import com.ep.spring.approval.model.vo.VacationForm;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.commute.model.vo.Commute;
import com.ep.spring.commute.model.vo.VacationRecode;
import com.ep.spring.login.model.vo.Employee;


public interface CommuteService {
	
	//근태관리 메인페이지 
	Commute commuteMainPage(int empNo);
	
	//출근등록 
	int inTime(Commute c);
	
	//퇴근등록
	int outTime(Commute c);
	
	//근무시간 등록
	int workTime(Commute c);
	
	//Employee상태변경(근무,회의,외출,외근)
	int updateStatus(Employee e);
	
	//12시마다 insert scheduler
	int insertCommuteDay();
	
	//(일반사용자)휴가 메인페이지
	ArrayList<VacationRecode> selectVacMain(int empNo);
	ArrayList<VacationForm> selectVacForm(int empNo);
		
	//인사계정 사원정보 리스트 조회
	int selectListCount();
	ArrayList<Employee> selectEmpList(PageInfo pi);
	
	// 근무현황 및 계획(일반)
	ArrayList<Commute> monthlyWorkingStatus(int empNo);
	
	// 근무시간 확인 및 수정=>클릭된 사원의 정보
	Employee selectEmployeeInformation(int empNo);
	
	// 근무시간 수정(인사계정)
	int updateTimeHR(Commute c);
	int updateWorkTime(Commute c);
	
	//출근 등록시 지각,정상근무 변경
	int updateComStatus(Commute c);
	
	//퇴근 등록 시 조퇴상태 변경
	int updateLeStatus(Commute c);
	
	//지각, 조기퇴근, 결근, 퇴근 미체크 카운트
	int countTr(int empNo);
	int countLe(int empNo);
	int countAb(int empNo);
	int countEnd(int empNo);
	
	//휴가 지급(인사계정)
	int insertVacRecodePlus(VacationRecode vr);
	
	//휴가 차감(인사게정)
	int insertVacRecodeMinus(VacationRecode vr);
	
	//잔여휴가 조회
	VacationRecode selectVacRemaining(int empNo);

	//일반휴가/ 특별휴가 갯수 조회
	int selectGVac(int empNo);
	int selectSVac(int empNo);
	
	//사용한 휴가 갯수 조회
	int selectUseVac(int empNo);


}
