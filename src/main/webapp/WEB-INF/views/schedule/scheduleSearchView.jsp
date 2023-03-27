<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content{
        border-left: 1px solid lightgray;
        width: 1000px;
        float: left;
        box-sizing: border-box;
    }

    #title h5{
        padding-left: 25px;
        padding-top: 10px;
        float: left;
    }
    .input-group{
        margin-left: 720px;
        width: 250px;
        height: 30px;
        padding-top: 10px;
    }

    p{
        background-color: #fff5ed;
        margin: auto;
        margin-top: 35px;
        width: 95%;
        height: 50px;
        padding: 10px;
        box-sizing: border-box;
        border-radius: 5px;
    }

    .table{
        text-align: center;
    }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<jsp:include page="sidebar.jsp"/>

	<div id="content">
		
        <div id="title">
            <span>
                <h5>검색 결과</h5>
            </span>
            <form action="">
                <div class="input-group mb-3">
                    <input type="text" name="keyword" value="${ keyword }" class="form-control" placeholder="검색어를 입력해주세요" required>
                    <div class="input-group-append">
                        <button class="btn btn-secondary" type="submit">검색</button>
                    </div>
                </div>
            </form>
        </div>
        <div>
            <p>
                검색어 : ${ keyword }
            </p>
        </div>
        <br>
        <hr>
        <br>
        <table class="table table-hover table-sm">
            <thead>
                <tr>
                    <th>일정</th>
                    <th>일정명</th>
                    <th width="500">참석자</th>
                </tr>
            </thead>
            <tbody>
            
            	
            	<c:forEach var="s" items="${ list }">
	            	<c:if test="${ s.scWriter eq loginUser.empNo }">
	            		<tr>
		                    <td>${ s.startDate } ${ s.startTime } ~ ${ s.endDate } ${ s.endTime }</td>
		                    <td>${ s.scTitle }</td>
		                    <td>
		                    	<span>${ s.empName }</span>
		                    <c:forEach var="sd" items="${ s.attendeeList }">
		                    	<span>${ sd.attendeeName }</span>
		                    </c:forEach>
		                    </td>
		                </tr>
		            </c:if>
	            </c:forEach>
	            
	            
            </tbody>
        </table>
    </div>
    

</body>
</html>