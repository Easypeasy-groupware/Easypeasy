package com.ep.spring.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
}
