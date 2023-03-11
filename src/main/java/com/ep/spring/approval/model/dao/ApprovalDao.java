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
	
}
