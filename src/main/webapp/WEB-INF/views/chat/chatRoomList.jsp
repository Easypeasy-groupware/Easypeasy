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
    * {padding: 0; margin: 0; box-sizing: border-box;}
	a {text-decoration: none;}
	
	/*채팅방 헤더*/
	.chat-header{margin:10px; height:50px;}
	.chat-title{float:left; height:50px; line-height:50px; padding-left:10px; font-weight:600; width:85%;}
	.room-manage{float:left; height:50px; line-height:50px;}
	.room-manage span:hover{cursor:pointer; font-size:18px;}
	
	/*채팅방 리스트*/
	.list-area{height:480px; overflow-y:auto;}
	.list-area::-webkit-scrollbar{width:5px;}
	.list-area::-webkit-scrollbar-thumb{background-color:rgb(92, 95, 197); border-radius:10px;}
	.list-area::-webkit-scrollbar-track{background-color:white;}
	
	.indiv-list{
		height:70px; 
		padding:10px;
		border-top:1px solid lightgray;
	}
	.indiv-list:hover{background-color:lightgray;}
	
	.room-name{font-weight:600;}
	.member-count{font-size:13px; color:lightgray; line-height:0;}
	.last-chat{padding-top:5px;}
	.chat-content{padding:0 20px; font-size:13px;}
	.chat-hour{font-size:10px; color:lightgray;}
	
	/*검색*/
	.search-area{line-height:40px; background-color:white; text-align:center; display:none;}
	
	#searchRoom{border:0; padding:10px; border-bottom:1px solid black; width:80%; height:40px; margin-left:5px;}
	.search-area img:hover{cursor:pointer;}
	.search-area img{width:20px;}
