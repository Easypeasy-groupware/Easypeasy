package com.ep.spring.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.approval.model.vo.Approval;
import com.ep.spring.approval.model.vo.ApprovalLine;
import com.ep.spring.approval.model.vo.ApprovalReply;
import com.ep.spring.approval.model.vo.OverTimeForm;
import com.ep.spring.approval.model.vo.VacationForm;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Employee;

@Repository
public class ApprovalDao {

	public ArrayList<Approval> selectMainWList(SqlSessionTemplate sqlSession, int eNo){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectMainWList", eNo);
	}
	
	public ArrayList<Approval> selectMainSList(SqlSessionTemplate sqlSession, int eNo){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectMainSList", eNo);
	}
	
	public Employee selectEnrollInfo(SqlSessionTemplate sqlSession, int eNo) {
		return sqlSession.selectOne("employeeMapper.selectEnrollInfo", eNo);
		
	}
	
	public int selectWaitingAListCount(SqlSessionTemplate sqlSession, int eNo) {
		return sqlSession.selectOne("approvalMapper.selectWaitingAListCount", eNo);
	}
	
	public ArrayList<Approval> selectWatingAList(SqlSession sqlSession, PageInfo pi, int eNo){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectWatingAList", eNo, rowBounds);
	}
	
	public int selectWaitingRListCount(SqlSessionTemplate sqlSession, int eNo) {
		return sqlSession.selectOne("approvalMapper.selectWaitingRListCount", eNo);
	}
	
	public ArrayList<Approval> selectWaitingRList(SqlSessionTemplate sqlSession, PageInfo pi, int eNo){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectWaitingRList", eNo, rowBounds);
	}
	
	public int selectSendListCount(SqlSessionTemplate sqlSession, int eNo) {
		return sqlSession.selectOne("approvalMapper.selectSendListCount", eNo);
	}
	
