package com.ep.spring.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class MailFavorite {
	
	private int favNo;
	private int empNo;
	private int favOrder;
	private String favName;
	private String mailBoxName;

}
