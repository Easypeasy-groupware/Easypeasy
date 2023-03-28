package com.ep.spring.approval.model.vo;

import java.util.ArrayList;

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
	private String enrollDate;//
	private String status;
	private String tstatus;
	private String writerComment;//
	private String title;
	private String content;//
	private int writerNo;// --> 컨트롤러에서 정함
	private String formName;//
	private int conPeriod; // --> 컨트롤러에서 정함
	private String secGrade;// --> 컨트롤러에서 정함
	private int formCode;//
	private int appAmount;
	private int appSequence;
	private String empName;
	private String appChange;//
	private String deptName;
	private String originName;
	private int count;
	private String updateDate;
	private String jobCode;
	private int receiverNo;
	private String st;
	private int attachCount;
	private int division; // 재기안할것인지, 수정할것인지 구분하는
	private String keyword;
	private String condition;
	private String listType; // 검색결과를 돌려줄 리스트목록들에 대한 구분
	
	private ArrayList<ApprovalLine> alList;
	private ArrayList<ApprovalLine> refList;
	
}
