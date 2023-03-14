package com.ep.spring.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.reservation.model.dao.ReservationDao;
import com.ep.spring.reservation.model.vo.Resource;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReservationDao reDao;

	
	@Override
	public ArrayList<Resource> selectSettingMettingRoom() {
		return reDao.selectSettingMettingRoom(sqlSession);
	}

	@Override
	public int addMettingRoomResource(Resource rsc) {
		return reDao.addMettingRoomResource(sqlSession, rsc);
	}
}
