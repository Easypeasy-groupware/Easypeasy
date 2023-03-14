<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<!-- Bootstrap 5.2.3 Version -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 달력 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"></script>
<style>
	*{padding:0; margin:0}
	.menubar{width:200px; background:white; float:left;}
	a{text-decoration:none; font-size:14px; color:black;}
	a:hover{font-weight:600; color:black;}
	li{list-style:none;}
	
	/*메뉴이름*/
	.menu-title{margin:10px 0 20px 0; text-align:center;}
	#title{font-size:20px; font-weight:600; color:rgb(93, 109, 75);}
	#title:hover{color:rgb(58, 69, 47); text-decoration:none;}
	
	/*드롭다운이미지*/
	.dropdown-key:hover{cursor:pointer;}
	
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
	
	/* 예약관리 */
	.menu-list{width:98%; height:35px; margin:auto; padding:5px 0 15px 50px; border-radius:4px;}
	.menu-list:hover{background-color: rgb(246, 246, 246); text-decoration:none;}

</style>
</head>
<body>

	<div class="menubar">

        <div class="menu-title">
            <a href="main.re" id="title"><img src="resources/common_images/re-logo.png" style="width:20px;">  예약</a>
        </div>
        
        <div class="add-type">
            <a href="#" class="menu-a">
                <b>전사자산</b>
            </a>
            <span><img src="resources/common_images/list-down.png" style="width:15px;" class="dropdown-key" id="shlist-key"></span>
        </div>

        <div class="add-type" id="add-in" style="display:none;">
            <a href="internalEnt.add" class="add-in"><b>회의실</b></a>
            <span><img src="resources/common_images/list-down.png" style="width:15px;" class="dropdown-key" id="inlist-key"></span>
        </div>
        <ul class="submenu" id="inlist" style="display:none;">
        	<c:forEach var="r" items="${ list }">
        		<li><a href="internalDept.add?dept=hr">- ${ r.resourceName }</a></li>
            </c:forEach>
        </ul>

        <div class="add-type" id="add-ex"  style="display:none;">
            <a href="externalEnt.add" class="add-ex"><b>빔프로젝터</b></a>
            <span><img src="resources/common_images/list-down.png" style="width:15px;" class="dropdown-key" id="exlist-key"></span>
        </div>
        <ul class="submenu" id="exlist" style="display:none;">
            <c:forEach var="s" items="">
        		<li><a href="externalGroup.add?group=">- jstl </a></li>
        	</c:forEach>
        </ul>
       
        <br>
        <!-- 경영지원팀만 수정 할 수 있도록 -->
        <c:if test="${ loginUser.deptCode eq 'D2' }">
	        <div class="menu-list">
	            <a href="#" class="menu-a">
	                <img src="resources/common_images/admin-setting.png" style="width:15px; color:orange;"> <b>예약 관리</b>
	            </a>
	            <span><img src="resources/common_images/list-down.png" style="width:15px;" class="dropdown-key" id="setting-key"></span>
	        </div>
	        
	        <div class="add-type" id="setting-in" style="display:none;">
            	<a href="settingMettingRoomView.re" class="add-in" style="margin-left: -15px"><b> 자산 관리</b></a>
            </div>
        </c:if>
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
    		
    		$("#setting-key").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#setting-in").show();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#setting-in").hide();
    			}
    		})
    		
    	})
    </script>
	
</body>
</html>