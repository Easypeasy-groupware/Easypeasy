package com.ep.spring.schedule.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Calendar {

	private int calNo;
	private String empNo;
	private String calTitle;
	private String calDefault;
	private String createDate;
	private String calColor;
	
}
