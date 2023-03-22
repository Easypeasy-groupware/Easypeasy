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
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>

<!-- Alertify JavaScript -->
<!-- <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script> -->

<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>

<!--Bootstrap 5.3.0-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
<style>
    .wrap *{
        /*border:solid 1px black;*/
        box-sizing:border-box;
    }
    .wrap{width:1200px; margin:auto; box-sizing:border-box;}
    .header{position:fixed; top:0; background:white; z-index: 1;}
    #header1{width:1200px; height:60px; background-color: white;} 
    #header2{width:1200px; height:40px; background-color:rgb(185, 187, 221);}

    /*header1영역*/
    #header1>div{float:left; height:100%;}
    
    /*로고*/
    #logoName{top:0; height:80px;}
    .logo-img{display:inline-block; padding:0; padding-left:20px; height:75px; margin:0;}
    .logo-img:hover{cursor: pointer;}

    /*채팅&알람*/
    .icons{margin-left:550px; display:inline-block; line-height:60px;}
    .icons img{display : inline-block; vertical-align: middle; width:30px;}
    .icons>a{text-decoration: none; color:white;}
    .icons>a:hover{cursor: pointer; text-decoration: none;}
    #alarm-a{margin:0 20px 0 20px;}
    .websk-num{width:30px; height:15px; font-size:x-small;}

	/*사용자이름*/
    #empName{display:inline-block; font-size:13px; line-height: 60px;}
	#user-name{font-weight:600;}

    /*프로필사진, 로그아웃&마이페이지*/
    .image-effect-slide-pop-up{ width: 160px; height: 80px; overflow: hidden; position: relative; margin: 0 auto;}
	.image-layer{position: absolute; bottom: 0; height: 60px; -webkit-transition: 0.2s 0.4s; transition: 0.2s 0.4s;}
	.image-effect-slide-pop-up:hover .image-layer{-webkit-transition: 0.2s 0s; transition: 0.2s 0s; -webkit-transform: translateX(-120px); transform: translateX(-120px);}

	#profile-img{top:10px; left:10px; border-radius:50%; position: relative; z-index: 5; margin:auto;}

	.share-button {position: absolute; display: block; text-decoration: none; padding: 0; width: 70px; height: 30px; border-radius: 10px;
		line-height: 30px; font-size: 10px; text-align: center; bottom: 15px; right:0; opacity: 0; z-index: 2;}

	.image-effect-slide-pop-up:hover .myPage-btn {opacity: 1; -webkit-transform: translateX(-80px); transform: translateX(-80px);}
    .image-effect-slide-pop-up:hover .logout-btn {opacity: 1; -webkit-transform: translateX(0px); transform: translateX(0px); }
	.image-effect-slide-pop-up .myPage-btn{left :200px; -webkit-transition: 0.2s 0.3s; transition: 0.2s 0.3s;}
	.image-effect-slide-pop-up .logout-btn{left:170px; -webkit-transition: 0.2s 0.3s; transition: 0.2s 0.2s;}
	.image-effect-slide-pop-up:hover .myPage-btn {-webkit-transition: 0.2s 0.1s; transition: 0.2s 0.1s;}
	.image-effect-slide-pop-up:hover .logout-btn {-webkit-transition: 0.4s 0.4s; transition: 0.2s 0.1s;}
    

    /*header2영역*/
    #header2 li{
        list-style:none;
        width: 11%; 
        float: left;
        text-align: center;
        line-height: 40px;
    }
    #header2 a{text-decoration:none; color:white;}
    #header2 a:hover{font-weight: 600;}

    /**/
    .outer{margin-top:100px; padding-top:15px;}
    
	/*스크롤*/
	body::-webkit-scrollbar{width:20px;}
	body::-webkit-scrollbar-thumb{background-color:rgb(185, 187, 221); border-radius:10px;}
	body::-webkit-scrollbar-track{background-color:white;}

    
</style>
</head>
<body>

	
	<c:if test="${ not empty successMsg }">
		<script>
			swal('${successMsg.title}', "${successMsg.content}", "success");
		</script>
		<c:remove var="successMsg" scope="session"/>
	</c:if>
	
	<c:if test="${ not empty failMsg }">
		<script>
			swal('${failMsg.title}', "${failMsg.content}", "error");
		</script>
		<c:remove var="failMsg" scope="session"/>
	</c:if>
	 
	
    <div class="wrap">

    <div class="header">
        <div id="header1">

            <div id="logoName">
             <img src="resources/common_images/header-logo.png" class="logo-img"> 
            </div>
            <script>
           		$(".logo-img").click(function(){
           			location.href="main.ep";
           		})
            </script>
            
		   
            
            <div class="icons">
                <a href="javascript:openWindowPop('viewChatSample.ch', 'popup');" class="position-relative" id="chat-a">
                    <img src="resources/common_images/comments.png" class="chat-icon"> 
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger websk-num">
                        99+
                    </span>
                </a>

                <a class="position-relative alarm_toggle" id="alarm-a">
                    <img src="resources/common_images/bell.png" class="alarm-icon"> 
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill text-bg-danger websk-num">
                        99+
                    </span>
                </a>
            </div>
			<script>
				function openWindowPop(url, name){
					var options = 'top=500, left=1000, width=500, height=600, status=no, menubar=no, toolbar=no, titlebar=no, resizable=no scrollbars=yes';
					window.open(url, name, options);
				}
			</script>
            

           	<div id="empName"><span id="user-name">${ loginUser.empName }</span> ${ loginUser.jobName }님</div>

            <div class="image-effect-slide-pop-up">
                <div class="image-layer">
                    <img src="<c:out value='${ loginUser.empProfile }' default='resources/common_images/businessman.png' />" id="profile-img" width="45px">
        
                    <a href="myPage.ep" class="share-button myPage-btn">
                        <img src="resources/common_images/note.png" width="30px" class="sub-image">
                    </a>
        
                    <a href="logout.ep" class="share-button logout-btn">
                        <img src="resources/common_images/logout-door.png" width="28px" class="sub-image">
                    </a>
                </div>
            </div>
        </div>
        
        <div id="header2">

            <ul>
                <li><a href="commute.ep">근태관리</a></li>
                <li><a href="list.ma">메일</a></li>
                <li><a href="main.ap">전자결재</a></li>
                <li><a href="main.sc">일정</a></li>
                
                <li><a href="main.re">예약</a></li>
                <li><a href="list.db">자료실</a></li>
                <li><a href="list.bo">게시판</a></li>
                <li><a href="favorite.add">주소록</a></li>
                <li><a href="list.org">조직도</a></li>
            </ul>

        </div>

    </div>
    
    <br claer="both">

    <div class="outer">
</body>
</html>
	