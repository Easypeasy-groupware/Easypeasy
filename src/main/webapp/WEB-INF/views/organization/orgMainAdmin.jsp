<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 조직도 트리 -->
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<link rel="stylesheet" type="text/css" href="resources/org/jquery.treeview.css"/>
<link rel="stylesheet" type="text/css" href="resources/org/demo/screen.css"/>
	
<style>
  /* 전체 wrapper */
  .wrapper {width: 1200px;margin: 0 auto;}
  body {font-family: Arial, sans-serif;	margin: 0; padding: 0;}
  /* 사이드바 */
  .sidebar {top: 0; left: 0; width: 200px; height: 100%; float: left;}
  h4 {text-align: center;}
	#topbtn {align-items: center; justify-content: center; align:center; width:200px;}
	.menu {margin-top: 20px;}
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
  /* content */
  .board {width: 1000px; float: right;}
  .container {margin: 20px auto; width: 100%; border: 1px solid #ccc; padding: 20px;}
  form {max-width: 1000px; margin: 0 auto; padding: 10px; border-radius: 5px; box-sizing: border-box;}
  h2 {padding:1% 1%;}
	table {border-collapse: collapse; width: 100%;}
	tr {text-align: center;}
	th, td {text-align: center; padding: 8px; border-bottom: 1px solid #ccc;}
	th {background-color: #ddd;}
	tr:hover {background-color: #f5f5f5;}
  .search-container {display: flex; justify-content: flex-end;margin-bottom: 10px;}
  /* Modal styles */
    .modal {
      display: none; /* Hide modal by default */
      position: fixed; /* Position modal */
      z-index: 1; /* Make modal appear on top of other elements */
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.4); /* Add black background with opacity */
    }
    .modal-content {
      background-color: white;
      margin: 15% auto; /* 15% from the top and centered */
      padding: 20px;
      border: 1px solid #888;
      width: 500px; /* Could be more or less, depending on screen size */
    }
    .close {color: #aaa; float: right; font-size: 28px; font-weight: bold;}
    .close:hover, .close:focus {color: black; text-decoration: none; cursor: pointer;}
    
   /* 페이징바 */
    #paging{text-align: center; display: inline-block; padding-left :0;}
    #paging li {text-align: center; float: left; list-style:none; border-radius:10px; margin:2px; background-color: rgb(234, 234, 234);}
    #paging li a {display: block; font-size: 12px; color: black; padding: 5px 10px; box-sizing: border-box; text-decoration-line:none;}
    #paging li.on {background:rgb(166, 184, 145);}
    #paging li.on a { color: white;}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
        <div class="sidebar">
			<h4>게시판</h4><br>
	      
	        <button type="button" class="btn btn-success" id="topbtn" onclick="adminList();"> 관리자 </button>
	      
	      	<script>
	      		function adminList(){
	      			location.href="adminList.org";
	      		}
	      	</script>
	      
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
    

        <div class="board">
            <cheader>
                <br><br>
                <h2>조직도-관리자페이지</h2>
                <br>
            </cheader>
            <div class="container">
                <form>
                    <div class="search-container">
                            <button type="button" class="btn btn-secondary">검색</button>
                    </div>
                </form>
                <button type="button" class="btn btn-outline-success btn-sm" onclick="minsert();">등록</button>
                <button type="button" class="btn btn-outline-success btn-sm">설정</button>
                
                <script>
	                function minsert() {
	                	location.href="memberEnroll.org";
	                }
                </script>
                
                <br><br>
                <table>
                    <thead>
                        <tr>
                            <th>이름</th>
                            <th>사원번호</th>
                            <th>부서</th>
                            <th>직위</th>
                            <th>이메일</th>
                            <th>휴대폰</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>유재석</td>
                            <td>1</td>
                            <td>인사관리부</td>
                            <td>부장</td>
                            <td>user01@ezpz.com</td>
                            <td>010-1111-2222</td>
                            <td>근무</td>
                        </tr>
                        <tr>
                            <td>유재석</td>
                            <td>1</td>
                            <td>인사관리부</td>
                            <td>부장</td>
                            <td>user01@ezpz.com</td>
                            <td>010-1111-2222</td>
                            <td>근무</td>
                        </tr>
                        <tr>
                            <td>유재석</td>
                            <td>1</td>
                            <td>인사관리부</td>
                            <td>부장</td>
                            <td>user01@ezpz.com</td>
                            <td>010-1111-2222</td>
                            <td>근무</td>
                        </tr>
                        <tr>
                            <td>유재석</td>
                            <td>1</td>
                            <td>인사관리부</td>
                            <td>부장</td>
                            <td>user01@ezpz.com</td>
                            <td>010-1111-2222</td>
                            <td>근무</td>
                        </tr>
                        <tr>
                            <td>유재석</td>
                            <td>1</td>
                            <td>인사관리부</td>
                            <td>부장</td>
                            <td>user01@ezpz.com</td>
                            <td>010-1111-2222</td>
                            <td>근무</td>
                        </tr>
                        <tr>
                            <td>박명수</td>
                            <td>2</td>
                            <td>경영지원부</td>
                            <td>과장</td>
                            <td>user02@ezpz.com</td>
                            <td>010-3333-4444</td>
                            <td>근무</td>
                        </tr>
                        <tr>
                            <td>박명수</td>
                            <td>2</td>
                            <td>경영지원부</td>
                            <td>과장</td>
                            <td>user02@ezpz.com</td>
                            <td>010-3333-4444</td>
                            <td>근무</td>
                        </tr>
                        <tr>
                            <td>박명수</td>
                            <td>2</td>
                            <td>경영지원부</td>
                            <td>과장</td>
                            <td>user02@ezpz.com</td>
                            <td>010-3333-4444</td>
                            <td>근무</td>
                        </tr>
                        <tr>
                            <td>박명수</td>
                            <td>2</td>
                            <td>경영지원부</td>
                            <td>과장</td>
                            <td>user02@ezpz.com</td>
                            <td>010-3333-4444</td>
                            <td>근무</td>
                        </tr>
                        <tr>
                            <td>박명수</td>
                            <td>2</td>
                            <td>경영지원부</td>
                            <td>과장</td>
                            <td>user02@ezpz.com</td>
                            <td>010-3333-4444</td>
                            <td>근무</td>
                        </tr>
                    </tbody>
                </table>
                <br><br>
                <tfoot>
                     <div align="center">
			            <ul id="paging">
			                <li><a href=""> < </a></li>
			                <li class='on'><a href=""> 1 </a></li>
			                <li><a href=""> 2 </a></li>
			                <li><a href=""> 3 </a></li>
			                <li><a href=""> 4 </a></li>
			                <li><a href=""> 5 </a></li>
			                <li><a href=""> > </a></li>
			            </ul>
			        </div>
			        <script>
			            $(function(){
			                 $("#ps-tbody").on("click", "tr", function(){
			                     location.href = 'xxxxx.ad?no=' + $(this).children().eq(0).text(); 
			                 })
			            })
			        </script>
                </tfoot>
            </div>
        </div>
    </div>
</body>
</html>