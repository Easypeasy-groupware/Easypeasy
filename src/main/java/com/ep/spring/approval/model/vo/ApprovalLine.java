package com.ep.spring.approval.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ApprovalLine {
	
	private int appLineNo;
	private String refWhether;
	private int appSeqNo;
	private String appStatus;
	private String updateDate;
	private int recEmpNo;
	private int appNo;
	private String appComment;
	private String enrollDate;
	private int count;
}
