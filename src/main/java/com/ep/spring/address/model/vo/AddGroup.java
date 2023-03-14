package com.ep.spring.address.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class AddGroup {

	private String groupNo;
	private int empNo;
	private String groupName;
	private String addType;
	
}
