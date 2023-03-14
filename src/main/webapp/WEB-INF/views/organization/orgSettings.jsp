<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
		<div class="sidebar">
			<div class="topbtn">
				<button type="button" class="btn btn-success">관리자</button>
			</div>
			<div class="menu">
				<ul>
					<li><a href="#">인사관리부</a></li>
					<li><a href="#">경영지원부</a></li>
					<li class="submenu">
						<a href="#" class="dep">영업부</a>
						<ul>
							<li><a href="#">영업 1팀</a></li>
							<li><a href="#">영업 2팀</a></li>
							<li><a href="#">영업 3팀</a></li>
						</ul>
					</li>   
					<li><a href="#">마케팅부</a></li>
				</ul>
			</div>
		</div>

		<script>
			$(document).ready(function () {
				$('.menu li').click(function () {
					$(this).toggleClass('active');
				});
			});
		</script>
	
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
								<th>직무코드</th>
								<th>직무명</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>인사관리부</td>
							</tr>
							<tr>
								<td>2</td>
								<td>경영지원부</td>
							</tr>
							<tr>
								<td>3</td>
								<td>영업1</td>
							</tr>
							<tr>
								<td>4</td>
								<td>영업2</td>
							</tr>
							<tr>
								<td>5</td>
								<td>영업3</td>
							</tr>
							<tr>
								<td>6</td>
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
						<label for="empNo">직무코드 :</label>
						<input type="text" id="depCode" name="depCode" required />

						<label for="empNo">직무명 :</label>
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

			<div class="board2">
				<br><br>
				<h2>직위관리</h2>
				<br>
				<div class="container position">
					<button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#myModal" style="float:right;">등록하기</button>
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
								<td>1</td>
								<td>이사</td>
							</tr>
							<tr>
								<td>2</td>
								<td>부장</td>
							</tr>
							<tr>
								<td>3</td>
								<td>과장</td>
							</tr>
							<tr>
								<td>4</td>
								<td>대리</td>
							</tr>
							<tr>
								<td>5</td>
								<td>사원</td>
							</tr>
							<tr>
								<td>5</td>
								<td>사원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>