package com.ep.spring.chat.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.chat.model.dao.ChatDao;

@Service
public class ChatServiceImpl implements ChatService{
	

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao cDao;

}
