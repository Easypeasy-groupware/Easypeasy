<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        #main{  
            position: absolute; top: 120px;
        }
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
        .idForm{
            background-color: rgb(255, 245, 237);
            width: 400px;
            height: 400px;
            border-radius: 30px;
            position: relative;
            top: 200px;
            
        }
        .idTitle{
            font-size: 35px;
            height: 50px;
            padding-top: 20px;
            padding-bottom: 80px;
            padding-right: 100px;
            padding-left: 100px;
        }
        .text{
            font-size: 20px;
        }
        button{
            height: 40px;
            width: 120px;
            border: 0cm;
            background-color:rgb(185, 187, 221);
            border-radius: 10px;
        }
        
    </style>
</head>
<body>

    <div id="main">

        <div class="outer" align="center">

            <div class="title">
                <b style="font-size: 80px;">EASY PEASY</b>
            </div>

            <div class="idForm" align="center">
                <div class="idTitle"><b>아이디찾기</b></div><br>
            
                    
                <div class="text">회원님의 아이디는 <b>"user01"</b>입니다.</div>
                <br><br><br>
                    
                <button type="button"><b>로그인하러가기</b></button>
                    
                
            </div>
            
        </div>
    </div>

</body>
</html>