<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{
        box-sizing: border-box;
    }

	#main{  
        position: absolute; top: 120px;
    }
    
    #content{
        width: 1000px;
        float: left;
        box-sizing: border-box;
    }

    .input-group {
        position: inherit;
    }

    #title h5{
        padding-left: 25px;
        padding-top: 15px;
        float: left		!important;
    }
    .input-group{
        margin-left: 750px;
        width: 250px	!important;
        height: 30px;
        padding-top: 10px;
        position: inherit;
    }
    
    button[type=submit]{
    	border: none;
    	background: rgb(214, 223, 204);
    }

    #content>table{
    	margin-left: 20px;
        width: 98%;
        text-align: center;
    }
    
    
    /* 페이징바 */
    #paging {
	    text-align: center;
	    display: inline-block;
	    padding-left: 0;
	}
    #paging li {
	    text-align: center;
	    float: left;
	    list-style: none;
	    border-radius: 10px;
	    margin: 2px;
	    background-color: rgb(234, 234, 234);
	}
    #paging li a {
    	display: block;
    	font-size: 12px;
    	color: black;
    	padding: 5px 10px;
    	box-sizing: border-box;
    	text-decoration-line:none;
    }
    #paging li.on {
    	background:rgb(166, 184, 145);
    }
    #paging li.on a {
    	color: white;
    }
</style>
<body>

	<jsp:include page="../common/header.jsp"/>

    <div id="main">

		<jsp:include page="sidebar.jsp"/>
		
			<div id="content">
				<div id="title">
					<span>
						<h5>전사 자료실</h5>
					</span>
					<form action="search.db" method="Get">
					<input type="hidden" name="cpage" value="1">
						<div style="position: inherit;" class="input-group mb-3 ">
							<input type="text" name="keyword" value="${ keyword }" style="position: inherit;" class="form-control" placeholder="검색어를 입력해주세요" required>
							<div class="input-group-append">
								<button type="submit" style="position: inherit; z-index: -1;" class="btn btn-secondary">검색</button>
							</div>
						</div>
					</form>
				</div>
				<br>
				<!-- 경영지원팀만 글작성 할 수 있도록 -->
				<c:if test="${ loginUser.deptCode eq 'D2' }">
					<a class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white; margin-left: 940px; margin-bottom: -15px;" href="enrollForm.db">글쓰기</a>
				</c:if>
				<br><br>
				<table class="table table-hover table-sm" id="dbList">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="db" items="${ list }">
							<tr>
								<td class="dbno">${ db.dbNo }</td>
								<td>${ db.dbTitle }</td>
								<td>${ db.createDate }</td>
								<td>${ db.count }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				
				<script>
				$(function(){
					$("#dbList>tbody>tr").click(function(){
						
						location.href = 'detail.db?no=' + $(this).children(".dbno").text();
					})
				})
				</script>
			
			
			
				<!-- 페이징 처리 -->
				<div id="pagingArea" align="center">
					<ul id="paging">
						<c:choose>
							<c:when test="${ empty keyword }">
								<c:if test="${ pi.currentPage ne 1 }">
									<li><a href="list.db?cpage=${ pi.currentPage-1 }">&lt;</a></li>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${ pi.currentPage ne 1 }">
									<li><a href="search.db?cpage=${ pi.currentPage-1 }&keyword=${ keyword }">&lt;</a></li>
								</c:if>
							</c:otherwise>
						</c:choose>
							
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:choose>
								<c:when test="${ empty keyword }">
									<li class="on"><a href="list.db?cpage=${ p }">${ p }</a></li>
								</c:when>
								<c:otherwise>
									<li class="on"><a href="search.db?cpage=${ p }&keyword=${ keyword }">${ p }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
							
						<c:choose>
							<c:when test="${ empty keyword }">
								<li><a href="list.db?cpage=${ pi.currentPage+1 }">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="search.db?cpage=${ pi.currentPage+1 }&keyword=${ keyword }">&gt;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>