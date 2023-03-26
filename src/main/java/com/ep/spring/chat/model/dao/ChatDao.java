package com.ep.spring.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.login.model.vo.Employee;

@Repository
public class ChatDao {

	public ArrayList<Employee> viewChatEmpList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chatMapper.viewChatEmpList");
	}

}
