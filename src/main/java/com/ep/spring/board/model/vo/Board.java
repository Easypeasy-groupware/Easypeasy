package com.ep.spring.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Board {

	private int BoardNo;
	private int BoardCno;
	private String BoardTitle;
	private String BoardContent;
	private int BoardWriter;
	private int BoardCount;
	private String CreateDate;
	private String ModifyDate;
	private String DeleteStatus;
	private String BoardPin;
	private String OriginName;
	private String ChangeName;
	
	
}
