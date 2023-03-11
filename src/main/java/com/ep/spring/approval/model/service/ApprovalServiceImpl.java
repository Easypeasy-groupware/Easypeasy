package com.ep.spring.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.approval.model.dao.ApprovalDao;
import com.ep.spring.approval.model.vo.Approval;
import com.ep.spring.common.model.vo.PageInfo;

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
	public int selectWaitingAListCount(int eNo) {

		return aDao.selectWaitingAListCount(sqlSession, eNo);
	}

	@Override
	public ArrayList<Approval> selectWatingAList(PageInfo pi, int eNo) {

		return aDao.selectWatingAList(sqlSession, pi, eNo);
	}

	@Override
	public int selectWaitingRListCount(int eNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectWaitingRList(int eNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectSendListCount(int eNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectSendList(int eNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectTempListCount(int eNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectTempList(int eNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectApprovalListCount(int eNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectApprovalList(int eNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRefListCount(int eNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectRefList(int eNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectDeptSendListCount(int eNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectDeptSendList(int eNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectDeptRefListCount(int eNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Approval> selectDeptRefList(int eNo) {
		// TODO Auto-generated method stub
		return null;
	}





}