	public ArrayList<Approval> selectSendList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSendList", empNo, rowBounds);
	}
	
	public int selectTempListCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("approvalMapper.selectTempListCount", empNo);
	}
	
	public ArrayList<Approval> selectTempList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectTempList", empNo, rowBounds);
	}
	
	public int selectRecListCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("approvalMapper.selectRecListCount", empNo);
	}
	
	public ArrayList<Approval> selectRecList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRecList", empNo, rowBounds);
	}
	
	public int selectRefListCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("approvalMapper.selectRefListCount", empNo);
	}
	
	public ArrayList<Approval> selectRefList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds();
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRefList", empNo, rowBounds);
	}
	
	public int selectDeptSendListCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("approvalMapper.selectDeptSendListCount", empNo);
	}
	
	public ArrayList<Approval> selectDeptSendList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo){
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDeptSendList", empNo, rowBounds);
	}
	
	public int selectDeptRefListCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("approvalMapper.selectDeptRefListCount", empNo);
		
	}
	
	public ArrayList<Approval> selectDeptRefList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo){
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDeptRefList", empNo, rowBounds);
		
	}
	
	public Approval selectDetailSPrgAp(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.selectOne("approvalMapper.selectDetailSPrgAp", a);
	}

	public ArrayList<ApprovalLine> selectDetailSPrgAl(SqlSessionTemplate sqlSession, Approval a) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDetailSPrgAl", a);
	}
	
	public ArrayList<ApprovalLine> selectDetailSPrgRl(SqlSessionTemplate sqlSession, Approval a){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDetailSPrgRl", a);
	}
	
	public VacationForm selectDetailSPrgVf(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.selectOne("approvalMapper.selectDetailSPrgVf", a);
	}
	
	public OverTimeForm selectDetailSPrgOt(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.selectOne("approvalMapper.selectDetailSPrgOt", a);
	}
	
	public ArrayList<Attachment> selectDetailSPrgAt(SqlSessionTemplate sqlSession, Approval a){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDetailSPrgAt", a);
	}
	
	public ArrayList<ApprovalReply> selectReplyList(SqlSessionTemplate sqlSession, int appNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectReplyList", appNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, ApprovalReply r) {
		return sqlSession.insert("approvalMapper.insertReply", r);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("approvalMapper.deleteReply", replyNo);
	}
	
	public int deleteApproval(SqlSessionTemplate sqlSession, int appNo) {
		return sqlSession.update("approvalMapper.deleteApproval", appNo);
	}
	
	public Approval selectDetailRec(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.selectOne("approvalMapper.selectDetailRec", a);
	}
	
	public int updateCount(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.update("approvalMapper.updateCount", a);
	}
	
	public int insertApproval(SqlSessionTemplate sqlSession, Approval ap) {
		return sqlSession.insert("approvalMapper.insertApproval", ap);
	}
	
	public int insertApprovalLine(SqlSessionTemplate sqlSession, ArrayList<ApprovalLine> al) {
		int result = 0;
		for(ApprovalLine a : al) {
			result += sqlSession.insert("approvalMapper.insertApprovalLine", a);
		}
		return result;
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, ArrayList<Attachment> atList) {
		
		int result = 0;
		for(Attachment a : atList) {
			result += sqlSession.insert("approvalMapper.insertAttachment", a);
		}
		return result;
	}
	
	public int insertVacationForm(SqlSessionTemplate sqlSession, VacationForm vf) {
		return sqlSession.insert("approvalMapper.insertVacationForm", vf);
	}
	
	public int insertOverTimeForm(SqlSessionTemplate sqlSession, OverTimeForm ot) {
		return sqlSession.insert("approvalMapper.insertOverTimeForm", ot);
	}

	public int updateAppStatus(SqlSessionTemplate sqlSession, ApprovalLine al) {
		return sqlSession.update("approvalMapper.updateAppStatus", al);
	}
	
	public int updateAppSequence(SqlSessionTemplate sqlSession, ApprovalLine al) {
		return sqlSession.update("approvalMapper.updateAppSequence", al);
	}
	
	public int updateAppLine(SqlSessionTemplate sqlSession, ApprovalLine al) {
		
		int result1 = 0;
		int result2 = 0;
		
		result1 = sqlSession.update("approvalMapper.updateAppLine", al);
		
		if(al.getAppStatus().equals("반려")) {
			result2 += sqlSession.update("approvalMapper.updateReject", al);
		}
		
		return result1 + result2;
	}
	
	public Approval selectTempApproval(SqlSessionTemplate sqlSession, int appNo) {
		return sqlSession.selectOne("approvalMapper.selectTempApproval", appNo);
	}
	
	public int updateApproval(SqlSessionTemplate sqlSession, Approval ap) {
		return sqlSession.update("approvalMapper.updateApproval", ap);
	}
	
	public int updateApprovalLine(SqlSessionTemplate sqlSession, ArrayList<ApprovalLine>al) {
		
		int result1 = 0;
		int result2 = 0;

		
		int num = al.get(0).getAppNo();
		
		result1 = sqlSession.delete("approvalMapper.deleteApprovalLine", num);
		
		for(ApprovalLine a : al) {
			result2 += sqlSession.insert("approvalMapper.updateApprovalLine", a);
			
		}
		
		return result1 + result2;
 	}
	
	public int deleteAttachment(SqlSessionTemplate sqlSession, int appNo) {
	
		return sqlSession.delete("approvalMapper.deleteAttachment", appNo);
	}
	
	public int updateAttachment(SqlSessionTemplate sqlSession, ArrayList<Attachment> atList) {
		
		int result = 0;
		
		for(Attachment a : atList) {
			result += sqlSession.insert("approvalMapper.insertAttachment", a);
		}
		return result;
	}
	
	public int updateVacationForm(SqlSessionTemplate sqlSession, VacationForm vf) {
		return sqlSession.update("approvalMapper.updateVacationForm", vf);
		
	}
	
	public int updateOverTimeForm(SqlSessionTemplate sqlSession, OverTimeForm ot) {
		return sqlSession.update("approvalMapper.updateOverTimeForm", ot);
	}
	
	public int selectSearchListCount(SqlSessionTemplate sqlSession, Approval a) {
		if(a.getListType().equals("cw")) {
			
			return 0;
			
		}else if(a.getListType().equals("fw")) {
			
			return 0;
			
		}else if(a.getListType().equals("s")) {
			
			return sqlSession.selectOne("approvalMapper.selectSearchSListCount", a);
			
		}else if(a.getListType().equals("t")) {
			
			return sqlSession.selectOne("approvalMapper.selectSearchTListCount", a);
			
		}else if(a.getListType().equals("c")) {
			
			return sqlSession.selectOne("approvalMapper.selectSearchCListCount", a);
			
		}else if(a.getListType().equals("f")) {
			
			return sqlSession.selectOne("approvalMapper.selectSearchFListCount", a);
			
		}else if(a.getListType().equals("ds")) {
			
			return 0;
			
		}else if(a.getListType().equals("df")) {
			
			return 0;
			
		}else {
			return 0;
		}
	}
	
	public ArrayList<Approval> selectSearchList(SqlSessionTemplate sqlSession, Approval a, PageInfo pi){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		if(a.getListType().equals("cw")) {
			
			return null;
			
		}else if(a.getListType().equals("fw")) {
			
			return null;
			
		}else if(a.getListType().equals("s")) {
			
			return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchSList", a, rowBounds);
			
		}else if(a.getListType().equals("t")) {
			
			return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchTList", a, rowBounds);
			
		}else if(a.getListType().equals("c")) {
			
			return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchCList", a, rowBounds);
			
		}else if(a.getListType().equals("f")) {
			
			return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchFList", a, rowBounds);
			
		}else if(a.getListType().equals("ds")) {
			
			return null;
			
		}else if(a.getListType().equals("df")) {
			
			return null;
			
		}else {
			return null;
		}
	}
	
	
	
	public int selectStatusListCount(SqlSessionTemplate sqlSession, Approval a) {
		
		if(a.getListType().equals("s")) {
			return sqlSession.selectOne("approvalMapper.selectStatusSListCount", a);
		}else {
			return sqlSession.selectOne("approvalMapper.selectStatusCListCount", a);
		}
	}
	
	public ArrayList<Approval> selectStatusList(SqlSessionTemplate sqlSession, PageInfo pi, Approval a){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		if(a.getListType().equals("s")) {
			return (ArrayList)sqlSession.selectList("approvalMapper.selectStatusSList", a, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("approvalMapper.selectStatusCList", a, rowBounds);
		}
		
	}
	
	public Approval selectVacationInfo(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("approvalMapper.selectVacationInfo", no);
	}
	
}
