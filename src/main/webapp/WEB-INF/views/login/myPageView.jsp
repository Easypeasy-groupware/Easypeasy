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
            <button class="button">수정하기</button>
        <div class="img">
            <img src="" alt="">
        </div>

        <table class="content">
            <tr>
                <td>이름</td>
                <td></td>
            </tr>
            <tr>
                <td>회사</td>
                <td></td>
            </tr>
            <tr>
                <td>부서</td>
                <td></td>
            </tr>
            <tr>
                <td>직위</td>
                <td></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td></td>
            </tr>
            <tr>
                <td>휴대전화</td>
                <td></td>
            </tr>
            <tr>
                <td>입사일</td>
                <td></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td></td>
            </tr>
            <tr>
                <td>주소</td>
                <td></td>
            </tr>
        </table>
    </div>
    
    </div>


</body>
</html>