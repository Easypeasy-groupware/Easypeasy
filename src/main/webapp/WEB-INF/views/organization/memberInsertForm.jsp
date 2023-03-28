<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrapper {width: 1200px;margin: 0 auto; position: absolute; top: 120px;}
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
		
		</div>
		
		<div class="board">
			<h2>사원 등록</h2>
			
			<div class="container">
				<form action="insert.org" method="POST" id="enrollForm">
					<br>
			        <!-- <label for="empNo">*사원번호:</label> 
			            <input type="hidden" id="empNo" name="empNo" value="" required><br />
			            <div id="checkResult" style="font-size:0.8em; display:none"></div>
			            <br>-->
			        <label for="userId">*아이디:</label>
			          <input type="text" id="empId" name="empId"  required><br />
			        <label for="password">*비밀번호:</label>
			            <input type="text" id="empPwd" name="empPwd" placeholder="초기 비밀번호는 1234입니다." required>
					<label>*이름</label>
					    <input type="text" id="empName" name="empName" required>
					<label>*직급</label>
			            <select name="jobCode" id="jobCode" >
				            <option value="J1" name="jobCode" id="J1">사원</option>
				            <option value="J2" name="jobCode" id="J2">대리</option>
				            <option value="J3" name="jobCode" id="J3">과장</option>
				            <option value="J4" name="jobCode" id="J4">부장</option>
				            <option value="J5" name="jobCode" id="J5">상무</option>
				            <option value="J6" name="jobCode" id="J6">대표</option>
			            </select>
			        <label>직무</label>
			            <select name="deptCode" id="deptCode" >
			                <option value="D1" name="deptCode" id="D1">인사관리부</option>
			                <option value="D2" name="deptCode" id="D2">경영지원부</option>
			                <option value="D3" name="deptCode" id="D3">영업1팀</option>
			                <option value="D4" name="deptCode" id="D4">영업2팀</option>
			                <option value="D5" name="deptCode" id="D5">영업3팀</option>
			                <option value="D6" name="deptCode" id="D6">마케팅부</option>
			            </select>
			
					<label>입사일</label>
						<input type="date" id="hireDate" name="hireDate"><br>
					<label>연락처</label>
					    <input type="text" id="phone" name="phone" >
					<label>이메일</label>
					    <input type="email" id="email" name="email" required>
			        
			         <label for="address">주소:</label>
			            <input type="text" id="address" name="address"></input><br/>
			        
					<br><br>
					<div align="center">
						<button type="button" class="btn btn-secondary" onclick="javascript:history.go(-1);">이전으로</button>
						<button type="submit" class="btn btn-success">등록하기</button>
					</div>
				</form>
			</div>
			<!-- 
			<script>
	    	$(function(){
	    		const $noInput = $("#enrollForm input[name=empNo]");
	    		
	    		$noInput.keyup(function(){	
	    			if($noInput.val().length >= 1){
	    				
	    				$.ajax({
	    					url:"noCheck.me",
	    					data:{checkNo:$noInput.val()},
	    					success:function(result){
	    						
	    						if(result == "NNNNN"){  
	    							$("#checkResult").show();
	    							$("#checkResult").css("color", "red").text("중복된 사원번호가 존재합니다. 다시 입력해주세요.");
	    							$("#enrollForm :submit").attr("disabled", true);
	    							
	    						}else if (result == "NNNNY"){
	    							$("#checkResult").show();
	    							$("#checkResult").css("color", "green").text("사용가능한 사원번호입니다.");
	    							$("#enrollForm :submit").removeAttr("disabled");
	    						}
	    						
	    					},error:function(){
	    						console.log("사원번호 중복체크용 ajax 통신실패");
	    					}
	    				});
	    			}else{	
	    				$("#checkResult").hide();
	    				$("#enrollForm :submit").attr("disabled", true);
	    			}
	    		})
	    	})
	    </script>
			 -->
		</div>
	</div>	
</body>
</html>