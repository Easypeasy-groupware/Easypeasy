package com.ep.spring.common.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ep.spring.commute.model.service.CommuteService;

@Component
public class Scheduler {
	
	@Autowired
	private CommuteService cService;

	@Scheduled(cron="0 0 0 * * MON-FRI")//월~금(평일) 00시 정각마다
	public void insertCommuteDay() {
		// 평일 00시 정각마다 Commute에 insert
		int result = cService.insertCommuteDay();
		
	}
	
}
