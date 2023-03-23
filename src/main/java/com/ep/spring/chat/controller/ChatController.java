package com.ep.spring.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.chat.model.service.ChatService;

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
	public String viewChatEmpList() {
		
		return "chat/chatEmpList";
	}

}
