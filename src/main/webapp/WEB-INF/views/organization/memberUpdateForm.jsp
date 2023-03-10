<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	/*board*/
  	.board {width: 1000px; float: right;}
  	container {margin: 20px auto; width: 100%; border: 1px solid #ccc; padding: 20px;}
	form {max-width: 1000px; margin: 0 auto; padding: 10px; border-radius: 5px; box-sizing: border-box;}
	h2 {padding:1% 1%;}
	label {display: block; margin-bottom: 5px; font-weight: bold;}
	input[type="text"],
	input[type="email"],
	input[type="date"],
	select {
		width: 100%;
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 3px;
		box-sizing: border-box;
		margin-bottom: 20px;
		font-size: 16px;
		font-family: inherit;
	}
	select {height: 40px;}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="wrapper">
		<div class="sidebar">
			<h4>게시판</h4><br>
			<div class="topbtn">
			  <button type="button" class="btn btn-success" id="topbtn" onclick="adminList();"> 관리자 </button>
			</div>
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
                <h2>사원정보 수정/삭제 폼</h2>
                <br>
            </cheader>
			<div class="container">
				<form action="update.org" method="POST">
					<br>
			        <label for="empNo">*사원번호:</label>
			            <input type="text" id="empNo" name="empNo" value="${o.empNo}" readonly><br>
			        <label for="empId">*아이디:</label>
			          <input type="text" id="empId" name="empId" value="${o.empId}" readonly><br>
					<label for="empName">*이름 :</label>
					    <input type="text" id="empName" name="empName" value="${o.empName}" readonly><br>
					<label>*직급</label>
			            <select name="jobCode" id="jobCode" >
				            <option value="J1" name="jobCode" id="J1">사원</option>
				            <option value="J2" name="jobCode" id="J2">대리</option>
				            <option value="J3" name="jobCode" id="J3">과장</option>
				            <option value="J4" name="jobCode" id="J4">부장</option>
				            <option value="J5" name="jobCode" id="J5">상무</option>
				            <option value="J6" name="jobCode" id="J6">대표</option>
			            </select>
			            <br>
			        <label>직무</label>
			            <select name="deptCode" id="deptCode" >
			                <option value="D1" name="deptCode" id="D1">인사관리부</option>
			                <option value="D2" name="deptCode" id="D2">경영관리부</option>
			                <option value="D3" name="deptCode" id="D3">영업1팀</option>
			                <option value="D4" name="deptCode" id="D4">영업2팀</option>
			                <option value="D5" name="deptCode" id="D5">영업3팀</option>
			                <option value="D6" name="deptCode" id="D6">마케팅부</option>
			            </select>
						<br><br>
					<label>입사일</label><br>
						<input type="date" id="hireDate" name="hireDate" value="${o.hireDate}" ><br>
					<label>이메일</label>
					    <input type="email" id="email" name="email" value="${o.email}"><br>
			        <br>
			        <label>근무 상태</label>&nbsp;&nbsp;: 
					    <input type="radio" id="N" name="entYn" value="N" checked>
					    <label for="N">근무</label> &nbsp;&nbsp;
					    <input type="radio" id="Y" name="entYn" value="Y">
					    <label for="Y">퇴사</label> <br>
					<label>퇴사일</label><br>
						<input type="date" id="entDate" name="entDate" value="" ><br>
					    
					
				<br><br>
				<div align="center">
					<button type="button" class="btn btn-secondary" onclick="javascript:history.go(-1);">이전으로</button>
					<button type="submit" class="btn btn-success">수정하기</button>
					<button type="button" class="btn btn-danger" onclick="location.href='deleteMember.org';">삭제하기</button>
				</div>
				
			</form>
		</div>
	</div>

</body>
</html>