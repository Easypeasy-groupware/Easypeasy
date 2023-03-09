package com.ep.spring.dataBoard.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class DataBoard {

	private int dbNo;
	private String dbTitle;
	private String dbContent;
	private String dbWriter;
	private int count;
	private String createDate;
	private String originName;
	private String changeName;
	private String dbStatus;
}
