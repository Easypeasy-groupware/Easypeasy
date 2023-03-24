<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--flaticon-->
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>

<style>
	#main{position: absolute; top: 120px; left: 330px;}
	.content-outer{width:1000px; padding-left:10px; margin-left:200px; padding-top:20px;}
	.content-outer *{box-sizing: border-box;}
	
	#address-group{font-size:20px; font-weight:600; display:inline-block;}
	#group-name{color:rgb(96, 96, 96); font-size:18px; font-weight:600;}
	
	/*검색*/
	#searchKey{width:200px; height:25px; border:1px solid gray; border-radius:5px;}
	#searchBtn{width:50px; height:25px; border:0; border-radius:5px; background: rgb(166, 184, 145); color:white;}
	
	.subheading{display:inline-block; margin-left:850px;}
	
	/*주소록 리스트 헤더*/
	.btnGroup{width:80px; height:25px; border:0; border-radius:5px; margin-bottom:10px; color:white;}
	.btnGroup:hover{cursor: pointer; font-weight:600;}
	#sendMail{background: rgb(77, 88, 64);}
	
	
	/*주소록 리스트 테이블*/
	#addList{
	    margin:auto;
	    border-collapse: collapse;
	}
	#addList th{border-bottom:1px solid gray; padding:5px 0 5px 0;}
	#addList td{padding:3px 0 3px 0; height:40px;}
	#addList input[type="checkbox"]{accent-color:rgb(166, 184, 145);}
	.like:hover{cursor: pointer;}
	#addList tbody>tr:hover{background:rgb(233, 233, 233); font-weight:600; cursor:pointer;}
	
	/*페이징바*/
	#paging{text-align: center; display: inline-block; padding-left :0;}
	#paging li {text-align: center; float: left; list-style:none; border-radius:10px; margin:2px; background-color: rgb(234, 234, 234);}
	#paging li a {display: block; font-size: 12px; color: black; padding: 5px 10px; box-sizing: border-box; text-decoration-line:none;}
	#paging li.on {background:rgb(166, 184, 145);}
	#paging li.on a { color: white;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

    <div id="main">
	
		<jsp:include page="addMenubar.jsp"/>
		
		<div class="content-outer">
		
			<div class="search" align="right" style="float:right">
				<input type="text" id="searchKey" placeholder="이름, 회사, 전화번호">
				<button id="searchBtn">검색</button>
			</div>

			<p id="address-group">사내주소록</p>
			<p id="group-name"><span id="dName"></span></p>
	

			<br><br>
			
			<script>
				$(function(){
					if('${dept}'=='hr'){
						console.log("인사관리팀");
						$("#dName").html("인사관리팀");
					}else if('${dept}'=='as'){
						$("#dName").html("경영지원팀");
					}else if('${dept}'=='sales1'){
						$("#dName").html("영업 1팀");
					}else if('${dept}'=='sales2'){
						$("#dName").html("영업 2팀");
					}else if('${dept}'=='sales3'){
						$("#dName").html("영업 3팀");
					}else if('${dept}'=='marketing'){
						console.log("마케팅팀");
						$("#dName").html("마케팅팀");
					}
				})
			</script>
			
			<button class="btnGroup" id="sendMail">메일쓰기</button>
			
			<p class="subheading" id="psSubheading"> 총 <b>${ count }</b>명</p>
			
			<br>

			<div id="psLike">
				<table id="addList">
					<colgroup>
						<col style="width:50px;"><!-- 체크박스 -->
						<col style="width:50px;"><!-- 별 -->
						<col style="width:100px;"><!--이름-->
						<col style="width:100px;"><!--직위-->
						<col style="width:150px;"><!--부서-->
						<col style="width:200px;"><!--휴대폰-->
						<col style="width:250px;"><!--이메일-->
						<col style="width:150px;"><!--그룹-->
					</colgroup>
					<thead align="center">
						<tr>
							<th style="display:none">no</th>
							<th><input type="checkbox" id="psCheck"></input></th>
							<th></th>
							<th>이름</th>
							<th>직위</th>
							<th>부서</th>                        
							<th>휴대폰</th>
							<th>이메일</th>
							<th>그룹</th>
						</tr>
					</thead>
					<tbody align="center" id="ps-tbody">
						<c:forEach var="a" items="${ list }">
							<tr>
								<td style="display:none">${ a.empNo }</td>
								<td><input type="checkbox" class="ps-checkbox"></input></td>
								<td class="like">
									<c:forEach var = "f" items="${ fList }">
									
										<c:if test="${ a.empNo eq f.addEmpNo}">
											⭐
										</c:if>
										
									</c:forEach>
		
								</td>
								<td class="clck-detail">${ a.empName }</td>
								<td class="clck-detail">${ a.jobName }</td>
								<td class="clck-detail">${ a.deptName }</td>	                        
								<td class="clck-detail">${ a.phone }</td>
								<td class="clck-detail">${ a.email }</td>
								<c:choose>
									<c:when test= "${ empty a.deptName }" >
										<td>기타</td>
									</c:when>
									<c:otherwise>
										<td>${ a.deptName }</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
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
				
				
				$(function(){ //즐겨찾기 리스트 출력
					$(".like").each(function(i, e){
						if($(this).html().trim().length == 0){
							$(this).html('<img src="resources/common_images/star_vacant.png">');
						}
						
					})
					
				})

				$(".like").click(function(){ // 즐겨찾기
					if($(this).html()=="⭐"){
						$(this).html('<img src="resources/common_images/star_vacant.png">');
						$.ajax({
							url:"deleteFavEmp.add",
							data:{
								empNo:${loginUser.empNo},
								addEmpNo:$(this).siblings().eq(0).text()
							},
							success:function(result){
								if(result == "fail"){
									console.log("즐겨찾기 삭제용 ajax 통신 실패");
								}
							},error:function(){
								console.log("즐겨찾기 삭제용 ajax 통신 실패");
							}
						})
					}else{
						$(this).html("⭐");
						$.ajax({
							url:"insertFavEmp.add",
							data:{
								empNo:${loginUser.empNo},
								addEmpNo:$(this).siblings().eq(0).text()
							},
							success:function(result){
								if(result == "fail"){
									console.log("즐겨찾기 삭제용 ajax 통신 실패");
								}
							},error:function(){
								console.log("즐겨찾기 삭제용 ajax 통신 실패");
							}
						})
					}
				})
				
				
				$(".clck-detail").click(function(){
					location.href = 'empInfo.add?no=' + $(this).siblings().eq(0).text(); 
				})


			</script>

			<br>
			
			<div align="center">
				<ul id="paging">
					<c:if test="${ pi.currentPage ne 1 }">
						<li><a href="internalEnt.add?cpage=${ pi.currentPage-1 }&no=${loginUser.empNo}"> < </a></li>
					</c:if>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:choose>
						<c:when test="${ pi.currentPage eq p }">
							<li class="on"><a href="internalDept.add?dept=${ dept }&cpage=${ p }&no=${loginUser.empNo}">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="internalDept.add?dept=${ dept }&cpage=${ p }">${ p }</a></li>
						</c:otherwise>
						</c:choose>
					</c:forEach>

					
					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<li><a href="internalDept.add?dept=${ dept }&cpage=${ pi.currentPage+1 }"> > </a></li>
					</c:if>
				</ul>
			</div>
			
		
		</div>
	</div>
</body>
</html>