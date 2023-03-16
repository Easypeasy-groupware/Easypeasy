package com.ep.spring.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.reservation.model.dao.ReservationDao;
import com.ep.spring.reservation.model.vo.Reservation;
import com.ep.spring.reservation.model.vo.Resource;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReservationDao reDao;

	// 회의실
	@Override
	public ArrayList<Resource> selectSettingMettingRoom() {
		return reDao.selectSettingMettingRoom(sqlSession);
	}

	@Override
	public int addMettingRoomResource(Resource rsc) {
		return reDao.addMettingRoomResource(sqlSession, rsc);
	}

	@Override
	public int mettingRoomUpdate(Resource rsc) {
		return reDao.mettingRoomUpdate(sqlSession ,rsc);
	}

	@Override
	public int mettingRoomDelete(int resourceNo) {
		return reDao.mettingRoomDelete(sqlSession, resourceNo);
	}
	
	// 빔프
	@Override
	public ArrayList<Resource> selectSettingBeamProjector() {
		return reDao.selectSettingBeamProjector(sqlSession);
	}

	@Override
	public int addBeamProjectorResource(Resource rsc) {
		return reDao.addBeamProjectorResource(sqlSession, rsc);
	}

	@Override
	public int BeamProjectorUpdate(Resource rsc) {
		return reDao.beamProjectorUpdate(sqlSession ,rsc);
	}

	@Override
	public int BeamProjectorDelete(int resourceNo) {
		return reDao.beamProjectorDelete(sqlSession, resourceNo);
	}

	@Override
	public int insertReservation(Reservation r) {
		return reDao.insertReservation(sqlSession, r);
	}
	
	
}
