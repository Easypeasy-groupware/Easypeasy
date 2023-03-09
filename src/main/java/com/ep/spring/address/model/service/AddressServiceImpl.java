package com.ep.spring.address.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.address.model.dao.AddressDao;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Employee;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AddressDao aDao;
	

	@Override
	public int selectEntEmpListCount() {
		return aDao.selectEntEmpListCount(sqlSession);
	}

	@Override
	public ArrayList<Employee> selectEntEmpListCount(PageInfo pi) {
		return aDao.selectEntEmpListCount(sqlSession, pi);
	}

	@Override
	public int selectDeptEmpListCount(String dept) {
		return 0;
	}

	@Override
	public ArrayList<Employee> selectDeptEmpList(PageInfo pi, String dept) {
		return null;
	}

}
