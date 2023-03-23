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
        width: 150px;
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
        margin-right: 650px;
        font-size: 20px;
        padding-left: 40px;
    }
    .save-btn{
        border: none;
        width: 90px;
        height: 30px;
        font-size: 15px;
        font-weight: bold;
        background-color: rgb(214, 223, 204);
        float: left;
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

	 
        <div class="side"><jsp:include page="../commute/HRsidebar.jsp"/></div>
        <div class="allContent">
            <div class="title"><b>휴가관리</b><hr></div>

            <div class="profile">
                <img  class="img" id="profileImg" src="<c:out value='${ clickEmp.empProfile }' default='resources/profile_images/default_profile.png' />" >
               
                
            </div>
            <div class="name">${ clickEmp.empName }님</div>

            <table class="table1">
                <tr>
                    <th>이름</th>
                    <th>소속</th>
                    <th>일반휴가</th>
                    <th>특별휴가</th>
                    <th>사용</th>
                    <th>잔여</th>
                </tr>

                <tr>
                    <td>${ clickEmp.empName }</td>
                    <c:choose>
                	<c:when test="${ clickEmp.deptCode eq 'D1' }">
                		<td>인사관리팀</td>
                	</c:when>
                	<c:when test="${ clickEmp.deptCode eq 'D2' }">
                		<td>경영지원팀</td>
                	</c:when>
                	<c:when test="${ clickEmp.deptCode eq 'D3' }">
                		<td>영업1팀</td>
                	</c:when>
                	<c:when test="${ clickEmp.deptCode eq 'D4' }">
                		<td>영업2팀</td>
                	</c:when>
                	<c:when test="${ clickEmp.deptCode eq 'D5' }">
                		<td>영업3팀</td>
                	</c:when>
                	<c:otherwise>
                		<td>마케팅팀</td>
                	</c:otherwise>
                	</c:choose>
                    <td>16</td>
                    <td>2</td>
                    <td>3</td>
                    <td>15</td>
                </tr>
            </table>

            <br><br>
            

            <h3 class="smallTitle">휴가 신청내역</h3><br>

            <table class="table2">
                <tr>
                    <th>이름</th>
                    <th>부서명</th>
                    <th>사용기간</th>
                    <th>내용</th>
                </tr>
                
                <tr>
                    <td>${ clickEmp.empName }</td>
                    <c:choose>
                	<c:when test="${ clickEmp.deptCode eq 'D1' }">
                		<td>인사관리팀</td>
                	</c:when>
                	<c:when test="${ clickEmp.deptCode eq 'D2' }">
                		<td>경영지원팀</td>
                	</c:when>
                	<c:when test="${ clickEmp.deptCode eq 'D3' }">
                		<td>영업1팀</td>
                	</c:when>
                	<c:when test="${ clickEmp.deptCode eq 'D4' }">
                		<td>영업2팀</td>
                	</c:when>
                	<c:when test="${ clickEmp.deptCode eq 'D5' }">
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
            <h3 class="smallTitle">휴가 부여 및 수정</h3><br>
            
        <form action="" method="post">
            <button class="save-btn" type="submit">수정하기</button><br><br>
                <table class="table3">
                    <tr>
                        <th><label for="vacDivide">휴가 지급/차감</label></th>
                        <td><select name="vacDivide" id="vacDivide">
                            <option value="PA">지급</option>
                            <option value="DE">차감</option>
                        </select><br></td>
                    </tr>
                    <tr>
                        <th><label for="vacCategory">일반휴가/특별휴가</label></th>
                        <td><select name="vacCategory" id="vacCategory">
                            <option value="GV">일반휴가</option>
                            <option value="SV">특별휴가</option>
                        </select><br></td>
                    </tr>
                    <tr>
                        <th><label for="vacDays">지급/차감 일수</label></th>
                        <td><input type="text" class="formData" id="vacDays" name="vacDays" ><br></td>
                    </tr>
                    <tr>
                        <th><label for="vacReason">지급/차감 사유</label></th>
                        <td><input type="text" class="formData" id="vacReason" name="vacReason" ><br></td>
                    </tr>

                
            </table>
     
        <br>
        
        </form>
            
            

        </div>
   


</body>
</html>