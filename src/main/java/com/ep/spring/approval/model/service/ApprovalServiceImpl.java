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
		return aDao.selectWaitingRListCount(sqlSession, eNo);
	}

	@Override
	public ArrayList<Approval> selectWaitingRList(PageInfo pi, int eNo) {
		return aDao.selectWaitingRList(sqlSession, pi, eNo);
	}

	@Override
	public int selectSendListCount(int eNo) {
		
		return aDao.selectSendListCount(sqlSession, eNo);
	}

	@Override
	public ArrayList<Approval> selectSendList(PageInfo pi, int eNo) {
		
		return aDao.selectSendList(sqlSession, pi, eNo);
	}

	@Override
	public int selectTempListCount(int eNo) {
		return aDao.selectTempListCount(sqlSession, eNo);
	}

	@Override
	public ArrayList<Approval> selectTempList(PageInfo pi, int eNo) {
		return aDao.selectTempList(sqlSession, pi, eNo);
	}

	@Override
	public int selectRecListCount(int eNo) {
		return aDao.selectRecListCount(sqlSession, eNo);
	}

	@Override
	public ArrayList<Approval> selectRecList(PageInfo pi, int eNo) {
		return aDao.selectRecList(sqlSession, pi, eNo);
	}

	@Override
	public int selectRefListCount(int eNo) {
		return aDao.selectRefListCount(sqlSession, eNo);
	}

	@Override
	public ArrayList<Approval> selectRefList(PageInfo pi, int eNo) {
		return aDao.selectRefList(sqlSession, pi, eNo);
	}

	@Override
	public int selectDeptSendListCount(int eNo) {
		return aDao.selectDeptSendListCount(sqlSession, eNo);
	}

	@Override
	public ArrayList<Approval> selectDeptSendList(PageInfo pi, int eNo) {
		return aDao.selectDeptSendList(sqlSession, pi, eNo);
	}

	@Override
	public int selectDeptRefListCount(int eNo) {
		return aDao.selectDeptRefListCount(sqlSession, eNo);
	}

	@Override
	public ArrayList<Approval> selectDeptRefList(PageInfo pi, int eNo) {
		return aDao.selectDeptRefList(sqlSession, pi, eNo);
	}





}
