package com.ep.spring.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString

public class SendMail {

	private int mailNo;
	private String sendMailAddress;
	private String sentDate;
	private String mailTitle;
	private String mailContent;
	private String tempStorage;
	private String status;
	
}
