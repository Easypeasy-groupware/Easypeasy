package com.ep.spring.mail.model.service;

import java.util.ArrayList;

import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.mail.model.vo.Mail;
import com.ep.spring.mail.model.vo.MailTag;

public interface MailService {

	/* 1. 메일 메인 페이지 조회 */
	// - 수신메일 리스트 조회
	ArrayList<Mail> selectReceiveMailList(String email);
	// - 즐겨찾기 리스트 조회
	
	// - 태그 리스트 조회
	ArrayList<MailTag> selectTagList(int empNo);
	
	
	/* 2. 태그 생성 */
	int insertTag(MailTag t);

	
	/* 3. 메일 발신 */
	int sendMail(Mail m, ArrayList<Mail> mList, ArrayList<Attachment> atList);

	
	/* 4. 메일 상세조회하기 */
	// 메일 읽음 처리
	void readMail(Mail m);
	// 안읽은 메일 수량 조회
	int unReadCount(Mail m);
	// 보낸 메일 정보
	Mail selectMail(Mail m);
	// 수신자 리스트 조회
	ArrayList<Mail> selectReceiverList(Mail m);
	// 첨부파일 리스트 조회
	ArrayList<Attachment> selectAttachmentList(Mail m);

	
	/* 5. 메일 읽음/안읽음 처리 */
	int updateReadUnreadMail(Mail m);

	
	/* 6. 휴지통 보내기 */
	int deleteMail(Mail m);

	
	/* 7. 비우기 처리(영구 삭제) */
	int completeDeleteMail(Mail m);

	
	/* 8. 스팸처리 */
	// 스팸 등록
	int spamEnroll(Mail m, int[] mailNoList);
	// 스팸 해제
	int spamClear(Mail m, int[] mailNoList);


	

	

	
	
	

	
	
	
}
