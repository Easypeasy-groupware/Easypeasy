<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--flaticon-->
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<!--Bootstrap 5.3.0-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
<style>
	#main{position: absolute; top: 120px; left: 330px;}
    .content-outer{width:1000px; padding-left:10px; margin-left:200px;  padding-top:20px;}
    .content-outer *{box-sizing: border-box;}
    #address-group{font-size:20px; font-weight:600; display:inline-block;}
    #group-name{color:rgb(96, 96, 96); font-size:18px; font-weight:600;  margin-left:20px;}
    
    /*검색*/
    #searchKey{width:200px; height:25px; border:1px solid gray; border-radius:5px;}
    #searchBtn{width:50px; height:25px; border:0; border-radius:5px; background: rgb(166, 184, 145); color:white;}

    /*연락처 추가*/
    .newAdd{width:120px; height:25px; border:1px solid gray; border-radius:5px; padding-left:5px;}
    .addBtn{width:80px; height:25px; border:0; border-radius:5px;}
    #addBtn1{background: rgb(127, 127, 127); color:white;}
    #addBtn2{background: rgb(166, 184, 145); color:white;}

    /*주소록 리스트 헤더*/
    .subheading{display:inline-block; margin-left:750px;}
    .btnGroup{width:80px; height:25px; border:0; border-radius:5px; margin-bottom:10px; color:white;}
    .btnGroup:hover{cursor: pointer;}
    #delete{background: rgb(134, 134, 134); text-align:center;}
    #change-group{background: rgb(166, 184, 145);}
    #sendMail{background: rgb(77, 88, 64);}


    /*주소록 리스트 테이블*/
    #addList{
        margin:auto;
        border-collapse: collapse;
    }
    #addList th{border-bottom:1px solid gray; padding:5px 0 5px 0;}
    #addList td{padding:3px 0 3px 0;}
    #addList input[type="checkbox"]{accent-color:rgb(166, 184, 145);}
    #addList tbody>tr:hover{background:rgb(233, 233, 233);}

    /*모달 공통css*/
    .modal-header{padding-right:20px;}
    .modal-body{text-align: center;}

    /*삭제용 모달*/
    #modal-close-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(158, 158, 158); display:inline-block;}
    #modal-del-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(166, 184, 145); display:inline-block;}
    
    /*그룹변경 & 추가용 모달*/
    .modal-close-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(158, 158, 158); display:inline-block;}
    .modal-add-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(166, 184, 145); display:inline-block;}
    .modal-change-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(166, 184, 145); display:inline-block;}
    .group-select{width:220px; height:40px; border:1px solid gray; border-radius:5px;}
    #add-new-group{width:40px; height:40px; border:0; border-radius:5px; color:white; background:rgb(122, 135, 106); text-align:center;}
    #modal-input{width:60%; height:40px; margin-top:10px; border:1px solid gray; border-radius:5px;}
    

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

			<p id="address-group">🗑️ 휴지통</p>

			<br>
		
			<br><br>
			

			<button class="btnGroup" id="delete">영구삭제</button>
			<button class="btnGroup" id="change-group" data-bs-toggle="modal" data-bs-target="#changeModal">복구</button>
			<script>
				$(function(){
					
					const list = []; //빈 배열 생성
					
					$("#delete").click(function(){ // 삭제하기 버튼 클릭시
						let num = $("input:checkbox[name=name-checkbox]:checked").length; // 선택한 체크박스의 개수
						if(num == 0){
							$("#deleteFailModal").modal("show");
						}else{
							$("#add-num").text(num);
							$("#deleteModal").modal("show");
						}
					})
				})
			</script>
			<p class="subheading" id="psSubheading"> 총 <b>${ count }</b> 개</p>
			<br>

			<div id="psLike">
				<table id="addList">
					<colgroup>
						<col style="width:50px;">
						<col style="width:100px;"><!--이름-->
						<col style="width:100px;"><!--직위-->
						<col style="width:150px;"><!--휴대폰-->
						<col style="width:150px;"><!--이메일-->
						<col style="width:100px;"><!--부서-->
						<col style="width:120px;"><!--회사-->
						<col style="width:50px;"><!--메모-->
						<col style="width:100px;"><!--그룹-->
					</colgroup>
					<thead align="center">
						<tr>
							<th style="display:none">no</th>
							<th><input type="checkbox" id="psCheck"></input></th>
							<th>이름</th>
							<th>직위</th>
							<th>휴대폰</th>
							<th>이메일</th>
							<th>부서</th>
							<th>회사</th>
							<th>메모</th>
							<th>그룹</th>
						</tr>
					</thead>
					<tbody align="center" id="ps-tbody">
					<c:choose>
						<c:when test="${ empty list }">
							<tr><td colspan="11"> 등록된 개인주소록이 없습니다 🤐</td></tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="a" items="${ list }">
								<tr>
									<td style="display:none">${ a.addNo }</td>
									<td><input type="checkbox" class="ps-checkbox" name="name-checkbox"></input></td>
									<td class="clck-detail">${ a.addName }</td>
									<td class="clck-detail">${ a.addJob }</td>
									<td class="clck-detail">${ a.phone }</td>
									<td class="clck-detail">${ a.email }</td>
									<td class="clck-detail">${ a.addDept }</td>
									<td class="clck-detail">${ a.addEmp }</td>
									<td>
									<c:if test="${ not empty a.memo }">
										<img src="resources/common_images/memo-img.png">
									</c:if>
									</td>
									<td>${ a.group.groupName }</td>
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
			</script>

			<br><br>
			<!-- 삭제 불가용 모달-->
			<div class="modal fade" id="deleteFailModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header" style="background-color:rgb(166, 184, 145);">
							<p class="modal-title" style="font-weight:600">영구 삭제</p>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<br>
							⛔ 연락처를 한 개 이상 선택해 주세요❗
							<br><br><br>
							<button type="button" class="btn-event-green" id="modal-del-btn" data-bs-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 삭제 확인용 모달-->
			<div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header" style="background-color:rgb(166, 184, 145);">
							<p class="modal-title" style="font-weight:600">연락처 삭제</p>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							선택한 <span id="add-num" style="font-weight:600;"></span>개의 연락처를 정말 삭제하시겠습니까?
							<br><br>
							<button type="button" class="btn-event-gray" data-bs-dismiss="modal" id="modal-close-btn">취소</button>
							<button type="button" class="btn-event-green" id="modal-del-btn" onclick="deleteAddList();">삭제</button>
						</div>
					</div>
				</div>
			</div>
			<script>
				function deleteAddList(){ // 선택한 주소록 다중 삭제용 ajax
					const aList = []; //빈 배열 생성
					for(var i=0; i<$("#ps-tbody>tr").length; i++){
						if($("#ps-tbody>tr").eq(i).children().find("input[type='checkbox']").is(":checked")){
							
							//var setData={}; // 배열에 넣을 데이터쌍 변수 생성
							//setData{'addNo'} = $("#ps-tbody>tr").eq(i).children().eq(0).text();
							aList.push($("#ps-tbody>tr").eq(i).children().eq(0).text());
						}
					}
					var objParams = {"addList" : aList}
					
					$.ajax({
						url:"deleteFromBin.add",
						dataType : "json",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						type:"post",
						data : objParams,
						success : function(result){
							if(result > 0){
								location.href= "psAll.add";
							}
						},
						error : function(){
							console.log("주소록 삭제용 ajax 통신 실패");
						}
					});
				}
				
				
			</script>
			<script>
				$(function(){
					$("#add-new-group").click(function(){
						$("#insertModal").modal('show');
					})
				})
				function changeAddList(val){// 선택한 주소록 다중 그룹변경용 ajax
					const aList = []; //빈 배열 생성
					for(var i=0; i<$("#ps-tbody>tr").length; i++){
						if($("#ps-tbody>tr").eq(i).children().find("input[type='checkbox']").is(":checked")){
							aList.push($("#ps-tbody>tr").eq(i).children().eq(0).text());
						}
					}
					var objParams = {
							"addList" : aList, // 그룹을 업데이트할 주소록 번호배열 저장
							"groupNo" : val // 변경할 주소록그룹 번호 저장
							}
					
					$.ajax({
						url:"changeAddList.add",
						dataType : "json",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						type:"post",
						data : objParams,
						success : function(result){
							if(result > 0){
								location.href= "psAll.add";
							}
						},
						error : function(){
							console.log("주소록 그룹변경용 ajax 통신 실패");
						}
					});
					
				}
			</script>
			

			<div align="center">
				<ul id="paging">
				<c:if test="${ not empty list }">
				
					<c:if test="${ pi.currentPage ne 1 }">
						<li><a href="internalEnt.add?cpage=${ pi.currentPage-1 }"> < </a></li>
					</c:if>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:choose>
						<c:when test="${ pi.currentPage eq p }">
							<li class="on"><a href="addressBin.add?cpage=${ p }">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="addressBin.add?cpage=${ p }">${ p }</a></li>
						</c:otherwise>
						</c:choose>
					</c:forEach>

					
					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<li><a href="addressBin.add?cpage=${ pi.currentPage+1 }"> > </a></li>
					</c:if>
				</c:if>
				</ul>
			</div>
		
		
		</div>
	</div>

</body>
</html>