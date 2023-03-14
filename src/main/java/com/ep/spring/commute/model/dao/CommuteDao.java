package com.ep.spring.commute.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CommuteDao {
	
	public int inTime(SqlSessionTemplate sqlSession, String inTime) {
		return sqlSession.insert("commuteMapper.inTime", inTime);
	}

}
