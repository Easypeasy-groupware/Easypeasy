package com.ep.spring.reservation.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Reservation {

	private int reNo;
	private int resourceNo;
	private String reWriter;
	private String rePurpose;
	private String startDate;
	private String endDate;
	private String startTime;
	private String endTime;
	private String allDay;
	private String status;
	
	private String resourceName;
	private String categoryName;
}
