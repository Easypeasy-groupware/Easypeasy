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
	*{padding:0; margin:0}
	.menubar{width:200px; background:white; float:left;}
	a{text-decoration:none; font-size:14px; color:black;}
	a:hover{font-weight:600; color:black;}
	li{list-style:none;}
	
	/*메뉴이름*/
	.menu-title{margin:20px 0 20px 0; text-align:center;}
	#title{font-size:20px; font-weight:600; color:rgb(93, 109, 75);}
	#title:hover{color:rgb(58, 69, 47); text-decoration:none;}
	
	/*드롭다운이미지*/
	.dropdown-key:hover{cursor:pointer;}
	
	/*연락처추가버튼*/
	.menu-btn{width:70%; height:35px; margin:auto; margin-bottom:15px; padding:5px 0 5px 0; background-color: rgb(142, 161, 122); border-radius:4px; text-align:center;}
	#menu-add-btn{color:white; text-decoration:none;}
	.menu-btn:hover{background-color: rgb(93, 105, 81);}
	
	/*즐겨찾기*/
	.menu-like{width:70%; height:35px; margin:auto; margin-bottom:10px; padding:5px 0 5px 0; border-radius:4px;  text-align:center;}
	.menu-like:hover{background-color: rgb(246, 246, 246);}
	#like-page{text-decoration:none; font-size:14px; color:black; font-weight:600;}
	#like-page:hover{text-decoration:none; color:darkgreen;}
	
	/*주소록타입*/
	.add-type{width:98%; height:35px; margin:auto; text-align:center; padding:5px 0 5px 0;}
	.add-type:hover{background-color: rgb(246, 246, 246); text-decoration:none;}
	.menu-a{text-decoration:none; font-size:14px; color:black;}
	.menu-a:hover{text-decoration:none; color:black;}
	
	/*주소록 제목 리스트*/
	.add-in, .add-ex{color:rgb(53, 62, 42);}
	.add-in:hover, .add-ex:hover{text-decoration:none; color:black;}
	.submenu{margin-left:30px;}
	.submenu > li {line-height: 20px;}
	.submenu a{text-decoration:none; font-size:14px; color:black;}
	.submenu a:hover{text-decoration:none; font-weight:600; color:black;}
	
	/*휴지통*/
	.menu-list{width:98%; height:35px; margin:auto; padding:5px 0 5px 42px; border-radius:4px;}
	.menu-list:hover{background-color: rgb(246, 246, 246); text-decoration:none;}
	/*#trash-a{text-decoration:none; font-size:14px; color:black;}
	#trash-a:hover{text-decoration:none; color:black; }*/
	
	/*그룹설정*/
	.menu-setting{width:98%; height:35px; margin:auto; padding:5px 0 5px 0; border-radius:4px;}
	.menu-setting:hover{background-color: rgb(246, 246, 246); text-decoration:none;}
	
	/*관리자 설정*/
	.admin-setting{}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div class="menubar">

        <div class="menu-title">
            <a href="favorite.add" id="title"><img src="resources/common_images/phone-book.png" style="width:20px;"> 주소록</a>
        </div>

        <div class="menu-btn">
            <a href="newPs.add" id="menu-add-btn">연락처 추가</a>
        </div>

        <div class="menu-like">
            <a href="#" id="like-page">⭐ 즐겨찾기</a>
        </div>

        <div class="add-type">
            <a href="psAll.add" class="menu-a">
                <img src="resources/common_images/add-ppl.png"> <b>개인주소록</b>
            </a>
            <span><img src="resources/common_images/list-down.png" style="width:15px;" class="dropdown-key" id="pslist-key"></span>
        </div>
        <ul class="submenu" id="pslist" style="display:none;">
        	<c:forEach var="p" items="${ pList }">
        		<li><a href="psGroup.add?group=${ p.groupName }">- ${ p.groupName } </a></li>
        	</c:forEach>
        	<li><a href="psGroup.add?group=etc">- 기타 </a></li>
        </ul>
    
        <br>

        <div class="add-type">
            <a href="#" class="menu-a">
                <img src="resources/common_images/add-ppl.png"> <b>공유주소록</b>
            </a>
            <span><img src="resources/common_images/list-down.png" style="width:15px;" class="dropdown-key" id="shlist-key"></span>
        </div>

        <div class="add-type" id="add-in" style="display:none;">
            <a href="internalEnt.add" class="add-in"><b>사내주소록</b></a>
            <span><img src="resources/common_images/list-down.png" style="width:15px;" class="dropdown-key" id="inlist-key"></span>
        </div>
        <ul class="submenu" id="inlist" style="display:none;">
        	<li><a href="internalDept.add?dept=hr">- 인사관리팀</a></li>
            <li><a href="internalDept.add?dept=as">- 경영지원팀</a></li>
            <li><a href="internalDept.add?dept=sales1">- 영업 1팀</a></li>
            <li><a href="internalDept.add?dept=sales2">- 영업 2팀</a></li>
            <li><a href="internalDept.add?dept=sales3">- 영업 3팀</a></li>
            <li><a href="internalDept.add?dept=marketing">- 마케팅팀</a></li>
        </ul>



        <div class="add-type" id="add-ex"  style="display:none;">
            <a href="externalEnt.add" class="add-ex"><b>외부주소록</b></a>
            <span><img src="resources/common_images/list-down.png" style="width:15px;" class="dropdown-key" id="exlist-key"></span>
        </div>
        <ul class="submenu" id="exlist" style="display:none;">
            <c:forEach var="s" items="${ sList }">
        		<li><a href="externalGroup.add?group=${ s.groupName }">- ${ s.groupName } </a></li>
        	</c:forEach>
        	<li><a href="externalGroup.add?group=etc">- 기타 </a></li>
        </ul>
       
        <br>

        <div class="menu-type menu-list">
            <a href="#" class="menu-a"><img src="resources/common_images/trashcan.png" style="width:15px;"> <b> 휴지통 </b></a>
        </div>
        
        <br>
        
        <div class="menu-type menu-list">
        	<a href="#" class="menu-a"><img src="resources/common_images/group-setting.png" style="width:15px;"> <b> 그룹 설정 </b></a>
        </div>
        
        
       <br>
       
        <div class="menu-type menu-list">
        	<a href="#" class="menu-a"><img src="resources/common_images/admin-setting.png" style="width:15px; color:orange;"> <b> 그룹 관리 </b></a>
        </div>
    </div>
    
    <script>
    	$(function(){
    		$("#pslist-key").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#pslist").show();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#pslist").hide();
    			}
    		})
    		
    		$("#shlist-key").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#add-in").show();
    				$("#add-ex").show();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#inlist-key").attr("src", "resources/common_images/list-down.png");
    				$("#exlist-key").attr("src", "resources/common_images/list-down.png");
    				$("#add-in").hide();
    				$("#add-ex").hide();
    				$("#inlist").hide();
    				$("#exlist").hide();
    			}
    		})
    		
    		$('#inlist-key').on("click", $('#inlist-key'), function(){
    			
	   			if($(this).attr("src") === "resources/common_images/list-down.png"){
	   				$(this).attr("src", "resources/common_images/list-up.png");	
	   				$("#inlist").show();
	   			}else {
	   				$(this).attr("src", "resources/common_images/list-down.png");
	   				$("#inlist").hide();
	   			}
    		}) 
    		
			$('#exlist-key').on("click", $('#exlist-key'), function(){
    			
	   			if($(this).attr("src") === "resources/common_images/list-down.png"){
	   				$(this).attr("src", "resources/common_images/list-up.png");	
	   				$("#exlist").show();
	   			}else {
	   				$(this).attr("src", "resources/common_images/list-down.png");
	   				$("#exlist").hide();
	   			}
    		}) 
    		
    		

    		
    	})
    </script>
</body>
</html>