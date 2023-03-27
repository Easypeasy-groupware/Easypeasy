package com.ep.spring.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ChatRecord {
	
	private String messageNo;        // 메세지 번호
	private String roomNo;            // 방 번호
    private String message;            // 메세지 내용
    private String empNo;
    private String empName;
    private int unReadCount;        // 안 읽은 메세지 수
    private int sessionCount;       // 현재 세션 수
    
    private String chatTime;
    private String chatType;
    private String status;
    private String jobName;
    private String empProfile;
}
