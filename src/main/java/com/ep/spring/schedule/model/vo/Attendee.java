package com.ep.spring.schedule.model.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Attendee {

	private int scNo;
	private String empNo;
	
	private String empName;
	private String jobName;
}
