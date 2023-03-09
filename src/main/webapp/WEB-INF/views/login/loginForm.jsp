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
            height: 800px;
            margin: auto;
            margin-top:70px;
            background-color: rgb(214, 223, 204);
        }
        .aBtn{
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
        .idForm{
            margin: auto;
            padding-top: 150px;
            border-collapse: separate;
        }
        .button{
            height: 60px;
            border: 0cm;
            background-color:rgb(185, 187, 221);
            border-radius: 10px;
        }
        .ip{
            width: 220px;
            height: 30px;
        }
    </style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!--Popper JS --> 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Alertify JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
</head>
<body style="background-color:rgb(214, 223, 204)">

	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if> 


    <div class="outer" align="center">

        <div class="title">
            파이널 프로젝트 그룹웨어<br>
            <b style="font-size: 80px;">EASY PEASY</b>
        </div>

        <div class="login-area">


            <form action="login.ep" method="post" class="loginForm" align="center">
                <table class="idForm">
                <tr>
                    <td><input class="ip" type="text" name="empId" required placeholder="ID"></td>
                    <td rowspan="2"><button class="button" type="submit" >로그인</button></td>
                </tr>
                <tr>
                    <td><input class="ip" type="password" name="empPwd" required placeholder="PWD"></td>
                    
                </tr>
            </table>
            <br>
            
            <a class="aBtn" href="" >아이디 찾기</a>
            <a class="aBtn" href="">비밀번호 찾기</a>
            </form>


            
        </div>

    </div>


</body>
</html>