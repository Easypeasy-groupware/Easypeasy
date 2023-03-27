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

	public ArrayList<Job> selectJob(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("organizationMapper.selectJob");
	}

	public ArrayList<Department> selectDept(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("organizationMapper.selectDept");
	}

	public ArrayList<Employee> selectOrgList(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList) sqlSession.selectList("organizationMapper.selectOrgList");
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("organizationMapper.selectListCount");
	}

	public ArrayList<Employee> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("organizationMapper.selectList", null, rowBounds);
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

	public ArrayList<Department> selectSettingForm(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("organizationMapper.selectSettingForm");
	}

	public ArrayList<Job> selectSettingJob(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("organizationMapper.selectSettingJob");
	}

	public int selectSearchCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("organizationMapper.selectSearchCount", keyword);
	}

	public ArrayList<Employee> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("organizationMapper.selectSearchList", keyword, rowBounds);
	}

	public int insertDept(SqlSessionTemplate sqlSession, Department d) {
		return sqlSession.insert("organizationMapper.insertDept", d);
	}

	public int updateDept(SqlSessionTemplate sqlSession, Department d) {
		return sqlSession.update("organizationMapper.updateDept", d);
	}

	public int deleteDept(SqlSessionTemplate sqlSession, Department d) {
		
		int result = sqlSession.delete("organizationMapper.deleteDept", d);
		
		System.out.println(result);
		
		return result;
		
		/*
		 * return sqlSession.delete("organizationMapper.deleteDept", d);
		 */
	}
	
	public int insertJob(SqlSessionTemplate sqlSession, Job j) {
		return sqlSession.insert("organizationMapper.insertJob", j);
	}

	public int updateJob(SqlSessionTemplate sqlSession, Job j) {
		return sqlSession.update("organizationMapper.updateJob", j);
	}

	public int deleteJob(SqlSessionTemplate sqlSession, Job j) {
		
		return sqlSession.delete("organizationMapper.deleteJob", j);
	}
	
	public ArrayList<Department> selectSideSettings(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("organizationMapper.selectSideSettings");
	}

}
