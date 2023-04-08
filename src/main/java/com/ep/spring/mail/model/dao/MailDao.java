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
	
	public ArrayList<Mail> selectReceiveMailList(PageInfo pi, Mail m, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectReceiveMailList", m, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectReceiveMailList", m);
		}
		
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
		if(recMailNoList != null) {
			if(recMailNoList.length > 0) {
				for(int mail : recMailNoList) {
					m.setRecMailNo(mail);
					result += sqlSession.update("mailMapper.deleteMail", m);
				}
			}
		}else {
			result = sqlSession.update("mailMapper.deleteMail", m);
		}
		return result;
	}

	public int completeDeleteMail(Mail m, int[] recMailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(recMailNoList != null) {
			if(recMailNoList.length > 0) {
				for(int mail : recMailNoList) {
					m.setRecMailNo(mail);
					result += sqlSession.update("mailMapper.completeDeleteMail", m);
				}
			}
		}else {
			result = sqlSession.update("mailMapper.completeDeleteMail", m);
		}
		return result;
	}

	public int spamEnroll(Mail m, int[] recMailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(recMailNoList != null) {
			if(recMailNoList.length > 0 ) {
				for(int mail : recMailNoList) {
					m.setRecMailNo(mail);
					result += sqlSession.update("mailMapper.spamEnroll", m);
				}
			}
		}else {
			result = sqlSession.update("mailMapper.spamEnroll", m);
		}
		return result;
	}

	public int spamClear(Mail m, int[] recMailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(recMailNoList != null) {
			if(recMailNoList.length > 0) {
				for(int mail : recMailNoList) {
					m.setRecMailNo(mail);
					result += sqlSession.update("mailMapper.spamClear", m);
				}
			}
		}else {
			result = sqlSession.update("mailMapper.spamClear", m);
		}
		return result;
	}

	public int tagMail(Mail m, int[] recMailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(recMailNoList != null) {
			if(recMailNoList.length > 0) {
				for(int mail : recMailNoList) {
					m.setRecMailNo(mail);
					result += sqlSession.update("mailMapper.tagMail", m);
				}
			}
		}else {
			result = sqlSession.update("mailMapper.tagMail", m);
		}
		return result;
	}

	public ArrayList<Mail> selectTodayMailList(Mail m, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectTodayMailList", m, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectTodayMailList", m);
		}
	}

	public ArrayList<Mail> selectToMeMailList(Mail m, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectToMeMailList", m, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectToMeMailList", m);
		}
	}

	public ArrayList<Mail> selectAttachMailList(Mail m, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectAttachMailList", m, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectAttachMailList", m);
		}
	}

	public ArrayList<Mail> selectImporMailList(Mail m, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectImporMailList", m, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectImporMailList", m);
		}
	}

	public ArrayList<Mail> selectUnreadMailList(Mail m, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectUnreadMailList", m, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectUnreadMailList", m);
		}
	}

	public ArrayList<Mail> selectSendMailList(Mail m, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectSendMailList", m, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectSendMailList", m);
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

	public ArrayList<Mail> selectTempMailList(Mail m, PageInfo pi, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectTempMailList", m, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectTempMailList", m);
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

	public ArrayList<Mail> selectDeleteMailList(PageInfo pi, Mail m, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectDeleteMailList", m, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectDeleteMailList", m);
		}
		
	}

	public int restoreDeleteMail(Mail m, int[] recMailNoList, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(recMailNoList != null) {
			if(recMailNoList.length > 0) {
				for(int mail : recMailNoList) {
					m.setRecMailNo(mail);
					result += sqlSession.update("mailMapper.restoreDeleteMail", m);
				}
			}
		}else {
			result = sqlSession.update("mailMapper.restoreDeleteMail", m);
		}
		return result;
	}

	public int completeDeleteMailAll(String email, String division, SqlSessionTemplate sqlSession) {
		int result = 0;
		if(division.equals("trash")) {
			result = sqlSession.delete("mailMapper.completeDeleteMailAll1", email);
		}else {
			result = sqlSession.delete("mailMapper.completeDeleteMailAll2", email);
		}
		return result;
	}

	public int insertTempMail(Mail m, ArrayList<Mail> mList, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("mailMapper.insertTempMail", m);
	}

	public ArrayList<Mail> selectSpamMailList(PageInfo pi, Mail m, SqlSessionTemplate sqlSession) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.selectSpamMailList", m, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.selectSpamMailList", m);
		}
	}

	public ArrayList<Mail> searchReceiveMailList(PageInfo mailPi, Mail m, SqlSessionTemplate sqlSession) {
		if(mailPi != null) {
			int offset = (mailPi.getCurrentPage() - 1) * mailPi.getBoardLimit();
			int limit = mailPi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlSession.selectList("mailMapper.searchReceiveMailList", m, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("mailMapper.searchReceiveMailList", m);
		}
	}

	

	

	

	

	

	

	
}
