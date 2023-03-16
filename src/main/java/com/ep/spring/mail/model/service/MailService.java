package com.ep.spring.mail.model.service;

import java.util.ArrayList;

import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.mail.model.vo.Mail;
import com.ep.spring.mail.model.vo.MailTag;

public interface MailService {

	// 1. 메일 메인 페이지 조회
	// - 수신메일 리스트 조회
	ArrayList<Mail> selectReceiveMailList(String email);
	// - 즐겨찾기 리스트 조회
	
	// - 태그 리스트 조회
	ArrayList<MailTag> selectTagList(int empNo);
	
	// 2. 태그 생성
	int insertTag(MailTag t);

	// 3. 메일 발신
	// 메일 정보 발신
	int sendMail(Mail m, ArrayList<Mail> mList);
	// 발신 메일 첨부파일 저장
	int insertAttachment(ArrayList<Attachment> atList);

	// 4. 메일 상세조회하기
	// 보낸 메일 정보
	Mail selectMail(Mail m);
	// 수신자 리스트 조회
	ArrayList<Mail> selectReceiverList(Mail m);

	
	
	

	
	
	
}
