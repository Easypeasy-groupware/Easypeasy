package com.ep.spring.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.chat.model.dao.ChatDao;
import com.ep.spring.chat.model.vo.ChatMember;
import com.ep.spring.chat.model.vo.ChatRecord;
import com.ep.spring.chat.model.vo.ChatRoom;
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

	@Override
	public ArrayList<ChatRoom> selectChatRoom1(int empNo) { // 로그인한 사용자가 들어있는 채팅방 목록
		return cDao.selectChatRoom1(sqlSession, empNo); 

	}

	@Override
	public ChatRoom selectChatRoom2(ChatMember m1) {
		return cDao.selectChatRoom2(sqlSession, m1); 

	}

	@Override
	public int insertNewRoom(String[] m2) {
		int result1 = cDao.insertNewRoom(sqlSession); // chat_room에 새로운 방번호 추가
		int result2 = cDao.insertNewMember(sqlSession, m2); // chat_member에 멤버 추가
		
		return result1*result2;
	}

	@Override
	public ChatRoom selectChatNewRoom() {
		return cDao.selectChatNewRoom(sqlSession);
	}

	@Override
	public Employee selectEmpInfo(int no) {
		return cDao.selectEmpInfo(sqlSession, no);
	}

	@Override
	public ArrayList<ChatRecord> selectMessageList(String roomNo) {
		return cDao.selectMessageList(sqlSession, roomNo);
	}

	@Override
	public void updateCount(ChatRecord message) {
		cDao.updateCount(sqlSession, message);
	}

	@Override
	public ChatRoom selectChatRoom(String roomNo) {
		return cDao.selectChatRoom(sqlSession, roomNo);
	}

	@Override
	public int insertMessage(ChatRecord chatMessage) {
		return cDao.insertMessage(sqlSession, chatMessage);
	}

	@Override
	public int updateTitle(ChatRecord chatMessage) {
		int result1 = cDao.updateTitle(sqlSession, chatMessage);
		int result2 = cDao.insertMessage(sqlSession, chatMessage);
		return result1 + result2;
	}

	@Override
	public int insertNewRoomCount(int[] n2) {
		return cDao.insertNewRoomCount(sqlSession, n2);
	}

	@Override
	public ArrayList<Employee> selectChatEmpList(Employee e) {
		return cDao.selectChatEmpList(sqlSession, e);
	}










}
