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
	
	public void readMail(Mail m, SqlSessionTemplate sqlSession) {
		sqlSession.update("mailMapper.readMail", m);
	}
	
	public int unReadCount(Mail m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.unReadCount", m);
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

	public int readUnreadMail(Mail m, SqlSessionTemplate sqlSession) {
		return sqlSession.update("mailMapper.readUnreadMail", m);
	}

	public int deleteMail(Mail m, SqlSessionTemplate sqlSession) {
		return sqlSession.update("mailMapper.deleteMail", m);
	}

	public int completeDeleteMail(Mail m, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("mailMapper.completeDeleteMail", m);
	}

	public int spamEnroll(Mail m, int[] mailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(mailNoList.length > 0) {
			for(int mail : mailNoList) {
				m.setRecMailNo(mail);
				result += sqlSession.update("mailMapper.spamEnroll", m);
			}
		}else {
			result = sqlSession.update("mailMapper.spamEnroll", m);
		}
		return result;
	}

	public int spamClear(Mail m, int[] mailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(mailNoList.length > 0) {
			for(int mail : mailNoList) {
				m.setRecMailNo(mail);
				result += sqlSession.update("mailMapper.spamClear", m);
			}
		}else {
			result = sqlSession.update("mailMapper.spamClear", m);
		}
		return result;
	}

	

	
}
