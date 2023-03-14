package com.ep.spring.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.reservation.model.vo.Resource;

@Repository
public class ReservationDao {

	public ArrayList<Resource> selectSettingMettingRoom(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("ReservationMapper.selectSettingMettingRoom");
	}
	
	public int addMettingRoomResource(SqlSessionTemplate sqlSession, Resource rsc) {
		return sqlSession.insert("ReservationMapper.addMettingRoomResource", rsc);
	}
}
