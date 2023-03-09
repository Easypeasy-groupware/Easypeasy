<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<style>
	*{padding:0;margin:0}
	.menubar{width:200px; position:fixed; background:white;}
	a{text-decoration:none; font-size:14px; color:black;}
	a:hover{font-weight:600; color:black;}
	li{list-style:none;}
	.menu-type{text-align:center;}
	
	/*메뉴이름*/
	.menu-title{margin:20px 0 20px 0;}
	#title{font-size:20px; font-weight:600; color:rgb(93, 109, 75);}
	#title:hover{color:rgb(58, 69, 47); text-decoration:none;}
	
	/*연락처추가버튼*/
	.menu-btn{width:70%; height:35px; margin:auto; margin-bottom:15px; padding:5px 0 5px 0; background-color: rgb(142, 161, 122); border-radius:4px;}
	#menu-add-btn{color:white; text-decoration:none;}
	.menu-btn:hover{background-color: rgb(93, 105, 81);}
	
	/*즐겨찾기*/
	.menu-like{width:70%; height:35px; margin:auto; margin-bottom:10px; padding:5px 0 5px 0; border-radius:4px; }
	.menu-like:hover{background-color: rgb(246, 246, 246);}
	#like-page{text-decoration:none; font-size:14px; color:black;}
	#like-page:hover{text-decoration:none;}
	
	/*주소록타입*/
	.add-type{width:98%; height:35px; margin:auto; text-align:center; padding:5px 0 5px 0;}
	.add-type:hover{background-color: rgb(246, 246, 246); text-decoration:none;}
	.add-type-a{text-decoration:none; font-size:14px; color:black;}
	.add-type-a:hover{text-decoration:none; color:black;}
	
	/*주소록 제목 리스트*/
	.add-in, .add-ex{color:rgb(53, 62, 42);}
	.add-in:hover, .add-ex:hover{text-decoration:none; color:black;}
	.submenu{margin-left:60px;}
	.submenu > li {line-height: 20px;}
	.submenu a{text-decoration:none; font-size:14px; color:black;}
	.submenu a:hover{text-decoration:none; font-weight:600; color:black;}
	
	/*휴지통*/
	.menu-trash{width:98%; height:35px; margin:auto; padding:5px 0 5px 0; border-radius:4px;}
	.menu-trash:hover{background-color: rgb(246, 246, 246); text-decoration:none;}
	#trash-a{text-decoration:none; font-size:14px; color:black;}
	#trash-a:hover{text-decoration:none; font-weight:600; color:black; }
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div class="menubar">

        <div class="menu-type menu-title">
            <a href="#" id="title"><img src="resources/common_images/phone-book.png" style="width:20px;"> 주소록</a>
        </div>

        <div class="menu-type menu-btn">
            <a href="newPs.add" id="menu-add-btn">연락처 추가</a>
        </div>

        <div class="menu-type menu-like">
            <a href="#" id="like-page">⭐ 즐겨찾기</a>
        </div>

        <div class="add-type">
            <a href="#" class="add-type-a">
                <img src="resources/common_images/add-ppl.png"> <b>개인주소록</b>
            </a>
        </div>
        <ul class="submenu">
            <li><a href="#">- friends</a></li>
            <li><a href="#">- 가족</a></li>
            <li><a href="#">- 이직용</a></li>
            <li><a href="#">- rrrrr</a></li>
        </ul>
    
        <br>

        <div class="add-type">
            <a href="#" class="add-type-a">
                <img src="resources/common_images/add-ppl.png"> <b>공유주소록</b>
            </a>
        </div>

        <div class="add-type">
            <a href="#" class="add-in"><b>사내주소록</b></a>
        </div>
        <ul class="submenu">
            <li><a href="#">- 경영지원팀</a></li>
            <li><a href="#">- 영업 1팀</a></li>
            <li><a href="#">- 영업 2팀</a></li>
            <li><a href="#">- 영업 3팀</a></li>
            <li><a href="#">- 인사팀</a></li>
        </ul>

        <br>

        <div class="add-type">
            <a href="#" class="add-ex"><b>외부주소록</b></a>
        </div>
        <ul class="submenu">
            <li><a href="">- 정이많은조</a></li>
            <li><a href="">- 어디서든일하조</a></li>
        </ul>
       
        <br>

        <div class="menu-type menu-trash">
            <a href="#" id="trash-a"><img src="resources/common_images/trashcan.png" style="width:15px;"> <b>휴지통</b></a>
        </div>
    </div>
</body>
</html>