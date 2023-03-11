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
            padding:50px;
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
        <p style="font-size:25px;"><b>결재대기문서</b></p>
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
                        <th>결재양식</th>
                        <th>제목</th>
                        <th>첨부파일</th>
                        <th>기안자</th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${empty list}">
							<tr>
								<td colspan='6'>
									결재대기중인 문서가 없습니다.
								</td>
							</tr>
	                    </c:when>
	                    <c:otherwise>
	                    	<c:forEach var="a" items="list">
			                    <tr>
			                        <td>
			                             <input type="checkbox" name="" id="">
			                        </td>
			                        <td>${a.enrollDate}</td>
			                        <td>${a.formName }</td>
			                        <c:choose>
				                        <c:when test="${a.formCode == 3 || a.formCode == 4 }">
				                        	<td>${a.formName }</td>
				                        </c:when>
				                        <c:otherwise>
				                        	<td>${a.title }</td>
				                        </c:otherwise>
			                        </c:choose>
			                        <td>
			                        	<c:if test="${not empty a.originName}">
			                        		<span><img src="resources/common_images/attachment.png" width="10px;"></span>
			                        	</c:if>
			                        </td>
			                        <td>${s.empName }</td>
			                    </tr>
		                    </c:forEach>
	                    </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
            <br><br>
            <div align="center">
                <ul id="paging">
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1 }">
                			<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item"><a class="page-link" href="recWlist.ap?cpage=${pi.currentPage -1 }">&lt;</a>  </li> 
                		</c:otherwise>
                	</c:choose>
                    
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="recWlist.ap?cpage=${p }">${p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage }">
	                   		<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="recWlist.ap?cpage=${pi.currentPage + 1 }">&gt;</a></li>
	                    </c:otherwise>
                    </c:choose>
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