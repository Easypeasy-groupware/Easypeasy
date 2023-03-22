package com.ep.spring.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.board.model.vo.Board;
import com.ep.spring.board.model.vo.BoardCate;
import com.ep.spring.board.model.vo.BoardReply;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds); 	
	}
	
	/*
	 * public ArrayList<Attachment> selectAtList(SqlSessionTemplate sqlSession,
	 * Attachment a){ return
	 * (ArrayList)sqlSession.selectList("boardMapper.selectAtList", a); }
	 */
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, ArrayList<Attachment> atList) {
		int result = 0;
		for(Attachment at : atList) {
			result += sqlSession.insert("boardMapper.insertAttachment", at);
		}
		return result;
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount", boardNo);
	}
	
	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("boardMapper.deleteBoard", no);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.deleteBoard", b);
	}
	
	public ArrayList<BoardReply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo){
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", boardNo);	
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, BoardReply r) {
		return sqlSession.insert("boardMapper.inserReply", r);
	}
	
	public ArrayList<BoardCate> selectSettings(SqlSessionTemplate sqlSession, BoardCate bc){
		return (ArrayList)sqlSession.selectList("boardMapper.selectSettings", bc);
	}
	
	public int insertCate(SqlSessionTemplate sqlSession, BoardCate bc) {
		return sqlSession.insert("boardMapper.insertCate", bc);
	}
	
	
	
	
	
	
	
	
}
