package com.ep.spring.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class MailTag {

	private int tagNo;
	private int empNo;
	private String tagName;
	private String tagColor;
	private String sort;
	
}
