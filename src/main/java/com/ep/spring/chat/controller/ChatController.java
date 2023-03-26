package com.ep.spring.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.chat.model.service.ChatService;
import com.ep.spring.login.model.vo.Employee;

@Controller
public class ChatController {
	
	
	 @Autowired private ChatService cService;
	 
	
	@RequestMapping("chatList.ch")
	public String viewChatList(Model model) {
		
		return "chat/chatRoomList";
	}
	
	@RequestMapping("chatRoom.ch")
	public String viewChatRoomDetail() {
		
		return "chat/chatRoomDetail";
	}
	
	@RequestMapping("empList.ch")
	public String viewChatEmpList(Model m) {
		
		ArrayList<Employee> list = cService.viewChatEmpList();
		
		m.addAttribute("list", list);
		return "chat/chatEmpList";
	}
	

}
