package com.ep.spring.dataBoard.model.service;

import java.util.ArrayList;

import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.dataBoard.model.vo.DataBoard;

public interface DataBoardService {

	// 1. 리스트 조회 (페이징 처리)
	int selectDbListCount();
	ArrayList<DataBoard> selectDbList(PageInfo pi);
	
	// 2. 게시글 작성
	int insertDataBoard(DataBoard db);
	
	// 3. 게시글 상세조회
	int increaseCount(int dbNo);
	DataBoard selectDataBoard(int dbNo);
	
	// 4. 게시글 삭제
	int deleteDataBoard(int dbNo);
	
	// 5. 게시글 수정
	int updateDataBoard(DataBoard db);
	
}
