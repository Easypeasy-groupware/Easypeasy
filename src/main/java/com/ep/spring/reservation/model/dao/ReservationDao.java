package com.ep.spring.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.reservation.model.vo.Reservation;
import com.ep.spring.reservation.model.vo.Resource;

@Repository
public class ReservationDao {

	public ArrayList<Resource> selectSettingMettingRoom(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectSettingMettingRoom");
	}
	
	public int addMettingRoomResource(SqlSessionTemplate sqlSession, Resource rsc) {
		return sqlSession.insert("reservationMapper.addMettingRoomResource", rsc);
	}
	
	public int mettingRoomUpdate(SqlSessionTemplate sqlSession, Resource rsc) {
		return sqlSession.update("reservationMapper.mettingRoomUpdate", rsc);
	}
	
	public int mettingRoomDelete(SqlSessionTemplate sqlSession, int resourceNo) {
		return sqlSession.delete("reservationMapper.mettingRoomDelete", resourceNo);
	}
	
	// 빔프
	public ArrayList<Resource> selectSettingBeamProjector(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectSettingBeamProjector");
	}
	
	public int addBeamProjectorResource(SqlSessionTemplate sqlSession, Resource rsc) {
		return sqlSession.insert("reservationMapper.addBeamProjectorResource", rsc);
	}
	
	public int beamProjectorUpdate(SqlSessionTemplate sqlSession, Resource rsc) {
		return sqlSession.update("reservationMapper.beamProjectorUpdate", rsc);
	}
	
	public int beamProjectorDelete(SqlSessionTemplate sqlSession, int resourceNo) {
		return sqlSession.delete("reservationMapper.beamProjectorDelete", resourceNo);
	}
	
	
	
	public int insertReservation(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.insert("reservationMapper.insertReservation", r);
	}
	
	public ArrayList<Reservation> selectMettingRoomTimeGrid(SqlSessionTemplate sqlSession, int resourceNo) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectMettingRoomTimeGrid", resourceNo);
	}
	
	public Resource selectMettingRoomName(SqlSessionTemplate sqlSession, int resourceNo) {
		return sqlSession.selectOne("reservationMapper.selectMettingRoomName", resourceNo);
	}
	
	public ArrayList<Reservation> selectbeamProjectorTimeGrid(SqlSessionTemplate sqlSession, int resourceNo) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectMettingRoomTimeGrid", resourceNo); // 재사용
	}
	
	public ArrayList<Reservation> selectMettingRoom(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectMettingRoom");
	}
	
	public ArrayList<Reservation> selectBeamProjector(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectBeamProjector");
	}
	
	public ArrayList<Reservation> selectReservation(SqlSessionTemplate sqlSession, int reWriter) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReservation", reWriter);
	}
	
	public int reservationDelete(SqlSessionTemplate sqlSession, int reNo) {
		return sqlSession.update("reservationMapper.reservationDelete", reNo);
	}
}
