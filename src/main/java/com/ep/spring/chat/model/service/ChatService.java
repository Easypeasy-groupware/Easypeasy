package com.ep.spring.chat.model.service;

import java.util.ArrayList;

import com.ep.spring.chat.model.vo.ChatMember;
import com.ep.spring.chat.model.vo.ChatRecord;
import com.ep.spring.chat.model.vo.ChatRoom;
import com.ep.spring.login.model.vo.Employee;

public interface ChatService {

	ArrayList<Employee> viewChatEmpList();

	// 채팅방이 있는지 확인(2-1, 2-2)
	// 2-1. 로그인한 사용자가 들어있는 채팅방 목록
	ArrayList<ChatRoom> selectChatRoom1(int empNo); 

	// 2-2. 선택한 사원번호가 들어있는 채팅방 정보
	ChatRoom selectChatRoom2(ChatMember m1);

	// 2-3. 방 새로 만들기
	int insertNewRoom(String[] m2);

	// 2-4. 새로만든 방 정보 가져오기
	ChatRoom selectChatNewRoom();
	Employee selectEmpInfo(int no);

	// 채팅기록불러오기
	ArrayList<ChatRecord> selectMessageList(String roomNo);
	// 채팅기록 불러올때 안읽은 메세지의 숫자 0으로 바뀌기
	void updateCount(ChatRecord message);

	// 메세지에 담긴 roomId로 방번호 찾기
	ChatRoom selectChatRoom(String roomNo);

	int insertMessage(ChatRecord chatMessage);

	// 방 이름 변경
	int updateTitle(ChatRecord chatMessage);

	// 새로만든 방의 멤버수 추가하기
	int insertNewRoomCount(int[] n2);

	
	
	
}
