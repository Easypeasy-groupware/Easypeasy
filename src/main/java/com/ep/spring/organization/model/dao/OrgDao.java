package com.ep.spring.organization.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Department;
import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.login.model.vo.Job;

@Repository
public class OrgDao {
	
	
	public ArrayList<Job> selectJob(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("organizationMapper.selectJob");
	}
	
	public ArrayList<Department> selectDept(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("organizationMapper.selectDept");
	}
	
	public ArrayList<Employee> selectOrgList(SqlSessionTemplate sqlSession, int no){
		return (ArrayList)sqlSession.selectList("organizationMapper.selectOrgList");
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("organizationMapper.selectListCount");
	}
	
	public ArrayList<Employee> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) *pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("organizationMapper.selectList", null, rowBounds);
	}
	
	
	 public int insertMember(SqlSessionTemplate sqlSession, Employee e) { 
		 return sqlSession.insert("organizationMapper.insertMember", e); 
	 }
	 
	
	
	public int noCheck(SqlSessionTemplate sqlSession, String checkNo) {
		return sqlSession.selectOne("organizationMapper.noCheck", checkNo);
	}
	
	
	public Employee selectDetailForm(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("organizationMapper.selectDetailForm", no);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("organizationMapper.updateMember", e);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession) {
		return sqlSession.delete("organizationMapper.deleteMember");
	}
	
	
	/*
	 * public ArrayList<Employee> selectSettingForm(SqlSessionTemplate sqlSession,
	 * Employee e) { return
	 * (ArrayList)sqlSession.selectList("organizationMapper.selectDetailForm", e); }
	 */
	
	
	public int selectSearchCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("organizationMapper.selectSearchCount");
	}
	
	public ArrayList<Employee> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) *pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("organizationMapper.selectSearchList", null, rowBounds);
	}
	
	
}
