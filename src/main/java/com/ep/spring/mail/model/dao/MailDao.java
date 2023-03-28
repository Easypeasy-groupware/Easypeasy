package com.ep.spring.mail.model.dao;

import java.util.ArrayList;
import java.util.Arrays;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.mail.model.vo.Mail;
import com.ep.spring.mail.model.vo.MailFavorite;
import com.ep.spring.mail.model.vo.MailTag;

@Repository
public class MailDao {

	public ArrayList<Mail> selectReceiveMailList(String email, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiceMailList", email);
	}
	
	public ArrayList<Mail> selectList(PageInfo pi, String email, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectList", email, rowBounds);
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
	
	public int selectRecSendMailNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectRecSendMailNo");
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

	public ArrayList<ArrayList<Attachment>> selectAttachmentList(ArrayList<Mail> mailList, SqlSessionTemplate sqlSession) {
		ArrayList<ArrayList<Attachment>> attachList = new ArrayList<ArrayList<Attachment>>();
		for(Mail m : mailList) {
			ArrayList<Attachment> at = new ArrayList<Attachment>();
			at = (ArrayList)sqlSession.selectList("mailMapper.selectMailAttachment", m);
			if(!at.isEmpty()) {
				attachList.add(at);
			}
		}
		return attachList;
	}
	
	public ArrayList<Attachment> selectAttachMailList(Mail m, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectMailAttachment", m);
	}
	
	public int updateReadUnreadMail(Mail m, SqlSessionTemplate sqlSession) {
		return sqlSession.update("mailMapper.updateReadUnreadMail", m);
	}

	public int deleteMail(Mail m, int[] recMailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(recMailNoList.length > 0) {
			for(int mail : recMailNoList) {
				m.setRecMailNo(mail);
				result += sqlSession.update("mailMapper.deleteMail", m);
			}
		}else {
			result = sqlSession.update("mailMapper.deleteMail", m);
		}
		return result;
	}

	public int completeDeleteMail(Mail m, int[] recMailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(recMailNoList.length > 0) {
			for(int mail : recMailNoList) {
				m.setRecMailNo(mail);
				result += sqlSession.update("mailMapper.completeDeleteMail", m);
			}
		}else {
			result = sqlSession.update("mailMapper.completeDeleteMail", m);
		}
		return result;
	}

	public int spamEnroll(Mail m, int[] recMailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		System.out.println(recMailNoList);
		if(recMailNoList.length > 0) {
			for(int mail : recMailNoList) {
				m.setRecMailNo(mail);
				result += sqlSession.update("mailMapper.spamEnroll", m);
			}
		}else {
			result = sqlSession.update("mailMapper.spamEnroll", m);
		}
		return result;
	}

	public int spamClear(Mail m, int[] recMailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(recMailNoList.length > 0) {
			for(int mail : recMailNoList) {
				m.setRecMailNo(mail);
				result += sqlSession.update("mailMapper.spamClear", m);
			}
		}else {
			result = sqlSession.update("mailMapper.spamClear", m);
		}
		return result;
	}

	public int tagMail(Mail m, int[] recMailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(recMailNoList.length > 0) {
			for(int mail : recMailNoList) {
				m.setRecMailNo(mail);
				result += sqlSession.update("mailMapper.tagMail", m);
			}
		}else {
			result = sqlSession.update("mailMapper.tagMail", m);
		}
		return result;
	}

	public ArrayList<Mail> selectTodayMailList(String email, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectTodayMailList", email, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectTodayMailList", email);
		}
	}

	public ArrayList<Mail> selectToMeMailList(String email, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectToMeMailList", email, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectToMeMailList", email);
		}
	}

	public ArrayList<Mail> selectAttachMailList(String email, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectAttachMailList", email, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectAttachMailList", email);
		}
	}

	public ArrayList<Mail> selectImporMailList(String email, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectImporMailList", email, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectImporMailList", email);
		}
	}

	public ArrayList<Mail> selectUnreadMailList(String email, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectUnreadMailList", email, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectUnreadMailList", email);
		}
	}

	public ArrayList<Mail> selectSendMailList(String email, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectSendMailList", email, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectSendMailList", email);
		}
	}

	public int deleteSendMail(int[] mailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		for(int i=0; i<mailNoList.length; i++) {
			Mail m = new Mail();
			m.setMailNo(mailNoList[i]);
			result = sqlSession.update("mailMapper.deleteSendMail", m);
		}
		return result;
	}

	public ArrayList<Mail> selectTempMailList(String email, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectTempMailList", email, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectTempMailList", email);
		}
	}

	public int enrollImporMail(Mail m, SqlSessionTemplate sqlSession) {
		return sqlSession.update("mailMapper.enrollImporMail", m);
	}

	public int enrollFavorMailBox(MailFavorite mf, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("mailMapper.enrollFavorMailBox", mf);
	}

	public int deleteFavorMailBox(MailFavorite mf, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("mailMapper.deleteFavorMailBox", mf);
	}

	public ArrayList<MailFavorite> selectMailFavorList(int empNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectMailFavorList", empNo);
	}

	public ArrayList<Mail> selectTaggingMailList(MailTag t, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectTaggingMailList", t, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectTaggingMailList", t);
		}
	}

	public MailTag selectTag(MailTag t, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectTag", t);
	}

	public ArrayList<Mail> selectDeleteMailList(String email, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectDeleteMailList", email);
	}

	public int restoreDeleteMail(Mail m, int[] recMailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(recMailNoList.length > 0) {
			for(int mail : recMailNoList) {
				m.setRecMailNo(mail);
				result += sqlSession.update("mailMapper.restoreDeleteMail", m);
			}
		}else {
			result = sqlSession.update("mailMapper.restoreDeleteMail", m);
		}
		return result;
	}

	public int completeDeleteMailAll(String email, Mail m, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(m.getJunkMail() == null) {
			result = sqlSession.delete("mailMapper.completeDeleteMailAll1", email);
		}else {
			result = sqlSession.delete("mailMapper.completeDeleteMailAll2", email);
		}
		return result;
	}

	

	

	

	

	

	

	
}
