<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
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
        margin-left:10px;
    }
    .button{
        float: left;
        border: none;
        width: 100px;
        height: 30px;
        font-size: 15px;
        font-weight: bold;
        background-color: rgb(214, 223, 204);
    }
    .table1{
        height: 100px;
        font-size: 16px;
        border: 1px solid lightgray;
        border-collapse: collapse;
        width: 900px;
        margin: 0 auto;
        text-align: center;
        font-size: 16px;
        
    }
    .table2{
        border: 1px solid lightgray;
        border-collapse: collapse;
        width: 900px;
        margin: 0 auto;
        text-align: center;
        font-size: 14px;
    }
    .table3{
        border: 1px solid lightgray;
        border-collapse: collapse;
        width: 900px;
        margin: 0 auto;
        text-align: center;
        font-size: 14px;
    }
    .img{
        width: 100px;
        height: 100px;
        margin: 40px;
        border: 1px solid gray;
        float: left;
        border-radius: 150px;
    }
    .name{
        margin-top: 80px;
        float: left;
        font-weight: bold;
    }
    .smallTitle{
        float: left;
        margin-right: 750px;
        font-size: 20px;
    }
    th, td {
        border: 1px solid lightgray;
    }
    th{
        background-color: rgb(240, 240, 240);
        border: 1px solid lightgray;
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

	 
        <div class="side"><jsp:include page="../commute/commuteSidebar.jsp"/></div>
        <div class="allContent">
            <div class="title"><b>휴가내역</b><hr></div>

            <div class="profile">
                <img  class="img" id="profileImg" src="<c:out value='${ loginUser.empProfile }' default='resources/profile_images/default_profile.png' />" >
               
                
            </div>
            <div class="name">${ loginUser.empName }님</div>

            <table class="table1">
                <tr>
                    <th>이름</th>
                    <th>소속</th>
                    <th>발생연차</th>
                    <th>발생월차</th>
                    <th>특별휴가</th>
                    <th>사용</th>
                    <th>잔여</th>
                </tr>

                <tr>
                    <td>${ loginUser.empName }</td>
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
                    <td>16</td>
                    <td>2</td>
                    <td>0</td>
                    <td>3</td>
                    <td>15</td>
                </tr>
            </table>

            <br><br>

            <h3 class="smallTitle">휴가신청내역</h3><br>

            <button class="button">휴가신청</button><br><br>

            <table class="table2">
                <tr>
                    <th>이름</th>
                    <th>부서명</th>
                    <th>사용기간</th>
                    <th>내용</th>
                </tr>
                
                <tr>
                    <td>${ loginUser.empName }</td>
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
                	<c:forEach var="list2" items="${ list2 }">
                		<td>${ list2.vacStart }~${ list2.vacEnd }</td>
	                    <td>${ list2.vacKind }</td>
                	</c:forEach>
                    
                </tr>

               
            </table>

            <br><br>
            

            
            

        </div>
   


</body>
</html>