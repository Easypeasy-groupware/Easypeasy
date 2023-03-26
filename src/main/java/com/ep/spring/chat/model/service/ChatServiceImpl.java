package com.ep.spring.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.chat.model.dao.ChatDao;
import com.ep.spring.login.model.vo.Employee;

@Service
public class ChatServiceImpl implements ChatService{
	

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao cDao;

	@Override
	public ArrayList<Employee> viewChatEmpList() {
		return cDao.viewChatEmpList(sqlSession);
	}

}
