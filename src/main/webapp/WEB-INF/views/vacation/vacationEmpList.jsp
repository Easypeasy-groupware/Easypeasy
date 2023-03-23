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
    .table2{
        border: 1px solid lightgray;
        border-collapse: collapse;
        width: 900px;
        margin: 0 auto;
        text-align: center;
        font-size: 14px;
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

            
     

            <table class="table2">
                <tr>
                    <th>이름</th>
                    <th>부서명</th>
                    <th>생성</th>
                    <th>사용</th>
                    <th>잔여</th>
                </tr>
                
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>

            <br><br>
            
            <div align="center">
                <ul id="paging">
    
                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="working.HR?cpage=${pi.currentPage-1 }">&lt;</a></li>
                        </c:otherwise>
                    </c:choose>
                    
                           <c:forEach var="p" begin="${ pi.startPage }" end="${pi.endPage }">
                        <li class="page-item"><a class="page-link" href="working.HR?cpage=${p }">${p }</a></li>
                        </c:forEach>
                        
                        <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="working.HR?cpage=${pi.currentPage+1 }">&gt;</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>

</body>
</html>