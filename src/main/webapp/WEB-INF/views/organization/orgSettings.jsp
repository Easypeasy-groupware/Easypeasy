<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 전체 wrapper */
  .wrapper {width: 1200px;margin: 0 auto;}
  body {font-family: Arial, sans-serif;	margin: 0; padding: 0;}

 /* 게시판 스타일 */
	.board {width: 1000px; float: right;}
	.board>.board1{width:50%; float:left;}
	.board>.board2{width:50%; float:right;}
	.container {margin: 10px auto; width: 90%;  padding: 20px;}
    table {border-collapse: collapse; width: 100%;}
	th, td {text-align: center; padding: 8px; border-bottom: 1px solid #ccc;}
	th {background-color: #ddd;}
	tr:hover {background-color: #f5f5f5;}
    input[type="text"],
	select {
		width: 100%;
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 3px;
		box-sizing: border-box;
		margin-bottom: 20px;
		font-size: 16px;
		font-family: inherit;
	}
	select {height: 40px;}
	.v-line {border-left : thick solid lightgrey; height : 50px;}

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
		
		<jsp:include page="../organization/orgSidebar.jsp" />
	
		<div class="board">
			<div class="board1">
				<br><br>
				<h2>직무관리</h2>
				<br>
				<div class="container dep">
					<button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#myModal" style="float:right;">등록하기</button>
					<br><br>
					<table id="depList">
						<thead>
							<tr>
								<th>부서코드</th>
								<th>직무명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${list}">
								<tr>
									<td>${e.deptCode}</td>
									<td>${e.deptName}</td>
								</tr>
							</c:forEach>
							
							<tr>
								<td>D2</td>
								<td>경영지원부</td>
							</tr>
							<tr>
								<td>D3</td>
								<td>영업1팀</td>
							</tr>
							<tr>
								<td>D4</td>
								<td>영업2</td>
							</tr>
							<tr>
								<td>D5</td>
								<td>영업3</td>
							</tr>
							<tr>
								<td>D6</td>
								<td>마케팅부</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- The Modal -->
			<div class="modal" id="myModal">
				<div class="modal-dialog">
				<div class="modal-content">
			
					<!-- Modal Header -->
					<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
			
					<!-- Modal body -->
					<div class="modal-body">
						<label for="empNo">부서코드 :</label>
						<input type="text" id="depCode" name="depCode" required />

						<label for="empNo">직무명 :</label>
						<input type="text" id="depName" name="depName" required />
					</div>
			
					<!-- Modal footer -->
					<div class="modal-footer">
					<button type="submit" class="btn btn-success" data-dismiss="modal">등록하기</button>
					</div>
			
				</div>
				</div>
				<script>
					$(function(){
						$("#noticeList>tbody>tr").click(function(){
							/* 모달안에 멀티모달 적용  */
						})
					})
				</script>    
			</div>

			<div class="board2">
				<br><br>
				<h2>직위관리</h2>
				<br>
				<div class="container position">
					<button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#jobModal" style="float:right;">등록하기</button>
					<br><br>
					<table id="depList">
						<thead>
							<tr>
								<th>직위코드</th>
								<th>직위명</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>J1</td>
								<td>대표</td>
							</tr>
							<tr>
								<td>J2</td>
								<td>이사</td>
							</tr>
							<tr>
								<td>J3</td>
								<td>부장</td>
							</tr>
							<tr>
								<td>J4</td>
								<td>과장</td>
							</tr>
							<tr>
								<td>J5</td>
								<td>대리</td>
							</tr>
							<tr>
								<td>J6</td>
								<td>사원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- The Modal -->
			<div class="modal" id="jobModal">
				<div class="modal-dialog">
				<div class="modal-content">
			
					<!-- Modal Header -->
					<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
			
					<!-- Modal body -->
					<div class="modal-body">
						<label for="empNo">직위코드 :</label>
						<input type="text" id="depCode" name="depCode" required />

						<label for="empNo">직위명 :</label>
						<input type="text" id="depName" name="depName" required />
					</div>
			
					<!-- Modal footer -->
					<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">등록하기</button>
					</div>
			
				</div>
				</div>
				<script>
					$(function(){
						$("#noticeList>tbody>tr").click(function(){
							
						})
					})
				</script>    
			</div>
			
		</div>
	</div>

</body>
</html>