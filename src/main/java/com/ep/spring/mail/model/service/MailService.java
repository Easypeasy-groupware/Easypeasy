package com.ep.spring.mail.model.service;

import java.util.ArrayList;

import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.mail.model.vo.MailTag;
import com.ep.spring.mail.model.vo.ReceiveMail;

public interface MailService {

	// 1. 메일 메인 페이지 조회
	// - 수신메일 리스트 조회
	ArrayList<ReceiveMail> selectReceiveMailList(String email);
	// - 즐겨찾기 리스트 조회
	
	// - 태그 리스트 조회
	ArrayList<MailTag> selectTagList(int empNo);
	
	// 2. 태그 생성
	int insertTag(MailTag t);

	

	
	
	
}
