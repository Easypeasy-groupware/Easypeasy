package com.ep.spring.approval.model.service;

import java.util.ArrayList;

import com.ep.spring.approval.model.vo.Approval;

public interface ApprovalService {
	
	// 1. 메인페이지 결재대기문서 조회용 서비스(4개)
	ArrayList<Approval> selectMainWList(int eNo);
	
	// 메인페이지 기안진행문서 조회용 서비스(5개)
	ArrayList<Approval> selectMainSList(int eNo);
	
	// 2. 결재대기문서 조회용 서비스(페이징)
	int selectWaitingAListCount();
	ArrayList<Approval> selectWatingAList();
	
	// 3. 참조대기문서 조회용 서비스(페이징)
	int selectWaitingRListCount();
	ArrayList<Approval> selectWaitingRList();
	
	// 4. 기안문서함 조회용 서비스(페이징)
	int selectSendListCount();
	ArrayList<Approval> selectSendList();
	
	// 5. 임시저장함 조회용 서비스(페이징)
	int selectTempListCount();
	ArrayList<Approval> selectTempList();
	
	// 6. 결재문서함 조회용 서비스(페이징)
	int selectApprovalListCount();
	ArrayList<Approval> selectApprovalList();
	
	// 7. 참조문서함 조회용 서비스(페이징)
	int selectRefListCount();
	ArrayList<Approval> selectRefList();
	
	// 8. 부서용 기안완료함 조회용 서비스(페이징)
	int selectDeptSendListCount();
	ArrayList<Approval> selectDeptSendList();
	
	// 9. 부서용 부서참조함 조회용 서비스(페이징)
	int selectDeptRefListCount();
	ArrayList<Approval> selectDeptRefList();
	
	
	
	

}
