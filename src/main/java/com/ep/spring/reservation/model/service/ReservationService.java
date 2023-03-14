package com.ep.spring.reservation.model.service;

import java.util.ArrayList;

import com.ep.spring.reservation.model.vo.Resource;

public interface ReservationService {

	// 1. 회의실 자산 조회
	//ArrayList<Resource> selectSettingMettingRoom();
	
	// 2. 회의실 자산 추가
	int addMettingRoomResource(Resource rsc);
}
