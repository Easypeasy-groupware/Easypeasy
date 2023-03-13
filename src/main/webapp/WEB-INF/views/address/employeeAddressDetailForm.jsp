<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
<style>
	.content-outer{width:1000px; margin-left:200px; padding-left:10px;}
	.content-outer *{box-sizing: border-box;}
	
	#address-group{font-size:22px; font-weight:600;}      
	
	/*div*/
	.div-divide{float:left;}
	.div-left{margin-left:100px;}
	.div-right{padding-left:30px;}
	
	/*이미지*/
	.div-left>img{width: 150px; border-radius: 50%;}
	
	/*테이블*/
	.info-table{margin-bottom:30px;}
	.info-table td{height: 20px;}
	
	/*버튼*/
	.set-btn{border:0; border-radius: 5px; width:120px; height:30px; color:white;}
	#send-btn{background:rgb(158, 158, 158); margin:0 5px 0 20px;}
	#copy-btn{background:rgb(166, 184, 145);}

</style>
</head>
<body>
	<jsp:include page="addMenubar.jsp" />
	
    <div class="content-outer">

        <p id="address-group">사원연락처</p>

        <br>

        <div class="div-divide div-left">
            <img src="<c:out value='${ e.empProfile }' default='resources/common_images/default_profile.png' />" >
        </div>
        <div class="div-divide div-right">
            <table class="info-table">
                <colgroup>
                    <col style="width:150px;">
                    <col style="width:500px;">
                </colgroup>
                <tr>
                    <td>이름</td>
                    <td>
                        <b>${ e.empName }</b>
                    </td>
                </tr>
                <tr>
                    <td>부서</td>
                    <td>
                        <b>${ e.deptName }</b>
                    </td>
                </tr>
                <tr>
                    <td>직위</td>
                    <td>
                       <b>${ e.jobName }</b>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <b>${ e.email }</b>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td>
                        <b>${ e.phone }</b>
                    </td>
                </tr>
            </table>

            <button type="button" class="set-btn" id="send-btn">메일쓰기</button>
            <button type="button" class="set-btn" id="copy-btn">연락처 복사</button>
			<button type="button" class="set-btn" id="chat-btn">1:1 채팅</button>
        </div>

    

        

        
    </div>    
</body>
</html>