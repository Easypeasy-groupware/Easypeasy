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
	
	private int BoardCno;
	private String BoardCname;
	private int DisplayRange;
	private String PrivateStatus;
	private String AnonymStatus;
	private String DeptCode;
}
