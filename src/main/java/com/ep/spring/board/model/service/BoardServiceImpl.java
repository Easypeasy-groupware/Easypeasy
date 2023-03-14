package com.ep.spring.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.board.model.dao.BoardDao;
import com.ep.spring.board.model.vo.Board;
import com.ep.spring.board.model.vo.BoardReply;
import com.ep.spring.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao bDao;
	
	@Override
	public int selectListCount() {
		return bDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertBoard(Board b) {
		return 0;
	}

	@Override
	public int increaseCount(int boardNo) {
		return 0;
	}

	@Override
	public Board selectBoard(int boardNo) {
		return null;
	}

	@Override
	public int deleteBoard(int boardNo) {
		return 0;
	}

	@Override
	public int updateBoard(Board b) {
		return 0;
	}

	@Override
	public ArrayList<BoardReply> selectReplyList(int boardNo) {
		return null;
	}

	@Override
	public int insertReply(BoardReply r) {
		return 0;
	}

	@Override
	public ArrayList<Board> selectTopList() {
		return null;
	}

}
