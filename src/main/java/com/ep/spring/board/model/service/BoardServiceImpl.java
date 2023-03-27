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
	public int selectFreeListCount() {
		return bDao.selectFreeListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectFreeList(PageInfo pi) {
		return bDao.selectFreeList(sqlSession, pi);
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
	public int insertABoard(Board b, ArrayList<Attachment> atList) {
		int result = bDao.insertABoard(sqlSession, b);
		int attachResult = bDao.insertAAttachment(sqlSession, atList);
		
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
	public int increaseACount(int no) {
		return bDao.increaseACount(sqlSession, no);
	}

	@Override
	public Board selectABoard(Board b) {
		return bDao.selectABoard(sqlSession, b);
	}

	@Override
	public ArrayList<Attachment> selectAnAttachmentList(Board b) {
		return bDao.selectAnAttachmentList(sqlSession, b);
	}
	
	@Override
	public int deleteBoard(int boardNo) {
		return bDao.deleteBoard(sqlSession, boardNo);
	}
	
	@Override
	public int deleteABoard(int boardNo) {
		return bDao.deleteABoard(sqlSession, boardNo);
	}


	@Override
	public ArrayList<Attachment> selectAttList(Board b) {
		return bDao.selectAttList(sqlSession, b);
	}

	@Override
	public int updateBoard(Board b, ArrayList<Attachment> atList) {
		int result = bDao.updateBoard(sqlSession, b);
		int attachResult = bDao.updateAttachment(sqlSession, atList);
		
		if(result> 0  && (atList.size() + attachResult > 0)) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@Override
	public int deleteAttachment(Board b) {
		return bDao.deleteAttachment(sqlSession, b);
	}

	@Override
	public ArrayList<Attachment> selectAnonAttList(Board b) {
		return bDao.selectAnonAttList(sqlSession, b);
	}

	@Override
	public int updateABoard(Board b, ArrayList<Attachment> atList) {
		int result = bDao.updateABoard(sqlSession, b);
		int attachResult = bDao.updateAnonAttachment(sqlSession, atList);
		
		if(result> 0  && (atList.size() + attachResult > 0)) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@Override
	public int deleteAnonAttachment(Board b) {
		return bDao.deleteAnonAttachment(sqlSession, b);
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
	public int deleteReply(int replyNo) {
		return bDao.deleteReply(sqlSession, replyNo);
	}
	
	@Override
	public int updateReply(int replyNo) {
		return bDao.updateReply(sqlSession, replyNo);
	}
	
	@Override
	public int updateReplyForm(BoardReply r) {
		return bDao.updateReplyForm(sqlSession, r);
	}
	
	@Override
	public ArrayList<Board> selectTopList() {
		return bDao.selectTopList(sqlSession);
	}

	@Override
	public ArrayList<Board> selectFreeList() {
		return bDao.selectFreeList(sqlSession);
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
	public int updateCate(BoardCate bc) {
		return bDao.updateCate(sqlSession, bc);
	}

	@Override
	public ArrayList<BoardCate> selectDetailSettings(BoardCate bc) {
		return null;
	}

	@Override
	public int deleteSettings(BoardCate bc) {
		return 0;
	}

	

	

	

	
	

	

	

	
	

	
	

	

	

	

	

}
