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
	
	private int vacRecode;
	private int empNo;
	private int vacDays;
	private String enrollDate;
	private String vacReason;
	private String vacDivide;
	private String vacCategory;
	private int vacRemaining;
	


}
