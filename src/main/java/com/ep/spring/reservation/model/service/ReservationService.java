package com.ep.spring.reservation.model.service;

import java.util.ArrayList;

import com.ep.spring.reservation.model.vo.Reservation;
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
	
	// 2-1. 빔프로젝터 자산 추가
	int addBeamProjectorResource(Resource rsc);
	
	// 3-1. 빔프로젝터 자산 수정
	int BeamProjectorUpdate(Resource rsc);
	
	// 4-1. 빔프로젝터 자산 삭제
	int BeamProjectorDelete(int resourceNo);
	
	// 5. 예약
	int insertReservation(Reservation r);
	
	// 5. 예약 조회
	ArrayList<Reservation> selectMettingRoomTimeGrid(int resourceNo);
	Resource selectMettingRoomName(int resourceNo);
	
	ArrayList<Reservation> selectbeamProjectorTimeGrid(int resourceNo);
	
	// 5-1. 메인 예약 조회
	ArrayList<Reservation> selectMettingRoom();
	ArrayList<Reservation> selectBeamProjector();
	
	// 6. 내 예약 현황 조회
	ArrayList<Reservation> selectReservation(int reWriter);
	
	// 7. 예약 취소
	int reservationDelete(int reNo);
	
	// 8. 예약 상세 조회 위한
	Reservation selectDetailReservation(int reNo);
	
	// 9. 예약 수정
	int reservationUpdate(Reservation r);
}
