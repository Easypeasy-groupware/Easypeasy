package com.ep.spring.approval.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class VacationForm {
	
	private int appNo;
	private String vacKind;
	private String vacStart;
	private String vacEnd;
	private String halfStatus;
	private double vacUse;
	private String halfDay;
}
