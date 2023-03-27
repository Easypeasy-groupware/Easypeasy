package com.ep.spring.schedule.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Schedule {

	private int scNo;
	private String scWriter;
	private int calNo;
	private String scTitle;
	private String scPlace;
	private String scContent;
	private String scCompany;
	private String startDate;
	private String endDate;
	private String startTime;
	private String endTime;
	private String allDay;
	private String status;
	
	private String empName;
	private List<Attendee> attendeeList;
	
}
