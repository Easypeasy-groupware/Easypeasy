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
    .side{
        width: 200px;
        height: 900px;
        box-sizing: none;
        float: left;
    }
    .title{
        width: 980px;
        height: 100px;
        box-sizing: none;
        float: left;
        font-size: 30px;
        
    }
    .allContent{
        width: 990px;
        height: 900px;
        box-sizing: none;
        float: left;
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
    table {
    width: 800px;
    border-top: 1px solid lightgray;

    border-collapse: collapse;
    margin: 0 auto;
    
   }
   th, td {
    border-bottom: 1px solid lightgray;
    padding: 10px;
   }
</style>
</head>
<body>


	<div class="outer">
        <div class="side">사이드바</div>
        <div class="allContent">
        <div class="title"><b>마이페이지</b><hr></div>

        <div class="box">
            <button class="update-btn">프로필 사진 변경하기</button>
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
                <td><input type="text"></td>
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
                <td><input type="text"></td>
            </tr>
        </table>
        <br>
        <button class="save-btn">저장하기</button>
    </div>
    </div>
    </div>


</body>
</html>