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
public class ChatMember {
	
	private String memberId;
	private String empNo;
	private String roomNo;
	private String empName;

	private ArrayList<ChatRoom> rList;
}
