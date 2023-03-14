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

@Repository
public class ApprovalDao {

	public ArrayList<Approval> selectMainWList(SqlSessionTemplate sqlSession, int eNo){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectMainWList", eNo);
	}
	
	public ArrayList<Approval> selectMainSList(SqlSessionTemplate sqlSession, int eNo){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectMainSList", eNo);
	}
	
	public Approval selectEnrollInfo(SqlSessionTemplate sqlSession, int eNo) {
		return sqlSession.selectOne("approvalMapper.selectEnrollInfo", eNo);
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
	
	

	
}
