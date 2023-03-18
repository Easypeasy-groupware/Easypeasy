package com.ep.spring.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.approval.model.dao.ApprovalDao;
import com.ep.spring.approval.model.vo.Approval;
import com.ep.spring.approval.model.vo.ApprovalLine;
import com.ep.spring.approval.model.vo.ApprovalReply;
import com.ep.spring.approval.model.vo.OverTimeForm;
import com.ep.spring.approval.model.vo.VacationForm;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Employee;

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
	public Employee selectEnrollInfo(int eNo) {
		
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

	@Override
	public Approval selectDetailSPrgAp(Approval a) {
		return aDao.selectDetailSPrgAp(sqlSession, a);
	}

	@Override
	public ArrayList<ApprovalLine> selectDetailSPrgAl(Approval a) {
		return aDao.selectDetailSPrgAl(sqlSession, a);
	}



	@Override
	public OverTimeForm selectDetailSPrgOt(Approval a) {
		return aDao.selectDetailSPrgOt(sqlSession, a);
	}

	@Override
	public VacationForm selectDetailSPrgVf(Approval a) {
		return aDao.selectDetailSPrgVf(sqlSession, a);
	}

	@Override
	public ArrayList<Attachment> selectDetailSPrgAt(Approval a) {
		return aDao.selectDetailSPrgAt(sqlSession, a);
	}
	
	@Override
	public ArrayList<ApprovalReply> selectReplyList(int appNo) {
		return aDao.selectReplyList(sqlSession, appNo);
	}

	@Override
	public int insertReply(ApprovalReply r) {
		return aDao.insertReply(sqlSession, r);
	}

	@Override
	public int deleteReply(int replyNo) {
		return aDao.deleteReply(sqlSession, replyNo);
	}

	@Override
	public int deleteApproval(int appNo) {
		return aDao.deleteApproval(sqlSession, appNo);
	}

	@Override
	public Approval selectDetailRec(Approval a) {
		return aDao.selectDetailRec(sqlSession, a);
	}

	@Override
	public int updateCount(Approval a) {
		return aDao.updateCount(sqlSession, a);
	}

	@Override
	public int insertApproval(Approval ap, ArrayList<ApprovalLine> al, VacationForm vf, OverTimeForm ot, ArrayList<Attachment> atList) {
		
		int a = aDao.insertApproval(sqlSession, ap);
		
		int b = 1;
		int c = 1;
		int d = 1;
		int e = 1;
		
		if(al.size() != 0) {
			b = aDao.insertApprovalLine(sqlSession, al);
		}
		
		if(atList.size() != 0) {
		  c = aDao.insertAttachment(sqlSession, atList);
		}
		
		if(vf != null) {
			d = aDao.insertVacationForm(sqlSession, vf);
			
		}else if(ot != null) {
			e = aDao.insertOverTimeForm(sqlSession, ot);
		}
		
		return a * b * c * d * e;
	}











}
