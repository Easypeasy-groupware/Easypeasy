package com.ep.spring.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.chat.model.vo.ChatMember;
import com.ep.spring.chat.model.vo.ChatRecord;
import com.ep.spring.chat.model.vo.ChatRoom;
import com.ep.spring.login.model.vo.Employee;

@Repository
public class ChatDao {

	public ArrayList<Employee> viewChatEmpList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chatMapper.viewChatEmpList");
	}

	public ArrayList<ChatRoom> selectChatRoom1(SqlSessionTemplate sqlSession, int empNo) { // 로그인한 사용자가 들어있는 채팅방 목록
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatRoom1", empNo);
	}

	public ChatRoom selectChatRoom2(SqlSessionTemplate sqlSession, ChatMember m1) {
		
		// 방번호
		String roomNo = null;
		
		ChatRoom cr = new ChatRoom();
		ChatRoom result = new ChatRoom();
		for(int i=0; i < m1.getRList().size(); i++) {
			roomNo = m1.getRList().get(i).getRoomNo();
			m1.setRoomNo(roomNo);
			result = sqlSession.selectOne("chatMapper.selectChatRoom2", m1);
			
			if(result != null) {
				cr = result;
			}
			
		}
		return cr;
	}

	public int insertNewRoom(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("chatMapper.insertNewRoom");
	}
	
	public int insertNewMember(SqlSessionTemplate sqlSession, String[] m2) {
		int count = 0;
		for(int i=0; i<m2.length; i++) {
			String empNo = m2[i];
			count += sqlSession.insert("chatMapper.insertNewMember", empNo);
		}
		return count;
	}
	
	public ChatRoom selectChatNewRoom(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chatMapper.selectChatNewRoom");
	}

	public Employee selectEmpInfo(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("chatMapper.selectEmpInfo", no);
	}

	public ArrayList<ChatRecord> selectMessageList(SqlSessionTemplate sqlSession, String roomNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectMessageList", roomNo);
	}

	public void updateCount(SqlSessionTemplate sqlSession, ChatRecord message) {
		sqlSession.update("chatMapper.updateCount", message);
	}

	public ChatRoom selectChatRoom(SqlSessionTemplate sqlSession, String roomNo) {
		return sqlSession.selectOne("chatMapper.selectChatRoom", roomNo);
	}

	public int insertMessage(SqlSessionTemplate sqlSession, ChatRecord chatMessage) {
		return sqlSession.insert("chatMapper.insertMessage", chatMessage);
	}

	public int updateTitle(SqlSessionTemplate sqlSession, ChatRecord chatMessage) {
		return sqlSession.update("chatMapper.updateTitle", chatMessage);
	}

	public int insertNewRoomCount(SqlSessionTemplate sqlSession, int[] n2) {
		int roomNo = n2[1];
		int result = 0;
		for(int i = 0; i<n2[0]; i++) {
			result += sqlSession.update("chatMapper.insertNewRoomCount", roomNo);
		}
		return result;
	}

	public ArrayList<Employee> selectChatEmpList(SqlSessionTemplate sqlSession, Employee e) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatEmpList", e);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	

}
