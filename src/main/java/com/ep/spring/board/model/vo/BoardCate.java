package com.ep.spring.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class BoardCate {
	
	private int boardCno;
	private String boardCname;
	private int displayRange;
	private String privateStatus;
	private String anonymStatus;
	private String deptCode;
}
