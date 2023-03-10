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
        box-sizing: none;
        font-size: 30px;
    }

    .img{
        width: 300px;
        height: 300px;
        margin: 100px;
        border: 1px solid gray;
        float: left;
        border-radius: 150px;
        margin-right: 500px;
    }
    .content{
        font-size: 15px;
        width: 800px;
        border-top: 1px solid lightgray;
        border-collapse: collapse;
        margin: 0 auto;
    }
    .button{
        margin-top: 350px;
        border: none;
        width: 90px;
        height: 30px;
        font-size: 15px;
        font-weight: bold;
        
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

        <div class="box">
            <a href="updateMP.ep"><button class="button">수정하기</button></a>
        <div class="img">
            <img src="<c:out value='${ loginUser.empProfile }' default='resources/profile_images/defaultProfile.png' />">
        </div>

        <table class="content">
            <tr>
                <td>이름</td>
                <td>${ loginUser.empName }</td>
            </tr>
            <tr>
                <td>회사</td>
                <td>EASY PEASY</td>
            </tr>
            <tr>
                <td>부서</td>
                <c:choose>
                	<c:when test="${ loginUser.deptCode eq 'D1' }">
                		<td>인사관리팀</td>
                	</c:when>
                	<c:when test="${ loginUser.deptCode eq 'D2' }">
                		<td>경영지원팀</td>
                	</c:when>
                	<c:when test="${ loginUser.deptCode eq 'D3' }">
                		<td>영업1팀</td>
                	</c:when>
                	<c:when test="${ loginUser.deptCode eq 'D4' }">
                		<td>영업2팀</td>
                	</c:when>
                	<c:when test="${ loginUser.deptCode eq 'D5' }">
                		<td>영업3팀</td>
                	</c:when>
                	<c:otherwise>
                		<td>마케팅팀</td>
                	</c:otherwise>
                </c:choose>
            </tr>
            <tr>
                <td>직위</td>
                <c:choose>
                	<c:when test="${ loginUser.jobCode eq 'J1' }">
                		<td>사원</td>
                	</c:when>
                	<c:when test="${ loginUser.jobCode eq 'J2' }">
                		<td>대리</td>
                	</c:when>
                	<c:when test="${ loginUser.jobCode eq 'J3' }">
                		<td>과장</td>
                	</c:when>
                	<c:when test="${ loginUser.jobCode eq 'J4' }">
                		<td>부장</td>
                	</c:when>
                	<c:when test="${ loginUser.jobCode eq 'J5' }">
                		<td>상무</td>
                	</c:when>
                	<c:otherwise>
                		<td>대표</td>
                	</c:otherwise>
                </c:choose>
            </tr>
            <tr>
                <td>이메일</td>
                <td>${ loginUser.email }</td>
            </tr>
            <tr>
                <td>휴대전화</td>
                <td>${ loginUser.phone }</td>
            </tr>
            <tr>
                <td>입사일</td>
                <td>${ loginUser.hireDate }</td>
            </tr>
            <tr>
                <td>주소</td>
                <td>${ loginUser.address }</td>
            </tr>
        </table>
    </div>
    
    </div>


</body>
</html>