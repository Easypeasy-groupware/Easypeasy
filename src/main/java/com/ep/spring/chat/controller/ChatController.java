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
	public String viewChatSample(Model model) {
		
		return "chat/chatRoomDetail";
	}

}
