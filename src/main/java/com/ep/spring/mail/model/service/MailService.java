package com.ep.spring.mail.model.service;

import java.util.ArrayList;

import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.mail.model.vo.Mail;
import com.ep.spring.mail.model.vo.MailFavorite;
import com.ep.spring.mail.model.vo.MailTag;

public interface MailService {

	/* 1. 메일 조회 (select 기능) + 페이징 */
	// - 받은 메일 리스트 조회
	ArrayList<Mail> selectReceiveMailList(PageInfo mailPi, Mail m);
	// - 중요메일 리스트 조회
	ArrayList<Mail> selectImporMailList(PageInfo mailPi, Mail m);
	// - 첨부메일 리스트 조회
	ArrayList<Mail> selectAttachMailList(PageInfo mailPi, Mail m);
	// - 오늘 온 메일 리스트 조회
	ArrayList<Mail> selectTodayMailList(PageInfo mailPi, Mail m);
	// - 내게 쓴 메일 리스트 조회
	ArrayList<Mail> selectToMeMailList(PageInfo mailPi, Mail m);
	// - 안읽은 메일 리스트 조회
	ArrayList<Mail> selectUnreadMailList(PageInfo mailPi, Mail m);
	// - 작성중인 메일 리스트 조회
	ArrayList<Mail> selectTempMailList(PageInfo mailPi, Mail m);
	// - 보낸 메일 리스트 조회
	ArrayList<Mail> selectSendMailList(PageInfo mailPi, Mail m);
	// - 삭제한 메일 리스트 조회
	ArrayList<Mail> selectDeleteMailList(PageInfo mailPi, Mail m);
	// - 태그 한 메일 리스트 조회
	ArrayList<Mail> selectTaggingMailList(MailTag t, PageInfo mailPi);
	// - 스팸 메일 리스트 조회
	ArrayList<Mail> selectSpamMailList(PageInfo mailPi, Mail m);
	
	
	/* 2. 태그 생성 및 등록 */
	// - 태그 생성
	int insertTag(MailTag t);
	// - 태그 리스트 조회
	ArrayList<MailTag> selectTagList(int empNo);
	// - 메일 태그 등록
	int tagMail(Mail m, int[] recMailNoList);
	// - 태그 조회
	MailTag selectTag(MailTag t);

	
	/* 3. 메일 발신 */
	int sendMail(Mail m, ArrayList<Mail> mList, ArrayList<Attachment> atList);
	// - 임시 저장
	int insertTempMail(Mail m, ArrayList<Mail> mList, ArrayList<Attachment> atList);
	
	
	/* 4. 개별 메일 상세조회하기 */
	// - 메일 읽음 처리
	void readMail(Mail m);
	// - 안읽은 메일 수량 조회
	int unReadCount(Mail m);
	// - 보낸 메일 정보
	Mail selectMail(Mail m);
	// - 임시 저장 메일 정보
	Mail selectTempMail(Mail m);
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

	
	/* 9. 중요 메일 등록 */
	int enrollImporMail(Mail m);
	
	
	/* 10. 메일 키워드 검색 */
	// - 받은 메일 리스트 검색
	ArrayList<Mail> searchReceiveMailList(PageInfo mailPi, Mail m);
	// - 중요메일 리스트 검색
	ArrayList<Mail> searchImporMailList(PageInfo mailPi, Mail m);
	// - 첨부메일 리스트 검색
	ArrayList<Mail> searchAttachMailList(PageInfo mailPi, Mail m);
	// - 오늘 온 메일 리스트 검색
	ArrayList<Mail> searchTodayMailList(PageInfo mailPi, Mail m);
	// - 내게 쓴 메일 리스트 검색
	ArrayList<Mail> searchToMeMailList(PageInfo mailPi, Mail m);
	// - 안읽은 메일 리스트 검색
	ArrayList<Mail> searchUnreadMailList(PageInfo mailPi, Mail m);
	// - 작성중인 메일 리스트 검색
	ArrayList<Mail> searchTempMailList(PageInfo mailPi, Mail m);
	// - 보낸 메일 리스트 검색
	ArrayList<Mail> searchSendMailList(PageInfo mailPi, Mail m);
	// - 삭제한 메일 리스트 검색
	ArrayList<Mail> searchDeleteMailList(PageInfo mailPi, Mail m);
	// - 태그 한 메일 리스트 검색
	ArrayList<Mail> searchTaggingMailList(MailTag t, PageInfo mailPi);
	// - 스팸 메일 리스트 검색
	ArrayList<Mail> searchSpamMailList(PageInfo mailPi, Mail m);

	

	

	

	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	


	

	

	
	
	

	
	
	
}
