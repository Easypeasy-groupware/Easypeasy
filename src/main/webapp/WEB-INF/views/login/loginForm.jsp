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
            width: 50%;
            height: 100%;
            float: left;
            text-align: center;
            padding-top: 300px;
        }
        .login-area{
            width: 50%;
            padding-top: 200px;
            float: right;
        }
        .loginForm{
            background-color: rgb(255, 245, 237);
            width: 400px;
            height: 400px;
            margin: 0 auto;
            border-radius: 30px;
        }
        table{
            margin: auto;
            padding-top: 150px;
        }
        button{
            height: 60px;
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
            파이널 프로젝트 그룹웨어<br>
            <b style="font-size: 80px;">EASY PEASY</b>
        </div>

        <div class="login-area">


            <form action="login.ep" method="post" class="loginForm" align="center">
                <table>
                <tr>
                    <td><input type="text" name="empId" id="userId" required placeholder="ID"></td>
                    <td rowspan="2"><button type="submit" >로그인</button></td>
                </tr>
                <tr>
                    <td><input type="password" name="empPwd" id="userPwd" required placeholder="PWD"></td>
                    
                </tr>
            </table>
            <br>
            
            <a href="">아이디 찾기</a>
            <a href="">비밀번호 찾기</a>
            </form>


            
        </div>

    </div>


</body>
</html>