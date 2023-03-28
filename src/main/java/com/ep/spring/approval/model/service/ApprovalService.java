package com.ep.spring.approval.model.service;

import java.util.ArrayList;

import com.ep.spring.approval.model.vo.Approval;
import com.ep.spring.approval.model.vo.ApprovalLine;
import com.ep.spring.approval.model.vo.ApprovalReply;
import com.ep.spring.approval.model.vo.OverTimeForm;
import com.ep.spring.approval.model.vo.VacationForm;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Employee;

public interface ApprovalService {
	
	// 1. 메인페이지 결재대기문서 조회용 서비스(4개)
	ArrayList<Approval> selectMainWList(int eNo);
	
	// 메인페이지 기안진행문서 조회용 서비스(5개)
	ArrayList<Approval> selectMainSList(int eNo);
	
	// 10. 기안문서 등록을 위한 서비스
	// 작성자정보와 작성일 조회용 서비스
	Employee selectEnrollInfo(int eNo);
	
	// 2. 결재대기문서 조회용 서비스(페이징)
	int selectWaitingAListCount(int eNo);
	ArrayList<Approval> selectWatingAList(PageInfo pi, int eNo);
	
	// 3. 참조대기문서 조회용 서비스(페이징)
	int selectWaitingRListCount(int eNo);
	ArrayList<Approval> selectWaitingRList(PageInfo pi, int eNo);
	
	// 4. 기안문서함 조회용 서비스(페이징)
	int selectSendListCount(int eNo);
	ArrayList<Approval> selectSendList(PageInfo pi, int eNo);
	
	// 5. 임시저장함 조회용 서비스(페이징)
	int selectTempListCount(int eNo);
	ArrayList<Approval> selectTempList(PageInfo pi, int eNo);
	
	// 6. 결재문서함 조회용 서비스(페이징)
	int selectRecListCount(int eNo);
	ArrayList<Approval> selectRecList(PageInfo pi, int eNo);
	
	// 7. 참조문서함 조회용 서비스(페이징)
	int selectRefListCount(int eNo);
	ArrayList<Approval> selectRefList(PageInfo pi, int eNo);
	
	// 8. 부서용 기안완료함 조회용 서비스(페이징)
	int selectDeptSendListCount(int eNo);
	ArrayList<Approval> selectDeptSendList(PageInfo pi, int eNo);
	
	// 9. 부서용 부서참조함 조회용 서비스(페이징)
	int selectDeptRefListCount(int eNo);
	ArrayList<Approval> selectDeptRefList(PageInfo pi, int eNo);
	
	// 10. 기안진행/ 기안문서 상세페이지 조회용 서비스
	Approval selectDetailSPrgAp(Approval a);
	ArrayList<ApprovalLine> selectDetailSPrgAl(Approval a);
	ArrayList<ApprovalLine> selectDetailSPrgRl(Approval a);
	ArrayList<Attachment> selectDetailSPrgAt(Approval a);
	OverTimeForm selectDetailSPrgOt(Approval a);
	VacationForm selectDetailSPrgVf(Approval a);
	
	// 11. 댓글 조회랑 입력 삭제용 서비스
	ArrayList<ApprovalReply> selectReplyList(int appNo);
	int insertReply(ApprovalReply r);
	int deleteReply(int replyNo);
	
	// 12. 문서 삭제용 서비스
	int deleteApproval(int appNo);
	
	// 13. 결재대기/ 결재전체 문서 상세페이지 조회용 서비스
	Approval selectDetailRec(Approval a);
	
	// 14. 참조자 조회수 증가 서비스
	int updateCount(Approval a);

	// 15. 결재문서 상신을 위한 서비스
	int insertApproval(Approval ap, ArrayList<ApprovalLine> al, VacationForm vf, OverTimeForm ot, ArrayList<Attachment> atList);

	// 16. 결재 / 또는 반려하기
	int updateAppLine(ApprovalLine al);
	
	// 17. 수정하기 위해 문서 불러오기
	Approval selectTempApproval(int no);
	
	// 18. 문서수정용 서비스
	int updateApproval(Approval ap, ArrayList<ApprovalLine> al, VacationForm vf, OverTimeForm ot, ArrayList<Attachment> atList);
	int deleteAttachment(int appNo);
	// 19. 문서목록 검색용 서비스
	int selectSearchListCount(Approval a);
	ArrayList<Approval> selectSearchList(Approval a, PageInfo pi); 
	
	// 20. 문서 상태별 조회용 서비스
	int selectStatusListCount(Approval a);
	ArrayList<Approval> selectStatusList( PageInfo pi, Approval a);
	
}
