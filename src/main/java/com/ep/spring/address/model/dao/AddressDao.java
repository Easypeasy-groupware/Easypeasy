package com.ep.spring.address.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.address.model.vo.AddFavorite;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Employee;

@Repository
public class AddressDao {

	public int selectEntEmpListCount(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("addressMapper.selectEntEmpListCount", no);
	}

	public ArrayList<Employee> selectEntEmpListCount(SqlSessionTemplate sqlSession, PageInfo pi, int no) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("addressMapper.selectEntEmpList", no, rowBounds); 
	}


	
	
	
	
	
	
	
	
	
	
	
	
	

}
