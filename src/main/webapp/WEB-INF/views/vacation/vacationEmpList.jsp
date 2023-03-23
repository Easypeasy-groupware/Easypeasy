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
       table {
            width: 900px;
            text-align: center;
            border: 1px solid #fff;
            border-spacing: 1px;
            font-family: 'Cairo', sans-serif;
            margin: auto;
        }

    
        table td {
            padding: 10px;
            background-color: #eee;
        }

        table th {
            background-color: rgb(185, 187, 221);
            color: #fff;
            padding: 10px;
        }
        .view {
            background-color: rgb(214, 223, 204);
            border: none;
            padding: 5px 10px;
            color: #fff;
            font-weight: bold;
        }
	 .img{
        width: 50px;
        height: 50px;
        border: none;
        border-radius: 150px;
    }

    .name{
        margin-top: 80px;
        float: left;
        font-weight: bold;
    }
    th, td {
        border: 1px solid lightgray;
    }
    th{
        background-color: rgb(240, 240, 240);
        border: 1px solid lightgray;
    }
        /*페이징바*/
        #paging{text-align: center; display: inline-block; padding-left :0;}
        #paging li {text-align: center; float: left; list-style:none; border-radius:10px; margin:2px; background-color: rgb(234, 234, 234);}
        #paging li a {display: block; font-size: 12px; color: black; padding: 5px 10px; box-sizing: border-box; text-decoration-line:none;}
        #paging li.on {background:rgb(166, 184, 145);}
        #paging li.on a { color: white;}
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

            <br><br>

            
     

        <table>
            
            <thead>
                <tr>
                    <th></th>
                    <th>이름</th>
                    <th>부서</th>
                    <th>직위</th>
                    <th>휴가관리</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="list" items="${ list }">
	            	<tr>
	                    <td><img  class="img" id="profileImg" src="<c:out value='${ list.empProfile }' default='resources/profile_images/default_profile.png' />" ></td>
	                    <c:choose>
	                	<c:when test="${ list.deptCode eq 'D1' }">
	                		<td>인사관리팀</td>
	                	</c:when>
	                	<c:when test="${ list.deptCode eq 'D2' }">
	                		<td>경영지원팀</td>
	                	</c:when>
	                	<c:when test="${ list.deptCode eq 'D3' }">
	                		<td>영업1팀</td>
	                	</c:when>
	                	<c:when test="${ list.deptCode eq 'D4' }">
	                		<td>영업2팀</td>
	                	</c:when>
	                	<c:when test="${ list.deptCode eq 'D5' }">
	                		<td>영업3팀</td>
	                	</c:when>
	                	<c:otherwise>
	                		<td>마케팅팀</td>
	                	</c:otherwise>
	                	</c:choose>
	                    <td>${ list.empName }</td>
	                    <c:choose>
	                	<c:when test="${ list.jobCode eq 'J1' }">
	                		<td>사원</td>
	                	</c:when>
	                	<c:when test="${ list.jobCode eq 'J2' }">
	                		<td>대리</td>
	                	</c:when>
	                	<c:when test="${ list.jobCode eq 'J3' }">
	                		<td>과장</td>
	                	</c:when>
	                	<c:when test="${ list.jobCode eq 'J4' }">
	                		<td>부장</td>
	                	</c:when>
	                	<c:when test="${ list.jobCode eq 'J5' }">
	                		<td>상무</td>
	                	</c:when>
	                	<c:otherwise>
	                		<td>대표</td>
	                	</c:otherwise>
	               	 	</c:choose>
	                    <td>
	                        <a href="updateVac.HR?no=${list.empNo}"><button class="view">휴가관리</button></a>
	                    </td>
	                </tr>
            	</c:forEach>
            
    
                
            </tbody>
            
        </table>
		<br><br>

            
            
            <div align="center">
                <ul id="paging">
    
                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="vacList.HR?cpage=${pi.currentPage-1 }">&lt;</a></li>
                        </c:otherwise>
                    </c:choose>
                    
                           <c:forEach var="p" begin="${ pi.startPage }" end="${pi.endPage }">
                        <li class="page-item"><a class="page-link" href="vacList.HR?cpage=${p }">${p }</a></li>
                        </c:forEach>
                        
                        <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="vacList.HR?cpage=${pi.currentPage+1 }">&gt;</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>

</body>
</html>