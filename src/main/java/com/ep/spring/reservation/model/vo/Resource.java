package com.ep.spring.reservation.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Resource {

	private int resourceNo;
	private String resourceName;
	private String categoryName;
	private String resourceWriter;
	private String createDate;
}
