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
  	/* .tbtn {align-items: center; justify-content: center; align:center; width:200px;} */
	#topbtn{width:100%; height:35px; margin:auto; margin-bottom:15px; padding:5px 0 5px 0; background-color: rgb(142, 161, 122); border-radius:4px; text-align:center; justify-content: center;}
  	
  
	.menu-title{margin:20px 0 20px 0; text-align:center;}
	#title{font-size:20px; font-weight:600; color:rgb(93, 109, 75);}
	#title:hover{color:rgb(58, 69, 47); text-decoration:none;}
	
	.menu ul {list-style: none; padding: 0; margin: 0;}
	.menu li {margin-bottom: 5px; text-align: center; }
	.menu a {display: block; padding: 10px; color: #333; text-decoration: none; transition: background-color 0.3s ease-in-out;}
	.menu a:hover {background-color: #f2f2f2;}
	.submenu ul {list-style: none; padding: 0; margin: 0;	display: none;}
	.submenu li {margin-bottom: 5px;}
	.submenu a {display: block;padding: 10px;color: #333;text-decoration: none;transition: background-color 0.3s ease-in-out;}
	.submenu a:hover {background-color: #f2f2f2;}
	.active {background-color: #f2f2f2;}
	.collapse-indicator:after {content: " ∨";}
	.submenu.active > .collapse-indicator:after {content: " ∧";}
</style>
</head>
<body>
	 <div class="sidebar">
	    	<div class="menu-title">
				<a href="" id="title">조직도</a>
			</div>
	    	
	    	<button type="button" class="btn btn-success" id="topbtn" onclick="location.href='adminList.org';"> 관리자 </button>
	        
	      
	      <div class="menu">
	        <ul>
	          <li><a href="#">인사관리부</a></li>
	          <li><a href="#">경영지원부</a></li>
	          <li class="submenu">
	          	 <a href="#" class="dep1">영업부<span class="collapse-indicator"></span></a>
	                 <ul>
	                      <li><a href="#">- 영업 1팀</a></li>
	                      <li><a href="#">- 영업 2팀</a></li>
	              		  <li><a href="#">- 영업 3팀</a></li>
	                 </ul>
	          </li>   
	          <li><a href="#">마케팅부</a></li>
	        </ul>
	      </div>
	  </div>
  
	    <script>
            $(document).ready(function(){
                $('.dep1').click(function(){
                    $(this).next().toggle();
                });
            });
        </script>
</body>
</html>