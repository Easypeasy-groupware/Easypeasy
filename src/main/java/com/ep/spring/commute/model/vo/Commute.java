package com.ep.spring.commute.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Commute {
	

	
	private int comCode;
	private int empNo;
	private String enrollDate;
	private String startTime;
	private String endTime;
	private String workTime;
	private String comStatus;
	

}
