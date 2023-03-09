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
            height: 100vh;
            margin: auto;
            background-color: rgb(214, 223, 204);
        }
        a{
            color: black;
        }
        .title{
           float: left;
           padding-left: 40px;
        }
        .login-area{
            width: 50%;
            padding-top: 200px;
            
        }
        .loginForm{
            background-color: rgb(255, 245, 237);
            width: 400px;
            height: 400px;
            margin: 0 auto;
            border-radius: 30px;
        }
        .idTitle{
            font-size: 35px;
            height: 50px;
            padding-top: 20px;
        }
        table{
            margin: auto;
            padding-top: 60px;
        }
        button{
            height: 40px;
            width: 120px;
            border: 0cm;
            background-color:rgb(185, 187, 221);
            border-radius: 10px;
        }
        input{
            width: 220px;
            height: 20px;
        }
    </style>
</head>
<body>


	<div class="outer" align="center">

        <div class="title">
            <b style="font-size: 80px;">EASY PEASY</b>
        </div>

        <div class="login-area">
            

            <form action="" method="post" class="loginForm" >
                <div class="idTitle"><b>비밀번호 찾기</b></div>
                <table>
                <tr>
                    <td>이름</td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="userName" required placeholder="이름">
                    </td>
                </tr>
                <tr>
                    <td>아이디</td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="userId" required placeholder="아이디">
                    </td>
                </tr>
                <tr>
                    <td>휴대폰 번호</td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="phone" required placeholder="휴대폰 번호(-제외)">
                    </td>
                </tr>
            </table>
            <br>
            
            <button type="submit"><b>인증번호받기</b></button>
            </form>


            
        </div>

    </div>
    


</body>
</html>