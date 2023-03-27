package com.ep.spring.chat.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ChatRoom {
	
	private String roomNo;
	private String roomName;
	private String createDate;
	
	private int unReadCount;
	
	private int count;
	
	private ChatMember oneMember;
	private ArrayList<ChatMember> memList;

}
