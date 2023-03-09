package com.ep.spring.alarm.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Alarm {
	
	private int alarmNo;
	private int receiverNo;
	private int senderNo;
	private String alarmSubject;
	private String alarmContent;
	private String alarmDate;
	private String alarmCheck;
	private String alarmLink;
	private int alarmRefNo;

}
