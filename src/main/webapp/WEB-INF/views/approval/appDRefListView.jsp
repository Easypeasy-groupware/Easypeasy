<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        .outer1{
            width:1000px;
            margin:auto;
            float:left;
            box-sizing: border-box;
        }	
	</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="appMenubar.jsp" />
    <div class="outer1">
        <p style="font-size:25px;"><b>부서참조함</b> in 부서명</p>
        <br><br>
        <div class="list-1">
            <select name="period" id="">
                <option value="">전체기간</option>
                <option value="">1개월</option>
                <option value="">6개월</option>
                <option value="">1년</option>
            </select>
            <select name="option" id="">
                <option value="">기안자</option>
                <option value="">기안부서</option>
                <option value="">결재양식</option>
            </select>
            <input type="search"> <button>검색</button>

        </div>

        <br><br>

        <div class="list-2">

            <table style="text-align:center" class="table">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" name="" id="">
                        </th>
                        <th>기안일</th>
                        <th>완료일</th>
                        <th>결재양식</th>
                        <th>제목</th>
                        <th>기안자</th>
                        <th>첨부파일</th>
                        <th>문서번호</th>
                        <th>결재상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                             <input type="checkbox" name="" id="">
                        </td>
                        <td>w</td>
                        <td>w</td>
                        <td>q</td>
                        <td>g</td>
                        <td>g</td>
                        <td>g</td>
                        <td>g</td>
                        <td>g</td>
                    </tr>
                </tbody>
            </table>
            <br><br>
            <div align="center">
                <ul id="paging">
                    <li><a href=""> < </a></li>
                    <li class='on'><a href=""> 1 </a></li>
                    <li><a href=""> 2 </a></li>
                    <li><a href=""> 3 </a></li>
                    <li><a href=""> 4 </a></li>
                    <li><a href=""> 5 </a></li>
                    <li><a href=""> > </a></li>
                </ul>
            </div>
            <script>
                $(function(){
                     $("#ps-tbody").on("click", "tr", function(){
                         location.href = 'xxxxx.ad?no=' + $(this).children().eq(0).text(); 
                     })
                })
            </script>
           
            <br clear="both"><br>



        </div>

    </div>
</body>
</html>