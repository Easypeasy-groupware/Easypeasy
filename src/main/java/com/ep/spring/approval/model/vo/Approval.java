package com.ep.spring.approval.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Approval {
	
	private int appNo;
	private String enrollDate;
	private String status;
	private String tStatus;
	private String writerComment;
	private String title;
	private String content;
	private int writerNo;
	private String formName;
	private int conPeriod;
	private String secGrade;
	private int formCode;
	private int appAmount;
	private int appSequence;

}