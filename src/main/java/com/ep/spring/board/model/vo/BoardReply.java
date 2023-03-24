package com.ep.spring.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class BoardReply {

	private int replyNo;
	private int boardNo;
	private String replyContent;
	private int replyWriter;
	private String createDate;
	private String modifyDate;
	private String status;
	
}
