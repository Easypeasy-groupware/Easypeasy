<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#main{position: absolute; top: 120px;}
    .content-outer{width:1000px; margin-left:200px; padding-top:20px;}
    .content-outer *{box-sizing: border-box;}
    #address-group{font-size:20px; font-weight:600; color:rgb(93, 109, 75);}

    /*검색*/
    #searchKey{width:200px; height:25px; border:1px solid gray; border-radius:5px;}
    #searchBtn{width:50px; height:25px; border:0; border-radius:5px; background: rgb(166, 184, 145); color:white;}

    /*연락처 추가*/
    .newAdd{width:120px; height:25px; border:1px solid gray; border-radius:5px; padding-left:5px;}
    .addBtn{width:80px; height:25px; border:0; border-radius:5px;}
    #addBtn1{background: rgb(127, 127, 127); color:white;}
    #addBtn2{background: rgb(166, 184, 145); color:white;}

    /*주소록 리스트 헤더*/
    #sendMail{
        width:80px; height:25px; border:0; border-radius:5px; background: rgb(166, 184, 145); color:white;
        margin-bottom:10px;
    }
    #sendMail:hover{cursor:pointer; font-weight:600;}
    .subheading{margin-left:10px;}
    #pbSubheading{margin-left:90px;}

	/*리스트 테이블을 감싸는 div*/
	#psLike, #pbLike{height:250px; width:98%; overflow-y:auto;}
	
	
    /*주소록 리스트 테이블*/
    .like-tb{
        margin:auto;
        border-collapse: collapse;
    }
    .like-tb tr{border-radius:5px;}
    .like-tb tbody>tr:hover{background:rgb(233, 233, 233);}
    .like-tb thead>tr{background-color:rgb(210, 217, 201); position: sticky; top:0;}
    .like-tb th{padding:8px 0 8px 0;}
    .like-tb td{padding:3px 0 3px 0;}
    .like-tb input[type="checkbox"]{accent-color:rgb(166, 184, 145);}
    .addLike:hover, .empLike:hover{cursor: pointer;}
    
    /*스크롤*/
	#psLike::-webkit-scrollbar, #pbLike::-webkit-scrollbar{width:5px;}
	#psLike::-webkit-scrollbar-thumb, #pbLike::-webkit-scrollbar-thumb{background-color:rgb(166, 184, 145); border-radius:5px;}
	#psLike::-webkit-scrollbar-track, #pbLike::-webkit-scrollbar-track{background-color:white;}

