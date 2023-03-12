package com.ep.spring.address.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Address {
	
	private int addNo;
	private String addWriter;
	private String addType;
	private String addName;
	private String email;
	private String phone;
	private String addEmp;
	private String addEdpt;
	private String addJob;
	private int groupNo;
	private String empPhone;
	private String empAddress;
	private String memo;
	private String createDate;
	private String modifyDate;
	private String deleteDate;
	private String addBin;
	
	private String addProfile;
	

}
