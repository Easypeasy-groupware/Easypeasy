package com.ep.spring.mail.model.service;

import java.util.ArrayList;

import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.mail.model.vo.Mail;
import com.ep.spring.mail.model.vo.MailFavorite;
import com.ep.spring.mail.model.vo.MailTag;

public interface MailService {

	/* 1. 메일 메인 페이지 조회 */
	// - 수신메일 리스트 조회
	ArrayList<Mail> selectReceiveMailList(String email);
	// - 중요메일 리스트 조회
	ArrayList<Mail> selectImporMailList(PageInfo mailPi, String email);
	// - 첨부메일 리스트 조회
	ArrayList<Mail> selectAttachMailList(PageInfo mailPi, String email);
	// - 오늘 온 메일 리스트 조회
	ArrayList<Mail> selectTodayMailList(PageInfo mailPi, String email);
	// - 내게 쓴 메일 리스트 조회
	ArrayList<Mail> selectToMeMailList(PageInfo mailPi, String email);
	// - 안읽은 메일 리스트 조회
	ArrayList<Mail> selectUnreadMailList(PageInfo mailPi, String email);
	// - 작성중인 메일 리스트 조회
	ArrayList<Mail> selectTempMailList(PageInfo mailPi, String email);
	// - 보낸 메일 리스트 조회
	ArrayList<Mail> selectSendMailList(PageInfo mailPi, String email);
	// - 태그 한 메일 리스트 조회
	ArrayList<Mail> selectTaggingMailList(MailTag t, PageInfo mailPi);
	// - 삭제한 메일 리스트 조회
	ArrayList<Mail> selectDeleteMailList(String email);
	// - 리스트 페이징
	ArrayList<Mail> selectList(PageInfo pi, String email);
	// - 페이징 리스트 역순 조회
	ArrayList<Mail> selectPreviousList(PageInfo mailPi, String email);
	
	/* 2. 태그 생성 */
	int insertTag(MailTag t);
	// - 태그 리스트 조회
	ArrayList<MailTag> selectTagList(int empNo);

	
	/* 3. 메일 발신 */
	int sendMail(Mail m, ArrayList<Mail> mList, ArrayList<Attachment> atList);
	
	
	/* 4. 메일 상세조회하기 */
	// - 메일 읽음 처리
	void readMail(Mail m);
	// - 안읽은 메일 수량 조회
	int unReadCount(Mail m);
	// - 보낸 메일 정보
	Mail selectMail(Mail m);
	// - 수신자 리스트 조회
	ArrayList<Mail> selectReceiverList(Mail m);
	// - 메일 리스트 첨부파일 조회
	ArrayList<ArrayList<Attachment>> selectAttachmentList(ArrayList<Mail> mailList);
	// - 단일 메일 첨부파일 리스트 조회
	ArrayList<Attachment> selectMailAttachment(Mail m);
	

	
	/* 5. 메일 읽음/안읽음 처리 */
	int updateReadUnreadMail(String[] recMailNoList, String recCheck);

	
	/* 6. 휴지통 보내기 */
	int deleteMail(Mail m, int[] recMailNoList);
	// - 메일 복원
	int restoreDeleteMail(Mail m, int[] recMailNoList);
	
	/* 7. 영구 삭제 */
	int completeDeleteMail(Mail m, int[] recMailNoList);
	// - 비우기 버튼 일괄 삭제
	int completeDeleteMailAll(String email, String division);
	// - 보낸 메일 삭제
	int deleteSendMail(int[] mailNoList);

	
	/* 8. 스팸처리 */
	// 스팸 등록
	int spamEnroll(Mail m, int[] recMailNoList);
	// 스팸 해제
	int spamClear(Mail m, int[] recMailNoList);

	/* 9. 메일 태그 등록 */
	int tagMail(Mail m, int[] recMailNoList);
	// - 태그 조회
	MailTag selectTag(MailTag t);
	
	/* 10. 중요 메일 등록 */
	int enrollImporMail(Mail m);
	
	/* 11. 메일함 즐겨찾기 */
	// - 메일함 즐겨찾기 리스트 조회
	ArrayList<MailFavorite> selectMailFavorList(int empNo);
	// - 등록
	int enrollFavorMailBox(MailFavorite mf);
	// - 삭제
	int deleteFavorMailBox(MailFavorite mf);
	
	/* 임시 저장 */
	int insertTempMail(Mail m, ArrayList<Mail> mList, ArrayList<Attachment> atList);
	

	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	


	

	

	
	
	

	
	
	
}
