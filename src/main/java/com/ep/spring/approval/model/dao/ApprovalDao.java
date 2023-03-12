package com.ep.spring.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.approval.model.vo.Approval;
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
		RowBounds rowBounds = new RowBounds();
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
	
}
