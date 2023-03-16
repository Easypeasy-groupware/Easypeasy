package com.ep.spring.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.mail.model.dao.MailDao;
import com.ep.spring.mail.model.vo.Mail;
import com.ep.spring.mail.model.vo.MailTag;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MailDao mDao;
	
	@Override
	public ArrayList<Mail> selectReceiveMailList(String email) {
		return mDao.selectReceiveMailList(email, sqlSession);
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
		
		if(sendResult > 0 && receiveResult > 0 && (atList.size() + attachResult > 0)) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@Override
	public int readMail(Mail m) {
		return mDao.readMail(m, sqlSession);
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

	

	

	

	
	
}
