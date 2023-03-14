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
	private String tstatus;
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
	private String empName;
	private String appChange;
	private String deptName;
	private String originName;
	private int count;
	private String updateDate;
	private String jobCode;

}
