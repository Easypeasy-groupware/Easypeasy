package com.ep.spring.login.model.vo;

import java.util.ArrayList;

import com.ep.spring.address.model.vo.AddFavorite;

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
	private String deptName;
	private String jobCode;
	private String jobName;
	private String hireDate;
	private String entYn;
	private String entDate;
	private String status;
	private String addEmpNo;
	private int vacRemaining;

}
