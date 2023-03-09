package com.ep.spring.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Attachment {
	
	private int attachNo;
	private String refNo;
	private String originName;
	private String changeName;
	private String filePath;
	private String uploadDate;
	private String division;

}
