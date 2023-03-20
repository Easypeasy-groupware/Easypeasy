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
	private String refWhether; // 화면에서 정함
	private int appSeqNo; // 배열번호로 정함
	private String appStatus; 
	private String updateDate; 
	private int recEmpNo; // 배열번호로정함
	private int appNo; // 컨트롤러에서 정함
	private String appComment; 
	private String enrollDate; 
	private int count; 
	private String empName;
	private String deptName;
	private String jobCode;
	private String empProfile;
}
