package com.ep.spring.approval.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class OverTimeForm {

	private int appNo;
	private String otKind;
	private String otDate;
	private String otStart;
	private String otEnd;
	private int otUseTime;
}
