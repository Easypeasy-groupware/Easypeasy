package com.ep.spring.login.model.vo;

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
public class Employee {
	

	private int empNo;
	private String empName;
	private String empId;
	private String empPwd;
	private String email;
	private String address;
	private String phone;
	private String empProfile;
	private String deptCode;
	private String jobCode;
	private String hireDate;
	private String entYn;
	private String entDate;
	private String status;

}
