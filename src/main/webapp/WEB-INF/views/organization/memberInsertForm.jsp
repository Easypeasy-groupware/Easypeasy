<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	/* content*/
	.board {width: 1000px; float: right;}
  	.container {margin: 20px auto; width: 100%; border: 1px solid #ccc; padding: 20px;}
	form {max-width: 600px; margin: 0 auto; padding: 20px; border-radius: 5px; box-sizing: border-box;}
	h2 {margin-top: 0; font-size: 28px; font-weight: normal; text-align: center;}
	label {display: inline-block; margin-bottom: 5px; font-weight: bold;}
	input[type="text"],
	input[type="email"],
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
		
		</div>
		
		<div class="board">
			<h2>사원 등록 폼</h2>
			
			<div class="container">
				<form action="insert.org" method="POST">
					<br>
			        <label for="empNo">*사원번호:</label>
			            <input type="text" id="empNo" name="empNo" required /><br />
			        <label for="username">*아이디:</label>
			          <input type="text" id="empId" name="empId"  required/><br />
			        <label for="password">*비밀번호:</label>
			            <input type="text" id="empPwd" name="empPwd" placeholder="초기 비밀번호는 1234입니다." required/><br />
					<label>*이름</label>
					    <input type="text" id="empName" name="empName" required>
					<label>*직급</label>
			            <select name="jobCode" id="jobCode" >
			                <option value="">선택하세요</option>
			                <option value="대표이사">J6</option>
			                <option value="전무이사">J5</option>
			                <option value="부장">J4</option>
			                <option value="과장">J3</option>
			                <option value="대리">J2</option>
			                <option value="사원">J1</option>
			            </select>
			        <label>*직무</label>
			            <select name="deptCode" id="deptCode" >
			                <option value="">선택하세요</option>
			                <option value="">인사관리부</option>
			                <option value="">경영관리부</option>
			                <option value="">영업1팀</option>
			                <option value="">영업2팀</option>
			                <option value="">영업3팀</option>
			                <option value="">마케팅부</option>
			            </select>
			
					<label>연락처</label>
					    <input type="text" id="phone" name="phone" >
					<label>이메일</label>
					    <input type="email" id="email" name="email">
			        
			         <label for="address">주소:</label>
			            <input type="text" id="address" name="address"></input><br/>
			        
					<br><br>
					<div align="center">
						<button type="button" class="btn btn-secondary">이전으로</button>
						<button type="submit" class="btn btn-success">등록하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>	
</body>
</html>