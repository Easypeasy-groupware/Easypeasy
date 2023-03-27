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
	
	#newName{margin:0 5px 0 15px; height:25px; width:150px; padding:10px; border:0; border-bottom:1px solid gray;}
	
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
			 		<span id="room-name">
			 			<c:choose>
			 				<c:when test="${ empty room.roomName }">
			 					${ room.oneMember.empName }
			 				</c:when>
			 				<c:otherwise>
			 					${ room.roomName }
			 				</c:otherwise>
			 			</c:choose> 
					</span>
			 		<span id="name-edit">✏️</span>
			 		<input type="text" name="roomName" id="newName" style="display:none;">
			 		<span id="name-insert" style="display:none;" onclick="updateName();">✔️</span>
			 </div>
			 <div class="room-manage">
			 	<span id="member-count1">👩🏻‍🤝‍🧑🏻</span><span id="member-count2">(30)</span>
			 	<span id="member-add"ㄴㄴㄴ>➕</span>
			 	<span id="room-exit">🚪</span>
			 </div>
		</div>
		<script>
			$(function(){ // 채팅방이름이 15자를 초과할경우 이름조정
				if($("#room-name").text().trim().length > 7){
					$("#room-name").text(($("#room-name").text().substring(0,7)).concat("..."));
				}
			})
		</script>
		
	    <div class="chat-area">

	        <c:forEach var="msg" items="${ msg }">
	        	<c:if test="${ msg.chatType eq 'msg' }">
		        	<c:choose>
		        		<c:when test="${ msg.empNo eq loginUser.empNo }">
		        		
		        			<div class="chat-message mine">
					            <div class="icon"><img src="<c:out value='${msg.empProfile}' default='resources/chat-images/rockstar.png'/>" ></div>
					            <div class="textbox">${msg.message}</div>
					        </div>
					        
		        		</c:when>
		        		<c:otherwise>
		        		
		        			<div class="chat-message other">
					            <div class="icon"><img src="<c:out value='${msg.empProfile}' default='resources/chat-images/rockstar.png'/>"></div>
					            <div class="msg-wrap">
					            	<div class="user-info"><span class="user-name">${msg.empName}</span> <span class="user-job">${msg.jobName}</span></div>
					            	<div class="textbox">${msg.message}</div>
					            </div>
					        </div>
					        
		        		</c:otherwise>
		        	</c:choose>
	        	</c:if>
	        	<c:if test="${ msg.chatType eq 'title' }">
	        		<div class="chat-user">
			           방 이름이<b> ${msg.message}</b>로 변경되었습니다
			        </div>
	        	</c:if>
	        </c:forEach>
	        
	        
	       <!--  <div class="chat-user exit">
	           xxx님이 나갔습니다
	        </div> -->
	        
	        
	    </div>
	    
	    
	    
	    <div class="input-area">
            <textarea class="form-control" rows="4" id="message" style="resize:none"></textarea>
	        <button id="message-input" onclick="sendMessage();">전송하기</button>
	    </div>
    </div>

    <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>  
    <script>
    	
	    const sock = new SockJS("${pageContext.request.contextPath}/chat"); // * 웹소켓 서버와 연결됨(== 웹소켓 접속 => ChatEchoHandler 클래스의 afterConnectionEstablished메소드 실행됨)
	    sock.onopen = onOpen;
	    sock.onmessage = onMessage;
	    sock.onclose = onClose;
		
	    function onOpen() {
	    	
	    	const data = {
                    "roomNo" : "${ room.roomNo }",
                    "empNo" : "${ loginUser.empNo }",
                    "empName" : "${ loginUser.empName }",
                    "empProfile" : "${loginUser.empProfile}",
                    "jobName" : "${loginUser.jobName}",
                 	"message" : "ENTER-CHAT",
                 	"chatType" : "enter"
            };
	    	let jsonData = JSON.stringify(data);
	    	sock.send(jsonData);
            console.log("입장");
	    }
	    
	    
	    
	    
	    function sendMessage(){
	    	let msg = $("#message").val();

	    	if(msg != ""){
	    		
	    		const data = {
	    				"roomNo" : "${ room.roomNo }",
	    				"empNo" : "${ loginUser.empNo }",
	                    "empName" : "${ loginUser.empName }",
	                    "empProfile" : "${loginUser.empProfile}",
	                    "jobName" : "${loginUser.jobName}",
	                 	"message" : msg,
	                 	"chatType" : "msg"
	            };
	    		
	    		CheckMO(data); // 화면에 추가하기
	    		$("#message").val("");
	    		
	    		let jsonData = JSON.stringify(data);
	            sock.send(jsonData); 
	            
	    	}
	    }
	    
	 	// 추가 된 것이 내가 보낸 것인지, 상대방이 보낸 것인지 확인 후 추가
        function CheckMO(data) {
        	let newMsg = "";
        	
        	if(data.chatType == "msg"){
            // empNo가 loginSession의 empNo와 다르면 other, 같으면 mine
            const MO = (data.empNo != "${ loginUser.empNo }") ? "other" : "mine";
            
            
            if(MO == "mine"){
            	newMsg = '<div class="chat-message mine">'
            			+ '<div class="icon"><img src="' + data.empProfile + '" default="resources/chat-images/rockstar.png" ></div>'
            			+ '<div class="textbox">' + data.message + '</div></div>';
            }else if(MO == "other"){
            	newMsg = '<div class="chat-message other">'
		        			+ '<div class="icon"><img src="' + data.empProfile + '" default="resources/chat-images/rockstar.png" ></div>'
		        			+ ' <div class="msg-wrap"><div class="user-info">'
		        			+ ' <span class="user-name">' + data.empName + '</span>' 
		        			+ '<span class="user-job">' + data.jobName + '</span>' + '</div>'
		        			+ '<div class="textbox">' + data.message + '</div></div></div>';
            }
            
        	}else if(data.chatType == "title"){
        		newMsg = '<div class="chat-user">방 이름이 <b>' + data.message + '</b>로 변경되었습니다</div>';
        	}
        	
            $(".chat-area").append(newMsg);	
            $(".chat-area").scrollTop($(".chat-area").prop('scrollHeight'));

        }
	 	
	 	function onMessage(evt){ // 메세지수신
	 		let receive = evt.data.split(",");
	 		
	 		const data = {
	 				"empNo"   : receive[0],
                    "empName" : receive[1],
                    "jobName" : receive[2],
                 "empProfile" : receive[3],
                 "message" : receive[4],
                 "chatType" : receive[5]
            };
	 		
	 		if(data.empNo != "${ loginUser.empNo }"){
                CheckMO(data);
             }
	 		
	 	}
	 	
	 	function updateName(){
	 		let name = $("#newName").val();
	 		
	 		const data = {
	 				"roomNo" : "${ room.roomNo }",
    				"empNo" : "${ loginUser.empNo }",
                    "empName" : "${ loginUser.empName }",
                    "empProfile" : "${loginUser.empProfile}",
                    "jobName" : "${loginUser.jobName}",
                 	"message" : name,
                 	"chatType" : "title"
	 		}
	 		
	 		CheckMO(data);
	 		
	 		$("#name-edit").show();
	 		$("#room-name").text(name);
	 		$("#room-name").show();
	 		$("#newName").hide();
	 		$("#name-insert").hide();
	 		
	 		let jsonData = JSON.stringify(data);
            sock.send(jsonData); 
	 	}
    
    </script>
    
    <script>
    	$(function(){
    		$(".chat-area").scrollTop($(".chat-area").prop('scrollHeight')); // 스크롤바 항상 아래에
    		
    		$("#name-edit").click(function(){
    	 		$("#room-name").hide();
    	 		$(this).hide();
    	 		$("#newName").show();
    	 		$("#name-insert").show();
    	 		
    	 	})
    	 	
    	 	$("#message").keydown(function(key){ // 엔터키로 값 넘기기
    	 		if(key.keyCode == 13){
    	 			key.preventDefault();
    	 			sendMessage();
    	 			$("#message").val("");
    	 		}
    	 	})
    	 	
    		
    	})
    </script>

</body>
</html>