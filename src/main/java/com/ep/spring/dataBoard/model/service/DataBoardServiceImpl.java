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
		return 0;
	}

	@Override
	public int increaseCount(int dbNo) {
		return 0;
	}

	@Override
	public DataBoard selectDataBoard(int dbNo) {
		return null;
	}

	@Override
	public int deleteDataBoard(int dbNo) {
		return 0;
	}

	@Override
	public int updateDataBoard(DataBoard db) {
		return 0;
	}
}
