package com.ep.spring.commute.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.commute.model.vo.Commute;

@Repository
public class CommuteDao {
	
	public int inTime(SqlSessionTemplate sqlSession, String inTime) {
		return sqlSession.insert("commuteMapper.inTime", inTime);
	}
	
	public Commute commuteMainPage(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("commuteMapper.commuteMainPage", empNo);
	}

}