</style>
</head>
<body>
	<audio id='audio_play' src='resources/chat-audioFiles/chat-alarm.mp3'></audio>
	<script type="text/javascript"> 
	function play() { 
	    var audio = document.getElementById('audio_play'); 
	    if (audio.paused) { 
	        audio.play(); 
	    }else{ 
	        audio.pause(); 
	        audio.currentTime = 0 
	    } 
	} 
	</script>

    <div class="chat">
        <div class="chat-header">
        	<div class="chat-title">
        		홍길동님의 채팅방
        	</div>
        	<div class="room-manage">
        		<span id="room-search">🔔</span>
        		<span id="room-add">➕</span>
        	</div>
        	
        	<div class="search-area">
        	<form action="" method="post">
        		<input type="hidden" name="">
        		<input type="text" id="searchRoom" name="roomName">
        		<a href="#"><img src="resources/common_images/search-icon.png"></a>
        	</form>
        	</div>
        </div>
        <script> 		
         	$("#room-search").click(function(){
         		if($(".search-area").css("display")=="none"){
         			$(".chat-header").css("height", "90px");
         			$(".list-area").css("height", "430px");
             		$(".search-area").show();	
         		}else {
         			$(".chat-header").css("height", "50px");
         			$(".list-area").css("height", "480px");
             		$(".search-area").hide();
         		}
        	})
        </script>
        
		<div class="list-area">
		
			<div class="indiv-list">
				<div class="room-info">
					<span class="room-name">채팅방1</span>
					<span class="member-count">6</span>
				</div>
				<div class="last-chat">
					<span class="chat-content">마지막 메세지 입니다마지막 메세지 입니다</span>
					<span class="chat-hour">9:35</span>
				</div>
			</div>
			
			<div class="indiv-list">
				<div class="room-info">
					<span class="room-name">채팅방2</span>
					<span class="member-count">6</span>
				</div>
				<div class="last-chat">
					<span class="chat-content">마지막 메세지 입니다</span>
					<span class="chat-hour">9:35</span>
				</div>
			</div>
			
			
			
		</div><!-- list-area끝 -->		
		
		
		<script>
			$(function(){
				$(".room-name").each(function(){
					if($(this).text().length > 15){
						$(this).text(($(this).text().substring(0,15)).concat("..."));
					}
				})
			})
		</script>
		
		
		
		
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
    
	
		<!-- 채팅 목록 관련 -->
   
        // 총 읽지 않은 갯수
        let countAll = 0;
        
        function getRoomList(){
            // 채팅 방 목록 가져오기
             $.ajax({
                url:"chatRoomList.do",
                data:{
                    empNo:"${loginUser.empNo}"
                },
                dataType:"json",
                async:false, // async : false를 줌으로써 비동기를 동기로 처리 할 수 있다.
                success:function(data){
                    
                    // 현재 로그인 된 User들
                    let loginList = "";
                      
                    // 로그인 된 User들을 가져온다.
                    $.ajax({
                        url:"chatSession.do",
                        data:{
                        },
                        async:false,
                        dataType:"json",
                        success:function(data){
                            for(var i = 0; i < data.length; i++){
                                loginList += data[i];
                            }
                        }
                    });
                      
                    $chatWrap = $(".chatList");
                    $chatWrap.html("");
                    
                    var $div;     // 1단계
                    var $img;     // 2단계
                    var $divs;     // 2단계
                    var $span;    // 2단계
                    
                    if(data.length > 0){
                        // 읽지 않은 메세지 초기화
                        countAll = 0;
                        
                        // 태그 동적 추가
                        for(var i in data){
                        
                            // 자신이 구매자 입장일 때
                            if(data[i].userEmail == "${loginUser.email}"){
                                // 현재 판매자가 로그인 상태 일 때
                                if(loginList.indexOf(data[i].masterEmail) != -1){
                                    $div = $("<div class='chatList_box enterRoomList' onclick='enterRoom(this);'>").attr("id",data[i].roomId).attr("email",data[i].masterEmail);
                                }
                                // 현재 판매자가 로그아웃 상태 일 때
                                else{
                                    $div = $("<div class='chatList_box2 enterRoomList' onclick='enterRoom(this);'>").attr("id",data[i].roomId).attr("email",data[i].masterEmail);
                                }
                                $img = $("<img class='profile_img'>").attr("src", "resources/masterImg/" + data[i].masterPic);
                                $divs = $("<div class='userNameId'>").text(data[i].masterName);
                            }
                            // 자신이 판매자 입장일 때
                            else{                        
                                // 현재 구매자가 로그인 상태 일 때
                                if(loginList.indexOf(data[i].userEmail) != -1){
                                    $div = $("<div class='chatList_box enterRoomList' onclick='enterRoom(this);'>").attr("id",data[i].roomId).attr("email",data[i].userEmail);
                                }
                                // 현재 구매자가 로그아웃 상태 일 때
                                else{
                                    $div = $("<div class='chatList_box2 enterRoomList' onclick='enterRoom(this);'>").attr("id",data[i].roomId).attr("email",data[i].userEmail);
                                }                                
                                $img = $("<img class='profile_img'>").attr("src", "resources/img/" + data[i].userPic);
                                $divs = $("<div class='userNameId'>").text(data[i].userName);
                            }
                            
                            // 읽지 않은 메세지가 0이 아닐 때
                            if(data[i].unReadCount != 0){
                                $span = $("<span class='notRead'>").text(data[i].unReadCount);
                            }else{
                                $span = $("<span>");
                            }
                            
                            $div.append($img);
                            $div.append($divs);
                            $div.append($span);
                            
                            $chatWrap.append($div);
                            
                            // String을 int로 바꿔주고 더해준다.
                            countAll += parseInt(data[i].unReadCount);
                        }
                    }
                }
            });
        }
        
        // 화면 로딩 된 후
        $(window).on('load', function(){
            
            // 2초에 한번씩 채팅 목록 불러오기(실시간 알림 전용)
            setInterval(function(){
                // 방 목록 불러오기
                getRoomList();
                
                // 읽지 않은 메세지 총 갯수가 0개가 아니면
                if(countAll != 0){
                    // 채팅 icon 깜빡거리기
                    $('.chatIcon').addClass('iconBlink');
                    play();
                }else{
                    // 깜빡거림 없애기
                    $('.chatIcon').removeClass('iconBlink');
                }
            },2000);
        });
    </script>
			
		
    </div>
    <jsp:include page="chatFooter.jsp"/>

</body>
</html>