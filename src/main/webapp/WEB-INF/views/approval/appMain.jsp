<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
         /* div{border:1px solid red;}  */
        
        .outer1{
            width:1000px; 
            padding:50px;
            margin:auto;
            float:left;
            box-sizing: border-box;
        }
        .app-wait{width:800px; height:300px;}
        .wapp{
            float:left;
            width:200px; 
            border:1px solid gray; 
            border-radius: 30px; 
            padding:15px;
            margin-right: 10px; 
            font-size:13px;
           
        }
        .app-wait button{width:160px;}
        .app-wait>p>b>a, .app-prgs>p>b>a{color:black;}
      

    </style>   
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <jsp:include page="appMenubar.jsp" />

        <div class="outer1" >
            <div class="outer1-1">
                <p style="font-size:33px; "><a style="color:black;" href="main.ap"><b> 전자결재 홈</b></a></p>
                <br><br>
                <div class="app-wait">
                    <p style="font-size:25px; "><b><a href="">결재대기</a></b></p>
                    <c:choose>
                    	<c:when test="${empty list1}">
                    		<br><br>
                    		<div align="center">
                    			결재 대기중인 문서가 없습니다.
                    		</div>
                    	</c:when>
                    	<c:otherwise>
		                    <c:forEach var="w" items="${list1}">
			                    <div class="wapp">
			                        ${w.tstatus} <br>
			                        <c:choose>
				                        <c:when test="${w.formCode == 3 || w.formCode == 4}">
				                        	${w.formName }
				                        </c:when>
				                        <c:otherwise>
				                        	${w.title }
				                        </c:otherwise>
			                        </c:choose>
			                        <br><br>
			                        ${w.empName}<br>
			                        ${w.enrollDate } <br><br>
			                        <button class="btn btn-outline-secondary">결재하기</button>
			                    </div>
		                    </c:forEach>
	                    </c:otherwise>
                    </c:choose>
                    
                </div>

                <br><br>

                <div class="app-prgs">
                    <p style="font-size:25px; "><b><a href="">기안 진행 문서</a></b></p>
                    <table style="width:800px; text-align:center" class="table">
                        <thead>
                            <tr>
                                <th>no.</th>
                                <th>기안일</th>
                                <th>결재양식</th>
                                <th>제목</th>
                                <th>기안자</th>
                                <th>결재상태</th>
                            </tr>
                        </thead>
                        <tbody>
		                    <c:choose>
		                    	<c:when test="${empty list2}">
		                    		<tr>
		                    			<td colspan='6'>
				                    		<div align="center">
				                    			결재 대기중인 문서가 없습니다.
				                    		</div>
			                    		</td>
		                    		</tr>
		                    	</c:when>   
		                    	<c:otherwise>                     
			                        <c:forEach var="s" items="${list2}">
				                            <tr>
				                                <td>${s.appNo}</td>
				                                <td>${s.enrollDate}</td>
				                                <td>${s.formName}</td>
				                                <c:choose>
							                        <c:when test="${s.formCode == 3 || s.formCode == 4}">
							                         	<td>${s.formName}</td>
							                        </c:when>
							                        <c:otherwise>
							                        	<td>${s.title}</td>
							                        </c:otherwise>
				                                </c:choose>
				                                <td>${s.empName}</td>
				                                <td>${s.tstatus}</td>
				                            </tr>
			                            </c:forEach>
		                            </c:otherwise>
		                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
            <br><br><br><br><br><br><br><br><br><br>
        </div>
        
 
</body>
</html>