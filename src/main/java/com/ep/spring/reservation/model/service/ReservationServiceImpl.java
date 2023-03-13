package com.ep.spring.reservation.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.reservation.model.dao.ReservationDao;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReservationDao reDao;
}
