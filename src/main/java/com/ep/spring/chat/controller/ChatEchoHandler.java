package com.ep.spring.chat.controller;

import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ep.spring.chat.model.service.ChatService;
import com.ep.spring.chat.model.vo.ChatRecord;
import com.ep.spring.chat.model.vo.ChatRoom;
import com.ep.spring.login.model.vo.Employee;
import com.fasterxml.jackson.databind.ObjectMapper;


public class ChatEchoHandler extends TextWebSocketHandler {
	
		@Autowired
	    ChatService cService;
	    
		//JSON → Java Object : readValue()이용
	    private final ObjectMapper objectMapper = new ObjectMapper();
	
		// 웹소켓 세션 객체(클라이언트)들을 저장해두는 리스트를 전역변수로 생성해둠
	
		// 채팅방 목록 <방 번호, ArrayList<session> >이 들어간다.
	    private Map<String, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();
	    // session, 방 번호가 들어간다.
	    private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<WebSocketSession, String>();
    
		
		private static int i;
		
		
		// 해당 웹소켓에 새로운 클라이언트와 연결됐을때 실행할 내용 정의 
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {//WebSocketSession객체가 클라이언트에 대한 정보를 담는 객체
			i++;
			
			System.out.println("\n========== websocket 연결됨 =============");
			System.out.println("session Id : " + session.getId());
			//System.out.println("session Attributes : " + session.getAttributes()); // {sessionId=xxxxxxx, loginUser=Member객체}
			System.out.println("현재 채팅방에 참가한 로그인한 회원 : " + session.getAttributes().get("loginUser"));
			System.out.println(session.getId() + " 연결 성공 => 총 접속 인원 : " + i + "명");

		}
		
		 /**
	     * websocket 연결 종료 시
	     */
	    @Override
	    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	        i--;
	        System.out.println(session.getId() + " 연결 종료 => 총 접속 인원 : " + i + "명");
	        
	        String roomNo = "";
	        // sessionList에 session이 있다면
	        if(sessionList.get(session) != null) {
	            // 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
	            RoomList.get(sessionList.get(session)).remove(session);
	            roomNo = sessionList.get(session);
	            
	            sessionList.remove(session);
	        }
	        ChatRecord chatMessage = new ChatRecord();
	        chatMessage.setEmpNo(String.valueOf(((Employee) session.getAttributes().get("loginUser")).getEmpNo()));
	        chatMessage.setMessage("EXIT-CHAT");
	        chatMessage.setRoomNo(roomNo);
	        chatMessage.setChatType("exit");
	        chatMessage.setUnReadCount(0);
	        System.out.println("exit chatMessage : " + chatMessage);
	        int a = cService.insertMessage(chatMessage);
	    }
		
	    @Override
	    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	 
	        // 전달받은 메세지
	        String msg = message.getPayload();
	        System.out.println(msg);
	        
	        // Json객체 → Java객체
	        // 출력값 : [roomNo=123, messageId=null, message=~~~, empNo=00, empName=홍길동, empProfile=, jobName=, unReadCount=0, chatType = ~~~]
			
	        ChatRecord chatMessage = objectMapper.readValue(msg,ChatRecord.class);

	        // 받은 메세지에 담긴 roomNo로 해당 채팅방을 찾아온다.
	        ChatRoom chatRoom = cService.selectChatRoom(chatMessage.getRoomNo());
	        int count = chatRoom.getCount();
	        
	        // 채팅 세션 목록에 채팅방이 존재하지 않고, 처음 들어왔고, DB에서의 채팅방이 있을 때
	        // 채팅방 생성
	        if(RoomList.get(chatRoom.getRoomNo()) == null && chatMessage.getChatType().equals("enter") && chatRoom != null) {

	            // 채팅방에 들어갈 session들
	            ArrayList<WebSocketSession> sessionTwo = new ArrayList<>();
	            // session 추가
	            sessionTwo.add(session);
	            // sessionList에 추가
	            sessionList.put(session, chatRoom.getRoomNo());
	            // RoomList에 추가
	            RoomList.put(chatRoom.getRoomNo(), sessionTwo);
	            // 확인용
	            System.out.println("채팅방 생성");
	            
	            int a = cService.insertMessage(chatMessage);
	        }
	        
	        // 채팅방이 존재 할 때
	        else if(RoomList.get(chatRoom.getRoomNo()) != null && chatMessage.getChatType().equals("enter") && chatRoom != null) {

	            // RoomList에서 해당 방번호를 가진 방이 있는지 확인.
	            RoomList.get(chatRoom.getRoomNo()).add(session);
	            // sessionList에 추가
	            sessionList.put(session, chatRoom.getRoomNo());
	            // 확인용
	            System.out.println("생성된 채팅방으로 입장");
	            int a = cService.insertMessage(chatMessage);
	        }
	        
	        // 채팅 메세지 입력 시
	        else if(RoomList.get(chatRoom.getRoomNo()) != null && chatMessage.getChatType().equals("msg") && chatRoom != null) {
	            
	            // 메세지에 이름, 이메일, 내용을 담는다.
	            TextMessage textMessage = new TextMessage(chatMessage.getEmpNo() + "," + chatMessage.getEmpName() + "," + chatMessage.getJobName() + "," + chatMessage.getEmpProfile()
	            											+ "," + chatMessage.getMessage() + "," + chatMessage.getChatType()+ "," + chatMessage.getUnReadCount());   
	            
	            // 현재 session 수
	            int sessionCount = 0;
	 
	            // 해당 채팅방의 session에 뿌려준다.
	            for(WebSocketSession sess : RoomList.get(chatRoom.getRoomNo())) {
	                sess.sendMessage(textMessage);
	                sessionCount++;
	            }
	            
	            
	            chatMessage.setUnReadCount(count - sessionCount);
	            
	            // DB에 저장한다.
	            int a = cService.insertMessage(chatMessage);
	            
	            if(a == 1) {
	                System.out.println("메세지 전송 및 DB 저장 성공");
	            }else {
	                System.out.println("메세지 전송 실패!!! & DB 저장 실패!!");
	            }
	            
	        // 채팅방 제목 변경시    
	        }else if(RoomList.get(chatRoom.getRoomNo()) != null && chatMessage.getChatType().equals("title") && chatRoom != null) {
	        	TextMessage textMessage = new TextMessage(chatMessage.getEmpNo() + "," + chatMessage.getEmpName() + "," + chatMessage.getJobName() + "," + chatMessage.getEmpProfile() + "," + chatMessage.getMessage() + "," + chatMessage.getChatType());   
	            
	            // 현재 session 수
	            int sessionCount = 0;
	 
	            // 해당 채팅방의 session에 뿌려준다.
	            for(WebSocketSession sess : RoomList.get(chatRoom.getRoomNo())) {
	                sess.sendMessage(textMessage);
	                sessionCount++;
	            }
	            
	            chatMessage.setUnReadCount(count - sessionCount);
	            
	            // DB에 저장한다.
	            int a = cService.updateTitle(chatMessage);
	            
	            if(a == 2) {
	                System.out.println("메세지 전송 및 DB 저장 성공");
	            }else {
	                System.out.println("메세지 전송 실패!!! & DB 저장 실패!!");
	           }
	        }
	       
	        
	        
	        
	        
	        
	    }



}
