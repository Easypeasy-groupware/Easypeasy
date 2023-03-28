<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 사이드바 */
 	.sidebar {top: 0; left: 0; width: 200px; height:1000px; float: left; border-right: 2px solid rgb(185, 187, 221);}
 	h4 {text-align: center;}
 	.sidebar a{text-decoration:none; font-size:14px; color:black;}
	.sidebar a:hover{text-decoration:none; font-weight:600; color:black;}
	.sidebar li{list-style:none;}
  	.menu-btn{width:70%; height:35px; margin:auto; margin-bottom:15px; padding:5px 0 5px 0; background-color: rgb(142, 161, 122); border-radius:4px; text-align:center;}
	#menu-add-btn{color:white; text-decoration:none;}
	.menu-btn:hover{background-color: rgb(93, 105, 81);}
	.menu-title{margin:20px 0 20px 0; text-align:center;}
	#title{font-size:20px; font-weight:600; color:rgb(93, 109, 75);}
	#title:hover{color:rgb(58, 69, 47); text-decoration:none;}
	
	.menu ul {list-style: none; padding: 0; margin: 0;}
	.menu li {margin-bottom: 5px; text-align: center; }
	.menu a {display: block; padding: 10px; color: #333; text-decoration: none; transition: background-color 0.3s ease-in-out;}
	.menu a:hover {background-color: #f2f2f2;}
	.active {background-color: #f2f2f2;}
</style>
</head>
<body>
	 <div class="sidebar">
	 
	    	<div class="menu-title">
				<a href="list.org" id="title" class="menu-a">조직도</a>
			</div>
			
	    	<c:if test="${ loginUser.deptCode eq 'D1' }">
	    		<div class="menu-btn">
		            <a href="adminList.org" id="menu-add-btn">관리자</a>
		        </div>
	        </c:if>
	      
	      <div class="menu">
	        <ul>
	        <%-- 
	          <li><a href="list.org">인사관리부</a></li>
	          <li><a href="list_d2.org">경영지원부</a></li>
	          <li><a href="list_d3.org">영업 1팀</a></li>
	          <li><a href="list_d4.org">영업 2팀</a></li>
	          <li><a href="list_d5.org">영업 3팀</a></li>
	          <li><a href="list_d6.org">마케팅부</a></li>
	          --%>
	          
	        </ul>
	      </div>
	  </div>
  
</body>
</html>