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
            background-color: rgb(214, 223, 204);
            border: none;
            font-weight: bold;
            color: white;
        }
        #deptList{
            margin-right: 50px;
        }
   
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
            <input type="text" placeholder="검색">
                        <button type="button" id="search-btn" onclick="">이름</button>
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
                <tr>
                    <td><img src="" alt="img"></td>
                    <td>인사관리팀</td>
                    <td>정형돈</td>
                    <td>과장</td>
                    <td>
                        <button class="view">근무시간</button>
                        
                    </td>
                </tr>
    
                <tr>
                    <td><img src="" alt="img"></td>
                    <td rowspan="2">Shades</td>
                    <td>David</td>
                    <td>180</td>
                    <td>
                        <button class="view">근무시간</button>
                        
                    </td>
                </tr>
    
                <tr>
              <td><img src="" alt="img"></td>
                    <td>Alex</td>
                    <td>160</td>
                    <td>
                        <button class="view">근무시간</button>
                        
                    </td>
                </tr>
    
                <tr>
                    <td><img src="" alt="img"></td>
                    <td rowspan="2">Valhala</td>
                    <td> Kawtar</td>
                    <td>190</td>
                    <td>
                        <button class="view">근무시간</button>
                        
                    </td>
                </tr>
    
                <tr>
                    <td><img src="" alt="img"></td>
                    <td>Katara</td>
                    <td>110</td>
                    <td>
                        <button class="view">근무시간</button>
                        
                    </td>
                </tr>
    
                <tr>
                    <td><img src="" alt="img"></td>
                    <td>Union</td>
                    <td>Ashraf</td>
                    <td>90</td>
                    <td>
                        <button class="view">근무시간</button>
                        
                    </td>
                </tr>
            </tbody>
            
        </table>

        
        <div id="pagingArea">
            <ul class="pagination">
            <c:choose>
                <c:when test="${ pi.currentPage eq 1 }">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="#?cpage=${pi.currentPage-1 }">Previous</a></li>
                </c:otherwise>
            </c:choose>
            
                   <c:forEach var="p" begin="${ pi.startPage }" end="${pi.endPage }">
                <li class="page-item"><a class="page-link" href="#?cpage=${p }">${p }</a></li>
                </c:forEach>
                
                <c:choose>
                <c:when test="${ pi.currentPage eq pi.maxPage }">
                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="#?cpage=${pi.currentPage+1 }">Next</a></li>
                </c:otherwise>
            </c:choose>
                
            </ul>
        </div>

    </div>

</body>
</html>