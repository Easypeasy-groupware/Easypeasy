package com.ep.spring.address.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.address.model.dao.AddressDao;
import com.ep.spring.address.model.vo.AddDept;
import com.ep.spring.address.model.vo.AddGroup;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Employee;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AddressDao aDao;
	

	@Override
	public ArrayList<AddGroup> selectPersonalAddGroup(Employee e) {
		return aDao.selectPersonalAddGroup(sqlSession, e);
	}
	
	@Override
	public int selectEntEmpListCount(int no) {
		return aDao.selectEntEmpListCount(sqlSession, no);
	}

	@Override
	public ArrayList<Employee> selectEntEmpList(PageInfo pi, int no) {
		return aDao.selectEntEmpListCount(sqlSession, pi, no);
	}
	
	@Override
	public ArrayList<Employee> selectEmpFavList(int no) {
		return aDao.selectEmpFavList(sqlSession, no);
	}
	
	@Override
	public int selectDeptEmpListCount(AddDept ad) {
		return aDao.selectDeptEmpListCount(sqlSession, ad);
	}

	@Override
	public ArrayList<Employee> selectDeptEmpList(PageInfo pi, AddDept ad) {
		return aDao.selectDeptEmpList(sqlSession, pi, ad);
	}

	@Override
	public Employee selectEmpAddDetail(int no) {
		return aDao.selectEmpAddDetail(sqlSession, no);
	}






}
