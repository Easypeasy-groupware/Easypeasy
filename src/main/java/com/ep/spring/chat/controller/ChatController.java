package com.ep.spring.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ep.spring.chat.model.service.ChatService;
import com.ep.spring.chat.model.vo.ChatMember;
import com.ep.spring.chat.model.vo.ChatRecord;
import com.ep.spring.chat.model.vo.ChatRoom;
import com.ep.spring.login.model.vo.Employee;
import com.google.gson.Gson;

@Controller
public class ChatController {
	
	
	 @Autowired private ChatService cService;
	 
	
	 @RequestMapping("empList.ch")
		public String viewChatEmpList(Model m) { // 사원목록리스트페이지로 이동
			
			ArrayList<Employee> list = cService.viewChatEmpList();
			
			m.addAttribute("list", list);
			return "chat/chatEmpList";
	 }
	 
	@RequestMapping("chatList.ch")
	public String viewChatList(Model model) { // 채팅창목록리스트페이지로이동
		
		return "chat/chatRoomList";
	}
	
	
	
	@RequestMapping("chatRoom.ch") // 채팅방 입장하기
	public String viewChatRoomDetail(@RequestParam(value="no", defaultValue="0")int no, HttpSession session, Model model) {
		
		int empNo  =  ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		Employee e = cService.selectEmpInfo(no);
		ChatMember cm = new ChatMember();
		cm.setEmpNo(String.valueOf(e.getEmpNo()));
		cm.setEmpName(e.getEmpName());
		
		ArrayList<ChatRoom> rList = cService.selectChatRoom1(empNo); // 로그인한 사용자가 들어있는 채팅방 목록
		
		// m1 => 로그인한 사용자가 들어있는 채팅룸리스트와 사용자가 선택한 유저번호 담음
		ChatMember m1 = new ChatMember(); 
		m1.setEmpNo(String.valueOf(no));
		m1.setRList(rList);
		
		// m2 => 로그인한 사용자 번호와 사용자가 선택한 유저번호 담음
		String[] m2 = new String[2];
		m2[0] = String.valueOf(empNo);
		m2[1] = String.valueOf(no);
		
		int result = 0;
		ChatRoom room = new ChatRoom();
		if(rList.size() > 0) { // 로그인한 사용자가 들어있는 채팅방이 있을때
			
			room = cService.selectChatRoom2(m1); // 선택한 사원번호가 들어있는 채팅방을 찾는다
			
			if(room.getRoomNo() != null ) { // 방이 있을때
				// 채팅 기록을 찾아온다
				ArrayList<ChatRecord> msgList = cService.selectMessageList(room.getRoomNo());
				
				// 안읽은 메세지의 숫자 0으로 바뀌기
				ChatRecord message = new ChatRecord();
				message.setEmpNo(String.valueOf(no));
				message.setRoomNo(room.getRoomNo());
				cService.updateCount(message);
				
				model.addAttribute("msg", msgList);
				model.addAttribute("room", room);
				
				
			}else { // 방이 없을때 
				// => 새로만든다
				result = cService.insertNewRoom(m2);
				room = cService.selectChatNewRoom();
				
				// => 멤버수 추가한다
				int[] n2 = new int[2];
				n2[0] = m2.length;
				n2[1] = Integer.parseInt(room.getRoomNo());
				result = cService.insertNewRoomCount(n2);
				
				// => 마지막으로 방 정보 다시 불러온다
				room = cService.selectChatNewRoom();
				
				room.setOneMember(cm);
				model.addAttribute("room", room);
			}
			
		}else { // 로그인한 사용자가 들어있는 채팅방이 없을때 
			// => 방을 새로 만든다
			result = cService.insertNewRoom(m2);
			room = cService.selectChatNewRoom();
			
			// => 멤버수 추가한다
			int[] n2 = new int[2];
			n2[0] = m2.length;
			n2[1] = Integer.parseInt(room.getRoomNo());
			result = cService.insertNewRoomCount(n2);
			
			// => 마지막으로 방 정보 다시 불러온다
			room = cService.selectChatNewRoom();
			
			room.setOneMember(cm);
			model.addAttribute("room", room);
		}
		System.out.println("room : " + room);
		return "chat/chatRoomDetail";
	}

	@ResponseBody
	@RequestMapping(value="searchEmp.ch", produces="application/json; charset=utf-8")
	public String ajaxSelectEmployeeList(Employee e) {
		
		ArrayList<Employee> list = cService.selectChatEmpList(e);
		
		return new Gson().toJson(list);
	}
	
	
	
	
	

}
