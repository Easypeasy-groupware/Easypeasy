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

	private int ReplyNo;
	private int BoardNo;
	private String ReplyContent;
	private int ReplyWriter;
	private String CreateDate;
	private String ModifyDate;
	private String Status;
	
}
