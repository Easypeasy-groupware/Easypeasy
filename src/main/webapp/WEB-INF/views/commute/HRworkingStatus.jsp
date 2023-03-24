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
            margin: auto;
        }

        #main{  
            position: absolute; top: 120px;
        }
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
            float: left;
            margin-left:10px;
        }
        .search-area{
            width: 900px;
            height: 150px;
            background-color: #eee;
            margin: auto;
            padding-top: 50px;
            padding-left: 250px;
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

        
        .view,
        .delete {
            border: none;
            padding: 5px 10px;
            color: #fff;
            font-weight: bold;
        }

        .view {
            background-color: rgb(214, 223, 204);
        }



        .tablefoot {
            padding: 0;
            
        }
        #search-btn{
            width: 70px;
            background-color: rgb(214, 223, 204);
            border: none;
            font-weight: bold;
            color: white;
        }
        #deptList{
            margin-right: 50px;
        }
        .img{
        width: 50px;
        height: 50px;
        border: none;
        border-radius: 150px;
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
    
    <!— fullcalendar css —>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <!— fullcalendar 언어 설정관련 script —>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
</head>
<body>

<jsp:include page="../common/header.jsp"/>

    <div id="main">

        <div class="side"><jsp:include page="../commute/HRsidebar.jsp"/></div>

        <div class="allContent">

            <div class="title"><b>근무시간 확인 및 수정</b><hr></div>
            <br><br><br><br>

            <div class="search-area">
                <select name="" id="deptList">
                    <option value="">전체</option>
                    <option value="">인사관리팀</option>
                    <option value="">경영지원팀</option>
                    <option value="">영업1팀</option>
                    <option value="">영업2팀</option>
                    <option value="">영업3팀</option>
                    <option value="">마케팅팀</option>
                </select>
                <input type="text" placeholder="사원 이름">
                            <button type="button" id="search-btn" onclick="">검색</button>
            </div><br><br>

            <table>
                
                <thead>
                    <tr>
                        <th></th>
                        <th>이름</th>
                        <th>부서</th>
                        <th>직위</th>
                        <th>근무시간 확인</th>
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
                                <a href="workingEmp.HR?no=${list.empNo}"><button class="view">근무시간</button></a>
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
    </div>

</body>
</html>