</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div id="main">

		<jsp:include page="addMenubar.jsp"/>
		
		<div class="content-outer">

			<p id="address-group">즐겨찾기</p>

			<div class="search" align="right">
				<input type="text" id="searchKey" placeholder="이름, 회사, 전화번호">
				<button id="searchBtn">검색</button>
			</div>

			<div class="addNew">
				<form action="insertNewPs.add" method="post" id="simpleAddForm">
				<input type="hidden" name="empNo" value="${ loginUser.empNo }">
					<input type="text" class="newAdd" placeholder="이름" name="addName">
					<input type="text" class="newAdd" placeholder="이메일" name="email">
					<input type="text" class="newAdd" placeholder="휴대폰" name="phone">
					<button type="button" class="addBtn" id="addBtn1" onclick="sendSimpleAdd();">추가정보</button>
					<button type="button" class="addBtn" id="addBtn2" onclick="insertSimpleAdd();">추가</button>
				</form>
			</div>
			<script>
				function sendSimpleAdd(){ // 간편주소록 상세정보 추가하기
					let addName = $("input[name=addName]").val();
					let email = $("input[name=email]").val();
					let phone = $("input[name=phone]").val();
					if(!addName && !email && !phone){
						swal({
							title: "간편주소록 정보추가", 
							text: "입력된 내용이 없습니다!", 
							icon: "error",
							button: "확인",
						});
					}else{
						location.href = "sendSimple.add?addName=" + addName + "&email=" + email + "&phone=" + phone ;
					}
				}
				
				function insertSimpleAdd(){ // 간편주소록 insert
					let addName = $("input[name=addName]").val();
					let email = $("input[name=email]").val();
					let phone = $("input[name=phone]").val();
					if(!addName && !email && !phone){
						swal({
							title: "간편 주소록 추가", 
							text: "입력된 내용이 아무것도 없습니다!", 
							icon: "error",
							button: "확인",
						});
					}else{
						$("#simpleAddForm").submit();
					}
				}
			</script>

			<br><br>

			<button id="sendMail">메일쓰기</button>
			<span class="subheading" id="psSubheading"><b>개인주소록 (${fn:length(p)}개)</b></span>

			<br>

			<div id="psLike">
				<table class="like-tb psLike-tb">
					<colgroup>
						<col style="width:50px;">
						<col style="width:50px;">
						<col style="width:150px;"><!--이름-->
						<col style="width:150px;"><!--휴대폰-->
						<col style="width:150px;"><!--이메일-->
						<col style="width:300px;"><!--메모-->
						<col style="width:150px;"><!--그룹-->
					</colgroup>
					<thead align="center">
						<tr>
							<th><input type="checkbox" id="psCheck"></input></th>
							<th></th>
							<th>이름</th>
							<th>휴대폰</th>
							<th>이메일</th>
							<th>메모</th>
							<th>그룹</th>
						</tr>
					</thead>
					<tbody align="center" id="ps-tbody">
					<c:choose>
						<c:when test="${ empty p }">
							<tr>
								<td colspan="7" style="text-align:center;">😓 즐겨찾는 개인주소록이 없습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="p" items="${ p }">
								<tr>
									<td style="display:none" class="addNo-td">${ p.addNo }</td>
									<td><input type="checkbox" class="ps-checkbox"></input></td>
									<td class="addLike starLike">⭐</td>
									<td class="clck-detail">${ p.addName }</td>
									<td class="clck-detail">${ p.phone }</td>
									<td class="clck-detail">${ p.email }</td>
									<td>${ p.memo }</td>
									<td>${ p.group.groupName }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>

			<script>
				$("#psCheck").click(function(){
					if($(this).prop("checked")){
						$(".ps-checkbox").prop("checked", true);
					
					}else {
						$(".ps-checkbox").prop("checked", false);
					}
				})
				
			</script>

			<br><br>

			<span class="subheading" id="pbSubheading"><b>공유주소록 (${fn:length(e) + fn:length(s)}개)</b></span>
			<div id="pbLike">
				<table class="like-tb pbLike-tb">
					<colgroup>
						<col style="width:50px;">
						<col style="width:50px;">
						<col style="width:150px;"><!--이름-->
						<col style="width:150px;"><!--휴대폰-->
						<col style="width:150px;"><!--이메일-->
						<col style="width:300px;"><!--메모-->
						<col style="width:150px;"><!--그룹-->
					</colgroup>
					<thead align="center">
						<tr>
							<th><input type="checkbox" id="psCheck"></input></th>
							<th></th>
							<th>이름</th>
							<th>휴대폰</th>
							<th>이메일</th>
							<th>메모</th>
							<th>그룹</th>
						</tr>
					</thead>
					<tbody align="center" id="ps-tbody">
						<c:choose>
						<c:when test="${ empty e and empty s }">
							<tr>
								<td colspan="7" style="text-align:center;">😓 즐겨찾는 공유주소록이 없습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="e" items="${ e }">
								<tr>
									<td style="display:none" class="empNo-td">${ e.empNo }</td>
									<td><input type="checkbox" class="ps-checkbox"></input></td>
									<td class="empLike starLike">⭐</td>
									<td class="clck-detail">${ e.empName }</td>
									<td class="clck-detail">${ e.phone }</td>
									<td class="clck-detail">${ e.email }</td>
									<td></td>
									<td>${ e.deptName }</td>
								</tr>
							</c:forEach>
							<c:forEach var="s" items="${ s }">
								<tr>
									<td style="display:none" class="addNo-td">${ s.addNo }</td>
									<td><input type="checkbox" class="ps-checkbox"></input></td>
									<td class="addLike starLike">⭐</td>
									<td class="clck-detail">${ s.addName }</td>
									<td class="clck-detail">${ s.phone }</td>
									<td class="clck-detail">${ s.email }</td>
									<td>${ s.memo }</td>
									<td>${ s.group.groupName }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>

			<script>
				$("#psCheck").click(function(){ /*체크박스*/
					if($(this).prop("checked")){
						$(".ps-checkbox").prop("checked", true);
					
					}else {
						$(".ps-checkbox").prop("checked", false);
					}
				})
				$(".ps-checkbox").click(function(){
					if($(this).prop("checked")){
						
					}else{
						$("#psCheck").prop("checked", false);
					}
				})

				$(".addLike").click(function(){ /*개인주소록 & 외부주소록 별 누르면 실행할 내용*/
					$(this).parent().remove();
					$.ajax({
						url:"deleteFavAdd.add",
						data:{
							empNo:${loginUser.empNo},
							addNo:$(this).siblings().eq(0).text()
						},
						success:function(result){
							if(result == "fail"){
								console.log("즐겨찾기 삭제용 ajax 통신 실패");
							}
						},error:function(){
							console.log("즐겨찾기 삭제용 ajax 통신 실패");
						}
					})
					
				})
				
				$(".empLike").click(function(){ /*별 누르면 실행할 내용*/
					$(this).parent().remove();
					$.ajax({
						url:"deleteFavEmp.add",
						data:{
							empNo:${loginUser.empNo},
							addEmpNo:$(this).siblings().eq(0).text()
						},
						success:function(result){
							if(result == "fail"){
								console.log("즐겨찾기 삭제용 ajax 통신 실패");
								$(this).parent().remove();
							}
						},error:function(){
							console.log("즐겨찾기 삭제용 ajax 통신 실패");
						}
					})
					
				})

				$(function(){
					$("#sendMail").click(function(){ /*메일쓰기 누르면 실행할 내용*/
						
					})
				})

				
			</script>

			


		</div>
	</div>

</body>
</html>