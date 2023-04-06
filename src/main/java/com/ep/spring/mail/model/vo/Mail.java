package com.ep.spring.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Mail {
	
	private int recMailNo;
	private int mailNo;
	private int refNo;
	private int tagNo;
	private String tagName;
	private String tagColor;
	private String empName;
	private String recMailAdd;
	private String sendMailAdd;
	private String mailTitle;
	private String mailContent;
	private String recCheck;
	private String recDate;
	private String dateDay;
	private String dateTime;
	private String imporMail;
	private String junkMail;
	private String reserMail;
	private String status;
	private String reference;
	private String hiddenReference;
	private String sentDate;
	private String tempStorage;
	private String sort;

}
