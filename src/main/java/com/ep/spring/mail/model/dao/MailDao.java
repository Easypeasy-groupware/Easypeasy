package com.ep.spring.mail.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.mail.model.vo.Mail;
import com.ep.spring.mail.model.vo.MailTag;

@Repository
public class MailDao {

	public ArrayList<Mail> selectReceiveMailList(String email, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiceMailList", email);
	}

	public ArrayList<MailTag> selectTagList(int empNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectTagList", empNo);
	}
	
	public int insertTag(MailTag t, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("mailMapper.insertTag", t);
	}

	public int insertSendMail(Mail m, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("mailMapper.sendMail", m);
	}
	
	public int insertReceiveMail(ArrayList<Mail> mList, SqlSessionTemplate sqlSession) {
		int result = 0;
		for(Mail m : mList) {
			result += sqlSession.insert("mailMapper.receiveMail", m);
		}
		return result;
	}
	
	public int insertAttachment(ArrayList<Attachment> atList, SqlSessionTemplate sqlSession) {
		int result = 0;
		for(Attachment at : atList) {
			result += sqlSession.insert("mailMapper.insertAttachment", at);
		}
		return result;
	}

	public Mail selectMail(Mail m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectMail", m);
	}

	public ArrayList<Mail> selectReceiverList(Mail m, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiverList", m);
	}

	public ArrayList<Attachment> selectAttachmentList(Mail m, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attachmentMapper.selectMailAttachmentList", m);
	}
}
