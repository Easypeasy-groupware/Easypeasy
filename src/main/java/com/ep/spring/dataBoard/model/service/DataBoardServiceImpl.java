package com.ep.spring.dataBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.dataBoard.model.dao.DataBoardDao;
import com.ep.spring.dataBoard.model.vo.DataBoard;

@Service
public class DataBoardServiceImpl implements DataBoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private DataBoardDao dbDao;

	@Override
	public int selectDbListCount() {
		return dbDao.selectDbListCount(sqlSession);
	}

	@Override
	public ArrayList<DataBoard> selectDbList(PageInfo pi) {
		return dbDao.selectDbList(sqlSession, pi);
	}

	@Override
	public int insertDataBoard(DataBoard db) {
		return dbDao.insertDataBoard(sqlSession, db);
	}

	@Override
	public int increaseCount(int dbNo) {
		return dbDao.increaseCount(sqlSession, dbNo);
	}

	@Override
	public DataBoard selectDataBoard(int dbNo) {
		return dbDao.selectDataBoard(sqlSession, dbNo);
	}
	
	

	@Override
	public int deleteDataBoard(int dbNo) {
		return dbDao.deleteDataBoard(sqlSession, dbNo);
	}

	@Override
	public int updateDataBoard(DataBoard db) {
		return dbDao.updateDataBoard(sqlSession, db);
	}

	/*
	@Override
	public DataBoard selectNextDataBoard(int dbNo) {
		return dbDao.selectNextDataBoard(sqlSession, dbNo);
	}
	*/

}
