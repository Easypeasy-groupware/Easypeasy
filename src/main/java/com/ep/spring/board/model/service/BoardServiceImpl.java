package com.ep.spring.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.board.model.dao.BoardDao;
import com.ep.spring.board.model.vo.Board;
import com.ep.spring.board.model.vo.BoardCate;
import com.ep.spring.board.model.vo.BoardReply;
import com.ep.spring.common.model.vo.Attachment;
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
	public int insertBoard(Board b, ArrayList<Attachment> atList) {
		int result = bDao.insertBoard(sqlSession, b);
		int attachResult = bDao.insertAttachment(sqlSession, atList);
		
		if(result> 0  && (atList.size() + attachResult > 0)) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@Override
	public int increaseCount(int no) {
		return bDao.increaseCount(sqlSession, no);
	}

	@Override
	public Board selectBoard(Board b) {
		return bDao.selectBoard(sqlSession, b);
	}
	
	@Override
	public ArrayList<Attachment> selectAttachmentList(Board b) {
		return bDao.selectAttachmentList(sqlSession, b);
	}

	@Override
	public int deleteBoard(int no) {
		return bDao.deleteBoard(sqlSession, no);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(sqlSession, b);
	}

	@Override
	public ArrayList<BoardReply> selectReplyList(int boardNo) {
		return bDao.selectReplyList(sqlSession, boardNo);
	}

	@Override
	public int insertReply(BoardReply r) {
		return bDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Board> selectTopList() {
		return null;
	}

	@Override
	public int selectSettings(BoardCate bc) {
		return bDao.selectSettings(sqlSession, bc);
	}
	
	@Override
	public int insertCate(BoardCate bc) {
		return bDao.insertCate(sqlSession, bc);
	}

	@Override
	public int updateSettings(BoardCate bc) {
		return 0;
	}

	

	

	

	

	

}
