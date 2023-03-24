package com.ep.spring.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.alarm.model.service.AlarmService;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.mail.model.dao.MailDao;
import com.ep.spring.mail.model.vo.Mail;
import com.ep.spring.mail.model.vo.MailTag;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MailDao mDao;
	
	@Autowired
	private AlarmService aService;
	
	@Override
	public ArrayList<Mail> selectReceiveMailList(String email) {
		return mDao.selectReceiveMailList(email, sqlSession);
	}
	
	@Override
	public ArrayList<Mail> selectList(PageInfo pi, String email) {
		return mDao.selectList(pi, email, sqlSession);
	}

	@Override
	public ArrayList<MailTag> selectTagList(int empNo) {
		return mDao.selectTagList(empNo, sqlSession);
	}
	
	@Override
	public int insertTag(MailTag t) {
		return mDao.insertTag(t, sqlSession);
	}

	@Override
	public int sendMail(Mail m, ArrayList<Mail> mList, ArrayList<Attachment> atList) {
		int sendResult = mDao.insertSendMail(m, sqlSession);
		int receiveResult = mDao.insertReceiveMail(mList, sqlSession);
		int attachResult = mDao.insertAttachment(atList, sqlSession);
		if((sendResult > 0 && receiveResult > 0) || (atList.size() + attachResult > 0)) {
			int mailNo = mDao.selectRecSendMailNo(sqlSession);
			aService.receiveMailAlarm(mList, mailNo);
			return 1;
		}else {
			return 0;
		}
	}
	
	@Override
	public void readMail(Mail m) {
		mDao.readMail(m, sqlSession);
	}
	
	@Override
	public int unReadCount(Mail m) {
		return mDao.unReadCount(m, sqlSession);
	}
	
	@Override
	public Mail selectMail(Mail m) {
		return mDao.selectMail(m, sqlSession);
	}

	@Override
	public ArrayList<Mail> selectReceiverList(Mail m) {
		return mDao.selectReceiverList(m, sqlSession);
	}

	@Override
	public ArrayList<Attachment> selectAttachmentList(Mail m) {
		return mDao.selectAttachmentList(m, sqlSession);
	}

	@Override
	public int updateReadUnreadMail(String[] recMailNoList, String recCheck) {
		int result = 0;
		Mail m = new Mail();
		for(int i=0; i<recMailNoList.length; i++) {
			m.setRecMailNo(Integer.parseInt(recMailNoList[i]));
			m.setRecCheck(recCheck);
			result += mDao.updateReadUnreadMail(m, sqlSession);
		}
		return result;
	}


	@Override
	public int deleteMail(Mail m, int[] recMailNoList) {
		return mDao.deleteMail(m, recMailNoList, sqlSession);
	}

	@Override
	public int completeDeleteMail(Mail m) {
		return mDao.completeDeleteMail(m, sqlSession);
	}

	@Override
	public int spamEnroll(Mail m, int[] recMailNoList) {
		return mDao.spamEnroll(m, recMailNoList, sqlSession);
	}

	@Override
	public int spamClear(Mail m, int[] recMailNoList) {
		return mDao.spamClear(m, recMailNoList, sqlSession);
	}

	@Override
	public int tagMail(Mail m, int[] recMailNoList) {
		return mDao.tagMail(m, recMailNoList, sqlSession);
	}

	
	

	

	

	

	

	
	
}
