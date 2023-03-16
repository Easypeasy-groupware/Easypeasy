package com.ep.spring.organization.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Department;
import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.login.model.vo.Job;
import com.ep.spring.organization.model.dao.OrgDao;

@Service
public class OrgServiceImpl implements OrgService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private OrgDao oDao;

	@Override
	public ArrayList<Department> selectDept() {
		return oDao.selectDept(sqlSession);
	}

	@Override
	public ArrayList<Job> selectJob() {
		return oDao.selectJob(sqlSession);
	}

	@Override
	public ArrayList<Employee> selectOrgList(int no) {
		return oDao.selectOrgList(sqlSession, no);
	}

	@Override
	public int selectListCount() {
		return oDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Employee> selectList(PageInfo pi) {
		return oDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertMember(Employee e) {

		int result = oDao.insertMember(sqlSession, e);
		return result;
	}

	@Override
	public int noCheck(String checkNo) {
		return oDao.noCheck(sqlSession, checkNo);
	}

	@Override
	public Employee selectDetailForm(int no) {
		return oDao.selectDetailForm(sqlSession, no);
	}

	@Override
	public int updateMember(Employee e) {
		return oDao.updateMember(sqlSession, e);
	}

	@Override
	public int deleteMember() {
		return oDao.deleteMember(sqlSession);
	}

	/*
	 * @Override public ArrayList<Employee> selectSettingForm(Employee e) { return
	 * oDao.selectSettingForm(sqlSession, e); }
	 */

}
