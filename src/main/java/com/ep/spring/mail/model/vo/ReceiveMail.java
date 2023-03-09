package com.ep.spring.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ReceiveMail {
	
	private int recMailNo;
	private int mailNo;
	private int tagNo;
	private String recMailAdd;
	private String sendMailAdd;
	private String mailTitle;
	private String mailContent;
	private String recCheck;
	private String recDate;
	private String imporMail;
	private String junkMail;
	private String reserMail;
	private String status;
	private String reference;
	private String hiddenReference;

}
