package com.ep.spring.reservation.model.service;

import java.util.ArrayList;

import com.ep.spring.reservation.model.vo.Resource;

public interface ReservationService {

	// 1. 회의실 자산 조회
	ArrayList<Resource> selectSettingMettingRoom();
	
	// 2. 회의실 자산 추가
	int addMettingRoomResource(Resource rsc);
	
	// 3. 회의실 자산 수정
	int mettingRoomUpdate(Resource rsc);
	
	// 4. 회의실 자산 삭제
	int mettingRoomDelete(int resourceNo);
	
	// 1-1. 빔프로젝터 자산 조회
	ArrayList<Resource> selectSettingBeamProjector();
	
	// 1-2. 빔프로젝터 자산 추가
	int addBeamProjectorResource(Resource rsc);
	
	// 3. 빔프로젝터 자산 수정
	int BeamProjectorUpdate(Resource rsc);
	
	// 4. 빔프로젝터 자산 삭제
	int BeamProjectorDelete(int resourceNo);
}
