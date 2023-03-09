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
        .tb{
            margin: auto;
            padding-top: 80px;
            border-collapse: separate;
        }
        .button{
            height: 40px;
            width: 120px;
            border: 0cm;
            background-color:rgb(185, 187, 221);
            border-radius: 10px;
        }
        .ip{
            width: 220px;
            height: 20px;
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
            <b style="font-size: 80px;">EASY PEASY</b>
        </div>

        <div class="login-area">
            

            <form action="findId.ep" method="post" class="loginForm" >
                <div class="idTitle"><b>아이디 찾기</b></div>
                <table class="tb">
                <tr>
                    <td>이름</td>
                </tr>
                <tr>
                    <td>
                        <input class="ip" type="text" name="empName" required placeholder="이름">
                    </td>
                </tr>
                <tr>
                    <td>휴대폰 번호</td>
                </tr>
                <tr>
                    <td>
                        <input class="ip" type="text" name="phone" required placeholder="휴대폰 번호(-제외)">
                    </td>
                </tr>
            </table>
            <br>
            
            <button type="submit" class="button"><b>인증번호받기</b></button>
            </form>


            
        </div>

    </div>


</body>
</html>