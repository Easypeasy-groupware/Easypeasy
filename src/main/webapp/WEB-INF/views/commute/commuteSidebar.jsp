<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
	*{padding:0; margin:0}
	.menubar{width:200px; background:white; float:left; border-right: 2px solid rgb(185, 187, 221); height: 1000px;}
	a{text-decoration:none; font-size:14px; color:black;}
	a:hover{font-weight:600; color:black;}
	li{list-style:none;}
	
	/*메뉴이름*/
	.menu-title{margin:20px 0 20px 0; text-align:center;}
	#title{font-size:20px; font-weight:600; color:rgb(93, 109, 75);}
	#title:hover{color:rgb(58, 69, 47); text-decoration:none;}
	

	.menu-btn{width:70%; height:35px; margin:auto; margin-bottom:15px; padding:5px 0 5px 0; background-color: rgb(142, 161, 122); border-radius:4px; text-align:center;}
	#menu-add-btn{color:white; text-decoration:none;}
	.menu-btn:hover{background-color: rgb(93, 105, 81);}
	

	.add-type{width:98%; height:35px; margin:auto; text-align:center; padding:5px 0 5px 0;}
	.add-type:hover{background-color: rgb(246, 246, 246); text-decoration:none;}
	.menu-a{text-decoration:none; font-size:14px; color:black;}
	.menu-a:hover{text-decoration:none; color:black;}
	

	.add-in, .add-ex{color:rgb(53, 62, 42);}
	.add-in:hover, .add-ex:hover{text-decoration:none; color:black;}
	.submenu{margin-left:30px;}
	.submenu > li {line-height: 20px;}
	.submenu a{text-decoration:none; font-size:14px; color:black;}
	.submenu a:hover{text-decoration:none; font-weight:600; color:black;}
	
	
	.menu-list{width:98%; height:35px; margin:auto; padding:5px 0 5px 42px; border-radius:4px;}
	.menu-list:hover{background-color: rgb(246, 246, 246); text-decoration:none;}

</style>
</head>
<body>


	<div class="menubar">

	

		

        <div class="menu-title">
            <a href="commute.ep" id="title"><img src="resources/common_images/commute.png" style="width:20px;"> 근태관리</a>
        </div>

		<div class="menu-btn">
            <a href="" id="menu-add-btn">인사계정</a>
        </div>
        <br>

        <div class="menu-type menu-list">
            <a href="working.ep" class="menu-a"><img src="resources/common_images/work-plan.png" style="width:15px;"> <b> 근무현황 및 계획 </b></a>
        </div>
        
        <br>
        
        <div class="menu-type menu-list">
        	<a href="vac.ep" class="menu-a"><img src="resources/common_images/vacation.png" style="width:15px;"> <b> 휴가 내역 </b></a>
        </div>

		
        
        
       <br>
    </div>
	

</body>
</html>