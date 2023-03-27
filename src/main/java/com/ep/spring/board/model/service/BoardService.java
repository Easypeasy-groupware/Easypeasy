package com.ep.spring.board.model.service;

import java.util.ArrayList;

import com.ep.spring.board.model.vo.Board;
import com.ep.spring.board.model.vo.BoardCate;
import com.ep.spring.board.model.vo.BoardReply;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.mail.model.vo.Mail;

public interface BoardService {

	// 1. 게시판 리스트 조회 서비스 (페이징)
	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi);
	
	int selectFreeListCount();
	ArrayList<Board> selectFreeList(PageInfo pi);
		
	// 2. 게시글 작성하기 서비스
	int insertBoard(Board b, ArrayList<Attachment> atList);
	
	int insertABoard(Board b, ArrayList<Attachment> atList);
	
	// 3. 게시글 상세조회용 서비스
	int increaseCount(int no);
	Board selectBoard(Board b);
	ArrayList<Attachment> selectAttachmentList(Board b);
	
	int increaseACount(int no);
	Board selectABoard(Board b);
	ArrayList<Attachment> selectAnAttachmentList(Board b);
		
	// 4. 게시글 삭제용 서비스
	int deleteBoard(int boardNo);
	
	int deleteABoard(int boardNo);
		
	// 5. 게시글 수정용 서비스
	int updateBoard(Board b, ArrayList<Attachment> atList);
	ArrayList<Attachment> selectAttList(Board b);
	int deleteAttachment(Board b);
	
	int updateABoard(Board b, ArrayList<Attachment> atList);
	ArrayList<Attachment> selectAnonAttList(Board b);
	int deleteAnonAttachment(Board b);
		
	// 6. 댓글 리스트 조회용 서비스 (ajax)
	ArrayList<BoardReply> selectReplyList(int boardNo);
		
	// 7. 댓글 작성용 서비스 (ajax)
	int insertReply(BoardReply r);
	
	// 8. 댓글 수정&삭제 서비스 
	int deleteReply(int replyNo);
	int updateReply(int replyNo);
	int updateReplyForm(BoardReply r);
	
		
	// 9. 메인 페이지 게시글 top5 조회용 서비스 (ajax)
	ArrayList<Board> selectTopList();
	ArrayList<Board> selectFreeList();
	
	// 10. 게시판 설정 서비스
	int selectSettings(BoardCate bc);
	int insertCate(BoardCate bc);
	int updateCate(BoardCate bc);
	int deleteSettings(BoardCate bc);
	
	// 11. 메뉴바
	ArrayList<BoardCate> selectDetailSettings(BoardCate bc);
	
	
}
