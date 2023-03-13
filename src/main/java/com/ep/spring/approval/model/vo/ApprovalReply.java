package com.ep.spring.approval.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ApprovalReply {
	
	private int replyNo;
	private String enrollDate;
	private String content;
	private String status;
	private int appNo;
	private int writerNo;

}
