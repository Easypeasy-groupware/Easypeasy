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
public class VacationRecode {
	
	private double vacRecode;
	private int empNo;
	private double vacDays;
	private String enrollDate;
	private String vacReason;
	private String vacDivide;
	private String vacCategory;
	private double vacRemaining;
	


}
