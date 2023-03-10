package com.ep.spring.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.approval.model.vo.Approval;

//@Repository
public class Test {
	
	public ArrayList<Approval> selectMainWList(SqlSessionTemplate sqlSession, int eNo){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectMainWList", eNo);
	}
	
	public ArrayList<Approval> selectMainSList(SqlSessionTemplate sqlSession, int eNo){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectMainSList", eNo);
	}
	
	public Approval selectEnrollInfo(SqlSessionTemplate sqlSession, int eNo) {
		return sqlSession.selectOne("approvalMapper.selectEnrollInfo", eNo);
	}

}
