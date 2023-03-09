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
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .wrap *{
        /*border:solid 1px black;*/
        box-sizing:border-box;
    }
    .wrap{width:1200px; margin:auto; box-sizing:border-box;}
    .header{position:fixed; top:0; background:white;}
    #header1{width:1200px; height:60px; background-color: white;} 
    #header2{width:1200px; height:40px; background-color:rgb(185, 187, 221)}

    /*header1영역*/
    #header1>div{float:left; height:100%;}
    #logoName{display:inline-block; font-size:30px; padding-left:20px; line-height: 60px;}
    #logoName:hover{cursor: pointer;}

    .icons{margin:0px 20px 0px 750px; display : inline-block; line-height: 60px;}
    .icons>img{display : inline-block; vertical-align: middle;}
    .icons>img:hover{cursor: pointer;}
    .chat-icon{margin-right:10px;}

    #empName{display:inline-block; font-size:13px; line-height: 60px;}


    /*프로필사진+드롭다운메뉴*/
    .dropdown-wrap{ 
        margin-left:10px; 
        display : inline-block;
        line-height: 60px;
    }
    .dropdown-wrap>img{
        border-radius: 50%;
        display : inline-block;
        vertical-align: middle;
    }
    .dropdown-wrap>img:hover{cursor: pointer;}
    .dropdown-menu{
        display: none;
        position : absolute;
        background-color: #f1f1f1;
    }
    .dropdown-item{
        text-decoration:none;
        color : black;
        padding : 12px 16px;
        display : block;
        width : 120px;
        height: 35px;
        text-align : center;
        line-height: 10px;
    }
    .dropdown-wrap:hover .dropdown-menu{ display : block; }
    .dropdown-item:hover{background: rgb(166, 184, 145); color:white; cursor: pointer;}
    

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

</style>
</head>
<body>

	<%-- 
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if> 
	--%>
	
    <div class="wrap">

    <div class="header">
        <div id="header1">

            <div id="logoName">EASY PEASY</div>
            <script>
           		$("#logoName").click(function(){
           			location.href="${pageContext.request.contextPath}";
           		})
            </script>
            
            <div class="icons">
                <!--채팅이 없을때-->
                <img src="resources/common_images/chat-no-alarm.png" class="chat-icon">
                <!--채팅이 있을때-->
                <!--<img src="resources/common_images/chat-si-alarm.png" class="chat-icon">-->

                <!--알람이 없을때-->
                <img src="resources/common_images/bell-no-alarm.png" class="alarm-icon">
                <!--알람이 있을때-->
                <!--<img src="resources/common_images/bell-si-alarm.png" class="alarm-icon">-->
            </div>
            <div id="empName">정형돈 과장님</div>
            <div class="dropdown-wrap">

                <img src="resources/common_images/default_profile.png" width="45px">

                <div class="dropdown-menu">
                    <a class="dropdown-item" href="">정보 수정</a>
                    <a class="dropdown-item" href="">로그아웃</a>
                </div>
            </div>

        </div>
        
        <div id="header2">

            <ul>
                <li><a href="">근태관리</a></li>
                <li><a href="list.ma">메일</a></li>
                <li><a href="main.ap">전자결재</a></li>
                <li><a href="">일정</a></li>
                <li><a href="">예약</a></li>
                <li><a href="">자료실</a></li>
                <li><a href="">게시판</a></li>
                <li><a href="">주소록</a></li>
                <li><a href="">조직도</a></li>
            </ul>

        </div>

    </div>
    
    <br claer="both">

    <div class="outer">
</body>
</html>