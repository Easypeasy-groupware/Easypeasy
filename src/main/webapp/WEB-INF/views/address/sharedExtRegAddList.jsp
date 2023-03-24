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
    #searchKey{width:200px; height:25px; border:1px solid gray; border-radius:5px; }
    #searchBtn{width:50px; height:25px; border:0; border-radius:5px; background: rgb(166, 184, 145); color:white;}

    
    /*주소록 리스트 헤더*/
    .btnGroup{width:80px; height:25px; border:0; border-radius:5px; margin-bottom:10px; color:white;}
	.btnGroup:hover{cursor: pointer; font-weight:600;}
	#sendMail{background: rgb(77, 88, 64);}
	.subheading{display:inline-block; margin-left:820px;}

    /*주소록 리스트 테이블*/
    #addList{
        margin:auto;
        border-collapse: collapse;
    }
    #addList th{border-bottom:1px solid gray; padding:5px 0 5px 0;}
    #addList td{padding:3px 0 3px 0;}
    #addList input[type="checkbox"]{accent-color:rgb(166, 184, 145);}
    .like:hover{cursor: pointer;}
    #addList tbody>tr:hover{background:rgb(233, 233, 233); font-weight:600;}

    /*모달 공통css*/
    .modal-header{padding-right:20px;}
    .modal-body{text-align: center;}

    /*삭제용 모달*/
    #modal-close-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(158, 158, 158); display:inline-block;}
    #modal-del-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(166, 184, 145); display:inline-block;}
    
    /*그룹변경용 모달*/
    #modal-close-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(158, 158, 158); display:inline-block;}
    #modal-change-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(166, 184, 145); display:inline-block;}
    .group-select{width:220px; height:40px; border:1px solid gray; border-radius:5px;}
    #add-new-group{width:40px; height:40px; border:0; border-radius:5px; color:white; background:rgb(122, 135, 106); text-align:center;}

    /*그룹추가용 모달*/
    #modal-input{width:60%; height:40px; margin-top:10px; border:1px solid gray; border-radius:5px;}
    #modal-close-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(158, 158, 158); display:inline-block;}
    #modal-add-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(166, 184, 145); display:inline-block;}

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
			
			<p id="address-group">
			공유주소록
			<c:choose>
				<c:when test="${ ag eq '전체' }">
					전체
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${ empty ag.groupNo }">
							(기타)
						</c:when>
						<c:otherwise>
							(${ ag.groupName })
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			
			</p>
			<p id="group-name">📝 ${ loginUser.empName } ${ loginUser.jobName }님이 등록한 주소록</p>

			<br>

			<br><br>
			

			<button class="btnGroup" id="sendMail">메일쓰기</button>

			<p class="subheading" id="psSubheading"> 총 <b>${ count }</b> 명</p>
			<br>

			<div id="psLike">
				<table id="addList">
					<colgroup>
						<col style="width:50px;">
						<col style="width:50px;">
						<col style="width:100px;"><!--이름-->
						<col style="width:100px;"><!--직위-->
						<col style="width:150px;"><!--휴대폰-->
						<col style="width:150px;"><!--이메일-->
						<col style="width:100px;"><!--부서-->
						<col style="width:120px;"><!--회사-->
						<col style="width:100px;"><!--메모-->
						<col style="width:100px;"><!--그룹-->
					</colgroup>
					<thead align="center">
						<tr>
							<th style="display:none">no</th>
							<th><input type="checkbox" id="psCheck"></input></th>
							<th></th>
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
							<tr><td colspan="11"> ${ loginUser.empName }님이 등록한 공유주소록이 없습니다 😶‍🌫️</td></tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="a" items="${ list }">
								<tr>
									<td style="display:none">${ a.addNo }</td>
									<td><input type="checkbox" class="ps-checkbox"></input></td>
									<td class="like">
										<c:forEach var = "f" items="${ fList }">
										
											<c:if test="${ a.addNo eq f.addNo}">
												⭐
											</c:if>
											
										</c:forEach>
									</td>
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

				$(function(){ //즐겨찾기 리스트 출력
					$(".like").each(function(i, e){
						if($(this).html().trim().length == 0){
							$(this).html('<img src="resources/common_images/star_vacant.png">');
						}
						
					})
					
				})
				
				$(".like").click(function(){ //즐겨찾기
					if($(this).html()=="⭐"){
						$(this).html('<img src="resources/common_images/star_vacant.png">');
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
					}else{
						$(this).html("⭐");
						$.ajax({
							url:"insertFavAdd.add",
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
					}
				})

				$(".clck-detail").click(function(){ // 상세페이지
					location.href = 'extAddInfo.add?no=' + $(this).siblings().eq(0).text(); 
				})
			</script>

			<br><br>

			<div align="center">
				<ul id="paging">
				<c:if test="${ not empty list }">
				
				<c:choose>
				
					<c:when test="${ ag eq '전체' }">
					
						<c:if test="${ pi.currentPage ne 1 }">
							<li><a href="extReg.add?cpage=${ pi.currentPage-1 }"> < </a></li>
						</c:if>
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:choose>
							<c:when test="${ pi.currentPage eq p }">
								<li class="on"><a href="extReg.add?cpage=${ p }">${ p }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="extReg.add?cpage=${ p }">${ p }</a></li>
							</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${ pi.currentPage ne pi.maxPage }">
							<li><a href="extReg.add?cpage=${ pi.currentPage+1 }"> > </a></li>
						</c:if>
						
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ empty ag.groupNo }">
							
								<c:if test="${ pi.currentPage ne 1 }">
									<li><a href="extReg.add?cpage=${ pi.currentPage-1 }&group=0"> < </a></li>
								</c:if> 
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:choose>
									<c:when test="${ pi.currentPage eq p }">
										<li class="on"><a href="extReg.add?cpage=${ p }&group=0">${ p }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="extReg.add?cpage=${ p }&group=0">${ p }</a></li>
									</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${ pi.currentPage ne pi.maxPage }">
									<li><a href="extReg.add?cpage=${ pi.currentPage+1 }&group=0"> > </a></li>
								</c:if>
						
							</c:when>
							<c:otherwise>
								
								<c:if test="${ pi.currentPage ne 1 }">
									<li><a href="extReg.add?cpage=${ pi.currentPage-1 }&group=${ag.groupNo}"> < </a></li>
								</c:if> 
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:choose>
									<c:when test="${ pi.currentPage eq p }">
										<li class="on"><a href="extReg.add?cpage=${ p }&group=${ag.groupNo}">${ p }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="extReg.add?cpage=${ p }&group=${ag.groupNo}">${ p }</a></li>
									</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${ pi.currentPage ne pi.maxPage }">
									<li><a href="extReg.add?cpage=${ pi.currentPage+1 }&group=${ag.groupNo}"> > </a></li>
								</c:if>

							</c:otherwise>
						</c:choose>
						

					</c:otherwise>
				</c:choose>
				
				</c:if>
				</ul>
			</div>
		
		
		</div>
	</div>
</body>
</html>