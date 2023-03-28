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

	private int boardNo;
	private int boardCno;
	private String boardTitle;
	private String boardContent;
	private int boardWriter;
	private int boardCount;
	private String createDate;
	private String modifyDate;
	private String deleteStatus;
	private String boardPin;
	private String originName;
	private String changeName;
	
	private String empName;
}
