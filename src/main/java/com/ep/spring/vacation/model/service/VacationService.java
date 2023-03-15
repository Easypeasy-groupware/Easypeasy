package com.ep.spring.vacation.model.service;

import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.vacation.model.vo.Vacation;

public interface VacationService {

	//(일반사용자)휴가 메인페이지
	Vacation selectVacMain(Employee e);
}
