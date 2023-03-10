<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1200px;
        margin: auto;
    }

    .title{
        width: 1200px;
        height: 100px;
        box-sizing: none;
        float: left;
        font-size: 30px;
        
    }
	.innerOuter{
		margin-left: 150px;
	}
    .img{
        width: 300px;
        height: 300px;
        margin: 80px;
        border: 1px solid gray;
        float: left;
        border-radius: 150px;
    }
    .content{
        font-size: 15px;
        width: 800px;
        border-top: 1px solid lightgray;
        border-collapse: collapse;
        margin: 0 auto;
    }
    .update-btn{
        margin-top: 230px;
        border: none;
        width: 200px;
        height: 30px;
        font-size: 15px;
        font-weight: bold;
        
    }
    .save-btn{
        border: none;
        width: 90px;
        height: 30px;
        font-size: 15px;
        font-weight: bold;
        background-color: rgb(214, 223, 204);
        margin-left: 800px;
    }
    #pwdBtn{
    	border: none;
        width: 110px;
        height: 30px;
        font-size: 15px;
        font-weight: bold;
        background-color: rgb(185, 187, 221);
    }
    .updateForm{
        float: left;
    }
   th, td {
    border-bottom: 1px solid lightgray;
    padding: 10px;
   }
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!--Popper JS --> 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

	<div class="outer">
        
        
        <div class="title"><b>마이페이지</b><hr></div>
		
		<div class="innerOuter">
        <div class="box">
            <button class="update-btn">프로필 사진 변경하기</button>
        <div class="img">
            <img src="" alt="">
        </div>

        <div class="updateForm">
		<form action="update.mp" method="post">
                    <label for="empName">이름 :</label>
                    <input type="text" class="form-control" id="empName" name="empName" value="${ loginUser.empName }" readonly><br>
                    
                    <label for="company">회사 :</label>
                    <input type="text" class="form-control" id="company" name="company" value="EASYPEASY" readonly><br>
                    
                    <label for="deptCode"> &nbsp; 부서 :</label>
                    <input type="text" class="form-control" id="deptCode" name="deptCode" readonly><br>
                    
                    <label for="jobCode"> &nbsp; 직급 :</label>
                    <input type="text" class="form-control" id="jobCode" name="jobCode" readonly><br>
                    
                    <label for="email"> &nbsp; 이메일 :</label>
                    <input type="email" class="form-control" id="email" name="email" value="${ loginUser.email }" readonly><br>
                    
                    <label for="phone"> &nbsp; 휴대전화 :</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="${ loginUser.phone }"><br>

                    <label for="hireDate"> &nbsp; 입사일 :</label>
                    <input type="text" class="form-control" id="hireDate" name="hireDate" value="${ loginUser.hireDate }" readonly><br>

                    <label for="address"> &nbsp; 주소 :</label>
                    <input type="text" class="form-control" id="address" name="address" value="${ loginUser.address }"><br>
                    
                    <script>
                    	$(function(){
                    		if("${loginUser.deptCode}" == "D1"){
                    			$("#deptCode").val('인사관리팀');
                    		}
                    		if("${loginUser.deptCode}" == "D2"){
                    			$("#deptCode").val('경영지원팀');
                    		}
                    		if("${loginUser.deptCode}" == "D3"){
                    			$("#deptCode").val('영업1팀');
                    		}
                    		if("${loginUser.deptCode}" == "D4"){
                    			$("#deptCode").val('영업2팀');
                    		}
                    		if("${loginUser.deptCode}" == "D5"){
                    			$("#deptCode").val('영업3팀');
                    		}
                    		if("${loginUser.deptCode}" == "D6"){
                    			$("#deptCode").val('마케팅팀');
                    		}
                    	})
                    	
                    	$(function(){
                    		if("${loginUser.jobCode}" == "J1"){
                    			$("#jobCode").val('사원');
                    		}
                    		if("${loginUser.jobCode}" == "J2"){
                    			$("#jobCode").val('대리');
                    		}
                    		if("${loginUser.jobCode}" == "J3"){
                    			$("#jobCode").val('과장');
                    		}
                    		if("${loginUser.jobCode}" == "J4"){
                    			$("#jobCode").val('부장');
                    		}
                    		if("${loginUser.jobCode}" == "J5"){
                    			$("#jobCode").val('상무');
                    		}
                    		if("${loginUser.jobCode}" == "J6"){
                    			$("#jobCode").val('대표');
                    		}
                    	})
                    </script>
        <br>
        <button class="save-btn" type="submit">저장하기</button>
        <button id="pwdBtn" type="button" data-toggle="modal" data-target="#updatePwdForm">비밀번호변경</button>
        </form>
        <br><br><br><br><br>
    </div>
    </div>
    </div>
    
    
    

</body>
</html>