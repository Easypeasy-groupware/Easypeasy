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
	.menubar{width:200px; background:white; float:left; border-right: 2px solid rgb(185, 187, 221); height: 900px;}
	a{text-decoration:none; color:black;}
	a:hover{font-weight:600; color:black;}
	li{list-style:none;}
	
	/*일정등록버튼*/
	.menu-btn{width:70%; height:35px; margin:auto; margin-bottom:15px; padding:5px 0 5px 0; background-color: rgb(142, 161, 122); border-radius:4px; text-align:center;}
	#menu-add-btn{color:white; text-decoration:none;}
	.menu-btn:hover{background-color: rgb(93, 105, 81);}
	
	/*메뉴이름*/
	.menu-title{margin:10px 0 20px 0; text-align:center;}
	#title{font-size:20px; font-weight:600; color:rgb(93, 109, 75);}
	#title:hover{color:rgb(58, 69, 47); text-decoration:none;}
	
	/*드롭다운이미지*/
	.dropdown-key:hover{cursor:pointer;}
	
	/*타입*/
	.add-type{width:98%; height:35px; margin:auto; text-align:center; padding:5px 0 5px 0;}
	.add-type:hover{background-color: rgb(246, 246, 246); text-decoration:none;}
	.menu-a{text-decoration:none; font-size:14px; color:black;}
	.menu-a b{font-size:15px;}
	.menu-a:hover{text-decoration:none; color:black;}
	
	#add_calendar{width:98%; height:35px; margin:auto; text-align:center; padding:5px 10px 3px 0;}
	.checkbox-company{width:98%; height:35px; margin:auto; text-align:center; padding:5px 0 3px 30px;}
	#calList-in{height:35px; text-align:center;}
	
	/*제목 리스트*/
	.add-in, .add-ex{color:rgb(53, 62, 42);}
	.add-in:hover, .add-ex:hover{text-decoration:none; color:black;}
	.add-in b{font-size:15px;}
	.add-ex b{font-size:15px;}
	.submenu{margin-left:30px;}
	.submenu > li {line-height: 20px;}
	.submenu a{text-decoration:none; font-size:14px; color:black;}
	.submenu a:hover{text-decoration:none; font-weight:600; color:black;}
	
	/* 예약관리 */
	.menu-list{width:98%; height:35px; margin:auto; padding:5px 0 15px 50px; border-radius:4px;}
	.menu-list:hover{background-color: rgb(246, 246, 246); text-decoration:none;}



	#add_calendar{
		cursor: pointer;
	}
	#add_calendar_view {
	    width: 300px;
	    height: 300px;
	    padding-top: 15px;
	    position: absolute;
	    top: 280px;
	    left: 20px;
	    border-radius: 10px;
	    border: 1px solid rgb(185, 187, 221);
	    background: white;
	    z-index: 10;
	    display: none;
	}

</style>
</head>
<body>

	<div class="menubar">

        <div class="menu-title">
            <a href="main.sc" id="title"><img src="resources/common_images/sc-logo.png" style="width:20px;">  일정</a>
        </div>
        
        <div class="menu-btn">
            <a href="enrollForm.sc" id="menu-add-btn">일정 등록</a>
        </div>
        
        <div class="add-type">
            <a href="#" class="menu-a">
                <b>내 캘린더</b>
            </a>
            <span><img src="resources/common_images/list-up.png" style="width:15px;" class="dropdown-key" id="calList-key"></span>
        </div>

        <div id="calList-in">
        	<c:forEach var="c" items="${ myCalList }">
        		<c:choose>
           			<c:when test="${ c.calDefault eq 'Y' }">
           				<div class="custom-checkbox" style="display: inline-block; width: 190px; text-align: left;">
				            <input type="checkbox" class="inputCheck" name="scCompany" id="defaultY" style="accent-color: ${ c.calColor }; width: 15px; height: 15px;">
				            <label class="control-label" for="defaultY">(기본) ${ c.calTitle }</label>
		        			<input type="hidden" id="defaultCheckNo" value="${ c.calNo }">
		        		</div>
           			</c:when>
           			<c:otherwise>
           				<div class="custom-checkbox" style="display: inline-block; width: 190px; text-align: left;">
				            <input type="checkbox" class="inputCheck" name="scCompany" id="${ c.calNo }" style="accent-color: ${ c.calColor }; width: 15px; height: 15px;">
				            <label class="control-label" for="${ c.calNo }">${ c.calTitle }</label>
				            <input type="hidden" class="calNo" value="${ c.calNo }">
		        		</div>
           			</c:otherwise>
           		</c:choose>
        		
        	</c:forEach>
        </div>
        <br><br><br><br>
        
        <div id="add_calendar"> + 내 캘린더 추가</div>

        <!-- 캘린더 추가 화면 -->
        <form id="add_calendar_view" action="insert.cal" method="POST">
        	<div><b style="line-height: 50px; font-size: 20px; color: grey; margin-left: 28px;">내 캘린더 추가</b></div>
            <br>
            <div style="width: 80%; margin: auto;">
                <b style="color: rgb(80, 80, 80); margin-bottom: 3px;">추가할 일정 이름을 입력해주세요</b>
                <input type="text" name="calTitle" style="width: 100%; margin-top: 5px; box-sizing: border-box;">
            </div>
           	<br>
           	<div style="width: 80%; margin: auto;">
                <b style="color: rgb(80, 80, 80); margin-bottom: 3px;">일정 색상을 선택해주세요</b><br>
                <input type="color" name="calColor" style="width: 20%; margin-top: 5px; box-sizing: border-box;">
            </div>
           	<br>
            <div style="width: 100%; text-align: center;">
                <button class="btn btn-sm btn-light" style="background: rgb(214, 223, 204); color: white;">추가</button>
                <button class="btn btn-sm btn-light" id="close" type="button">취소</button>
            </div>
            <input type="hidden" name="empNo" value="${loginUser.empNo}">
        </form>

        <script>
            // 캘린더 추가 화면
            $("#add_calendar").click(function(){
            	$("#add_calendar_view").css("display", "block");
            })
            
            $("#close").click(function(){
            	$("#add_calendar_view").css("display", "none");
            })
        </script>
        
        <!-- 
        <div class="custom-control custom-checkbox checkbox-company" style="display: inline-block; margin-left: -23px;">
            <input type="checkbox" class="custom-control-input inputCheck" name="scCompany" id="side-company">
            <label class="custom-control-label" for="side-company">전사 일정</label>
            <input type="hidden" class="calNo" value="0">
        </div>
        -->

        <br>
        <div class="menu-list">
           <a href="setting.sc" class="menu-a">
               <img src="resources/common_images/admin-setting.png" style="width:15px; color:orange;"> <b>일정 관리</b>
           </a>
       	</div>
     
    </div>
    
    <script>
    
    	$("#defaultY").prop("checked", true);
    	
    	
    	
    
    	$(function(){
    		
    		
    		$("#calList-key").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-up.png"){
    				$(this).attr("src", "resources/common_images/list-down.png");	
    				$("#calList-in").hide();
    			}else {
    				$(this).attr("src", "resources/common_images/list-up.png");
    				$("#calList-in").show();
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