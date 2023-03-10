package com.ep.spring.dataBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.dataBoard.model.vo.DataBoard;

@Repository
public class DataBoardDao {

	public int selectDbListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("dataBoardMapper.selectDbListCount");
	}
	
	public ArrayList<DataBoard> selectDbList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		// 몇개의 게시글을 건너뛸건지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		// 조회할 게시글 개수
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("dataBoardMapper.selectDbList", null, rowBounds);
	}
}
