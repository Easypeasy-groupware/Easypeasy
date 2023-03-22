package com.ep.spring.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.chat.model.service.ChatService;

public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	@RequestMapping("viewChatSample.ch")
	public ModelAndView viewChatSample(ModelAndView mv) {
		mv.setViewName("chat/chatSample");
		return mv;
	}

}
