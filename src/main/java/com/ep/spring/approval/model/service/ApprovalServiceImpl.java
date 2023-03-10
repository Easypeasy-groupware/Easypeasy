package com.ep.spring.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.approval.model.dao.ApprovalDao;
import com.ep.spring.approval.model.vo.Approval;

@Service
public class ApprovalServiceImpl implements ApprovalService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao aDao;
	
	@Override
	public ArrayList<Approval> selectMainWList(int eNo) {
		
		return aDao.selectMainWList(sqlSession, eNo);
	}

	@Override
	public ArrayList<Approval> selectMainSList(int eNo) {
		return aDao.selectMainSList(sqlSession, eNo);
	}
	
	@Override
	public Approval selectEnrollInfo(int eNo) {
		
		return aDao.selectEnrollInfo(sqlSession, eNo);
	}

	@Override
	public int selectWaitingAListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectWatingAList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectWaitingRListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectWaitingRList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectSendListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectSendList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectTempListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectTempList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectApprovalListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectApprovalList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRefListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectRefList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectDeptSendListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectDeptSendList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectDeptRefListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectDeptRefList() {
		// TODO Auto-generated method stub
		return null;
	}





}
