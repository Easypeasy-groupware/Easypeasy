package com.ep.spring.chat.model.vo;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component("cSession")
public class ChatSession {
	
	// static으로 필드변수를 설정하여 같은 ArrayList를 이용 할 수 있도록 선언합니다.
    private static ArrayList<String> loginChatUser = new ArrayList<String>();
    
    // 로그인 시 ArrayList에 추가합니다.
    public void addLoginChatUser(int empNo) {
    	loginChatUser.add(String.valueOf(empNo));
    }
    
    // 로그아웃 시 ArrayList에서 제거합니다.
    public void removeLoginChatUser(int empNo) {
    	loginChatUser.remove(String.valueOf(empNo));
    }
 
    // 현재 로그인 되어 있는 유저 목록을 가져옵니다.
    public static ArrayList<String> getLoginChatUser() {
        return loginChatUser;
    }
 
    // 자동 setter. 사용하진 않았습니다.
    public static void setLoginChatUser(ArrayList<String> loginChatUser) {
        ChatSession.loginChatUser = loginChatUser;
    }

}
