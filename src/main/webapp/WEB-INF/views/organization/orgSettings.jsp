<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
/* 전체 wrapper */
  .wrapper {width: 1200px;margin: 0 auto; width: 1200px;margin: 0 auto; position: absolute; top: 120px;}
  body {font-family: Arial, sans-serif;	margin: 0; padding: 0;}

 /* 게시판 스타일 */
	.board {width: 1000px; float: right;}
	.board>.board1{width:50%; float:left;}
	.board>.board2{width:50%; float:right;}
	.container {margin: 10px auto; width: 90%;  padding: 20px;}
	h3 {padding-left: 25px; padding-top: 15px; float: left		!important;}
    table {border-collapse: collapse; width: 100%;}
	tr, th, td {text-align: center; padding: 8px; border-bottom: 1px solid #ccc;}
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
				<h3><b style="color:rgb(93, 109, 75);">부서관리</b></h3>
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
							<c:forEach var="d" items="${dList}">
								<tr>
									<td>${d.deptCode}</td>
									<td>${d.deptName}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 등록 The Modal -->
			<div class="modal" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
				
						<!-- Modal body -->
						<form action="insertDept.org" method="post">
							<div class="modal-body">
								<label for="depCode">부서코드 :</label>
								<input type="text" id="deptCode" name="deptCode" required />
		
								<label for="depName">부서명 :</label>
								<input type="text" id="deptName" name="deptName" required />
							</div>
						<!-- Modal footer -->
							<div class="modal-footer">
								<button type="submit" class="btn btn-success" >등록하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<!-- 수정/삭제 The Modal -->
			<div class="modal" id="udModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
				
						<!-- Modal body -->
						<form action="updateDept.org" method="post" id="updateDept">
							<div class="modal-body">
								<label for="deptCode">부서코드 :</label>
								<input type="text" id="deptCode" name="deptCode" value="${d.deptCode}" />
		
								<label for="deptName">부서명 :</label>
								<input type="text" id="deptName" name="deptName" value="${d.deptName}" />
							</div>
						<!-- Modal footer -->
							<div class="modal-footer">
								<a class="btn btn-danger" onclick="updateSubmit();">수정하기</a>
								<a class="btn btn-dark" onclick="deleteSubmit();" >삭제하기</a> 
							</div>
						</form>
						
						<script>
							function updateSubmit(){
								$("#updateDept").attr("action", "updateDept.org").submit();
							}
							
							function deleteSubmit(){
								$("#updateDept").attr("action", "deleteDept.org").submit();
							}
						</script>
						
						
					</div>
				</div>
			</div>
			
				<script>
					$(document).ready(function() {
						  $('#depList tbody tr').click(function() {
						    // tr 클릭시 이벤트 처리
						    var deptCode = $(this).find('td:first').text();
						    var deptName = $(this).find('td:eq(1)').text();
	
						 	// 모달창에 부서코드와 직무명 출력
						    $('#udModal #deptCode').val(deptCode);
						    $('#udModal #deptName').val(deptName);

						    // 모달창 열기
						    $('#udModal').modal('show');
						  });

						  // 모달창 내부 "닫기" 버튼 클릭 이벤트 처리
						  $('#udModal .close').click(function() {
						    $('#udModal').modal('hide');
						  });
					});
				</script>   
				
	<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
				
			<div class="board2">
				<br><br>
				<h3><b style="color:rgb(93, 109, 75);">직위관리</b></h3>
				<br>
				<div class="container position">
					<button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#jobModal" style="float:right;">등록하기</button>
					<br><br>
					<table id="jobList">
						<thead>
							<tr>
								<th>직위코드</th>
								<th>직위명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="j" items="${jList}">
								<tr>
									<td>${j.jobCode}</td>
									<td>${j.jobName}</td>
								</tr>
							</c:forEach>
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
					<form action="insertJob.org" method="post">
						<div class="modal-body">
							<label for="empNo">직위코드 :</label>
							<input type="text" id="jobCode" name="jobCode" value="${j.jobCode}" required />
	
							<label for="empNo">직위명 :</label>
							<input type="text" id="jobName" name="jobName" value="${j.jobName}" required />
						</div>
				
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">등록하기</button>
						</div>
					</form>
				</div>
				</div>
			</div>
			
			<!-- 수정/삭제 The Modal -->
			<div class="modal" id="jjModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
				
						<!-- Modal body -->
						<form action="updateJob.org" method="post" id="updateJob">
							<div class="modal-body">
								<label for="jobCode">직위코드 :</label>
								<input type="text" id="jobCode" name="jobCode" value="${j.jobCode}" />
		
								<label for="jobName">직위명 :</label>
								<input type="text" id="jobName" name="jobName" value="${j.jobName}" />
							</div>
						<!-- Modal footer -->
							<div class="modal-footer">
								<a class="btn btn-danger" onclick="updateJSubmit();">수정하기</a>
								<a class="btn btn-dark" onclick="deleteJSubmit();" >삭제하기</a> 
							</div>
						</form>
						
						<script>
							function updateJSubmit(){
								$("#updateJob").attr("action", "updateJob.org").submit();
							}
							
							function deleteJSubmit(){
								$("#updateJob").attr("action", "deleteJob.org").submit();
							}
						</script>
						
						
					</div>
				</div>
			</div>
			
				<script>
					$(document).ready(function() {
						  $('#jobList tbody tr').click(function() {
						    // tr 클릭시 이벤트 처리
						    var deptCode = $(this).find('td:first').text();
						    var deptName = $(this).find('td:eq(1)').text();
	
						 	// 모달창에 부서코드와 직무명 출력
						    $('#jjModal #jobCode').val(deptCode);
						    $('#jjModal #jobName').val(deptName);

						    // 모달창 열기
						    $('#jjModal').modal('show');
						  });

						  // 모달창 내부 "닫기" 버튼 클릭 이벤트 처리
						  $('#jjModal .close').click(function() {
						    $('#jjModal').modal('hide');
						  });
					});
				</script>   
			
		</div>
	</div>

</body>
</html>