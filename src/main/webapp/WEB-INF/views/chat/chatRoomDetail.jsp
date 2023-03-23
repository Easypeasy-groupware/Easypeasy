<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	/*전체 스크롤바*/
	body::-webkit-scrollbar{width:5px;}
	body::-webkit-scrollbar-thumb{background-color:rgb(194, 194, 194); border-radius:10px;}
	body::-webkit-scrollbar-track{background-color:white;}

    * {padding: 0; margin: 0; box-sizing: border-box;}
	a {text-decoration: none;}
	
	/*채팅룸 헤더*/
	.room-header{margin:10px; height:50px; border: 1px solid gray; border-radius:10px;}
	.room-header>*{float:left;}
	.room-header span:hover{cursor:pointer; font-size:18px;}
	.room-info{line-height:50px; width:65%;}
	#room-name {padding:0 5px 0 15px;}
	.room-manage{line-height:50px;}
	#member-count2{color:gray; margin-right:10px;}
	
	#room-name:hover{cursor:default; font-size:16px;}
	#member-count1:hover, #member-count2:hover{cursor:default; font-size:16px;}
	
	/*채팅출력창 스크롤바*/
	.chat-area::-webkit-scrollbar{width:5px;}
	.chat-area::-webkit-scrollbar-thumb{background-color:rgb(92, 95, 197); border-radius:10px;}
	.chat-area::-webkit-scrollbar-track{background-color:white;}

	/* 채팅 출력창 */
	.chat-area{height:390px; overflow-y:auto;}
	
	.chat-user { /*입퇴장*/
	      text-align:center; 
	      border-radius:10px;   
	      background: lightgray;
	      opacity: 0.5;
	      margin: 20px 10px;
	      color: black;
	      line-height: 30px;
	      font-size: 13px;
	}
	
	.chat-message {display: flex; align-items: flex-start; padding: 10px 20px 10px 20px;}
	
	.icon {position: relative; overflow: hidden; width: 50px; height: 50px;}
	.icon img {position: absolute; left: 50%; width:50px; height:50px; border-radius:50%; transform: translateX(-50%);}
	.other .icon{height: 65px;}
	.other img{margin-top:15px;}

	.msg-wrap{ 
		position: relative;
	    display: inline-block;
	    max-width: calc(100% - 70px);}
	.user-info{margin-left:27px;}
	.user-info span{font-size:12px;}
	
	.chat-area .chat-message .textbox::before {position: absolute; display: block; top: 0; font-size: 1.5rem;}
	.chat-area .other .textbox {position: relative; display: inline-block; padding: 10px; margin-top: 3px; font-size: 13px; border-radius: 10px;
								margin-left: 20px; background-color: #ddd;}
	.chat-area .other .textbox::before {left: -15px; content: "◀"; color: #ddd;}
	.chat-area .mine {flex-direction: row-reverse;}
	.chat-area .mine .textbox {position: relative; display: inline-block; max-width: calc(100% - 70px); padding: 10px; margin-top: 7px; 
								font-size: 13px; border-radius: 10px; margin-right: 20px; background-color: rgb(185, 187, 221);}
	.chat-area .mine .textbox::before { right: -15px; content: "▶"; color: rgb(185, 187, 221);}
	
	/*채팅 입력창*/
	.input-area{text-align:center;}
	#message {margin:10px 10px 0 10px; width:95%; padding:10px; border: 1px solid gray; border-radius:10px;}
	#message-input{margin:5px; width:95%; border:0; height:30px; border-radius:10px; background-color: rgb(205, 206, 227);}
	#message-input:hover{background-color: rgb(119, 120, 146); color:white;}
</style>
</head>
<body>

	<div class="chat">
		<div class="room-header">
			 <div class="room-info">
			 		<span id="room-name">채팅방이름채팅방이름채팅방이름이</span>
			 		<span id="name-edit">✏️</span>
			 </div>
			 <div class="room-manage">
			 	<span id="member-count1">👩🏻‍🤝‍🧑🏻</span><span id="member-count2">(30)</span>
			 	<span id="member-add">➕</span>
			 	<span id="room-exit">🚪</span>
			 </div>
		</div>
		<script>
			$(function(){ // 채팅방이름이 15자를 초과할경우 이름조정
				if($("#room-name").text().length > 7){
					$("#room-name").text(($("#room-name").text().substring(0,7)).concat("..."));
				}
			})
		</script>
		
	    <div class="chat-area">
	    
	    	<div class="chat-user entry">
	           xxx님이 들어왔습니다
	        </div>
	        
	        <div class="chat-user exit">
	           xxx님이 나갔습니다
	        </div>    
	        
	        <div class="chat-message other">
	            <div class="icon"><img src="resources/common_images/businessman.png" default='resources/common_images/businessman.png'></div>
	            <div class="msg-wrap">
	            	<div class="user-info"><span class="user-job">사원</span> <span class="user-name">홍길동</span></div>
	            	<div class="textbox">안녕하세요. 반갑습니다.</div>
	            </div>
	            
	        </div>
	        <div class="chat-message mine">
	            <div class="icon"><img src="resources/common_images/businessman.png" default='resources/common_images/businessman.png' ></div>
	            <div class="textbox">안녕하세요. 친절한효자손입니다. 그동안 잘 지내셨어요?</div>
	        </div>
	        <div class="chat-message other">
	            <div class="icon"><img src="resources/common_images/businessman.png" default='resources/common_images/businessman.png' ></div>
	            <div class="msg-wrap">
	            	<div class="user-info"><span class="user-job">사원</span> <span class="user-name">홍길동</span></div>
	            	<div class="textbox">아유~ 너무요너무요! 요즘 어떻게 지내세요?</div>
	            </div>
	        </div>
	        
	        <div class="chat-user exit">
	           xxx님이 나갔습니다
	        </div>
	        
	        <div class="chat-message mine">
	            <div class="icon"><img src="resources/common_images/businessman.png" default='resources/common_images/businessman.png' ></div>
	            <div class="textbox">뭐~ 늘 똑같은 하루 하루를 보내는 중이에요. 코로나가 다시 극성이어서 모이지도 못하구 있군요 ㅠㅠ 얼른 좀 잠잠해졌으면 좋겠습니다요!</div>
	        </div>
	    </div>
	    
	    
	    
	    <div class="input-area">
            <textarea class="form-control" rows="4" id="message" style="resize:none"></textarea>
	        <button id="message-input">전송하기</button>
	    </div>
    </div>

    <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>  

</body>
</html>