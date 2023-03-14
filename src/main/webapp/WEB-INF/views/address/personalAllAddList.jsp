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
<!--Bootstrap 5.3.0-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
<style>
    .content-outer{width:1000px; padding-left:10px; margin-left:200px;  padding-top:20px;}
    .content-outer *{box-sizing: border-box;}
    #address-group{font-size:20px; font-weight:600; display:inline-block;}
    #group-name{color:rgb(96, 96, 96); font-size:18px; font-weight:600;  margin-left:20px;}
    
    /*검색*/
    #searchKey{width:200px; height:25px; border:1px solid gray; border-radius:5px;}
    #searchBtn{width:50px; height:25px; border:0; border-radius:5px; background: rgb(166, 184, 145); color:white;}

    /*연락처 추가*/
    .newAdd{width:120px; height:25px; border:1px solid gray; border-radius:5px;}
    .addBtn{width:80px; height:25px; border:0; border-radius:5px;}
    #addBtn1{background: rgb(127, 127, 127); color:white;}
    #addBtn2{background: rgb(166, 184, 145); color:white;}

    /*주소록 리스트 헤더*/
    .subheading{display:inline-block; margin-left:650px;}
    .btnGroup{width:80px; height:25px; border:0; border-radius:5px; margin-bottom:10px; color:white;}
    .btnGroup:hover{cursor: pointer; font-weight:600;}
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

	<jsp:include page="addMenubar.jsp"/>
	
	<c:if test="${ not empty successMsg }">
		<script>
			swal({
				title:	'${successMsg.title}', 
				text: "${successMsg.content}", 
				icon: "success",
				button: "확인"
			});
		</script>
		<c:remove var="successMsg" scope="session"/>
	</c:if>
	
	<c:if test="${ not empty failMsg }">
		<script>
			swal({
				title: '${failMsg.title}', 
				text: "${failMsg.content}", 
				icon: "error",
				button: "확인",
			});
		</script>
		<c:remove var="failMsg" scope="session"/>
	</c:if>
	
    <div class="content-outer">
		<div class="search" align="right" style="float:right">
            <input type="text" id="searchKey" placeholder="이름, 회사, 전화번호">
            <button id="searchBtn">검색</button>
        </div>
        
        <p id="address-group">개인주소록</p>
        <p id="group-name">전체</p>

		<br>


        <div class="addNew">
            <input type="text" class="newAdd" placeholder="이름">
            <input type="text" class="newAdd" placeholder="이메일">
            <input type="text" class="newAdd" placeholder="휴대폰">
            <button class="addBtn" id="addBtn1">추가정보</button>
            <button class="addBtn" id="addBtn2">추가</button>
        </div>

        <br><br>
        

        <button class="btnGroup" id="delete" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</button>
        <button class="btnGroup" id="change-group" data-bs-toggle="modal" data-bs-target="#changeModal">그룹변경</button>
        <button class="btnGroup" id="sendMail">메일쓰기</button>

		<p class="subheading" id="psSubheading"> 총 <b>${ count }</b> 명</p>
        <br>

        <div id="psLike">
            <table id="addList">
                <copgroup>
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
                </copgroup>
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
	                        <td>${ a.memo }</td>
	                        <td>${ a.group.groupName }</td>
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
            
            $(".like").click(function(){ //즐겨찾기
                if($(this).html()=="⭐"){
                    $(this).html('<i class="fi fi-rr-star"></i>');
                }else{
                    $(this).html("⭐");
                }
            })

			$(function(){
                $('.clck-detail').on("click", $('.clck-detail'), function(){
                    location.href = 'detail.ad?no=' + $(this).siblings().eq(0).text(); 
                })
            })
        </script>

        <br><br>
        <!-- 삭제 확인용 모달-->
        <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <p class="modal-title" style="font-weight:600">연락처 삭제</p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <form>
                        <div class="modal-body">
                            선택한 연락처를 정말 삭제하시겠습니까?
                            <br><br>
                            <button type="button" class="btn-event-gray" data-bs-dismiss="modal" id="modal-close-btn">취소</button>
                            <button type="submit" class="btn-event-green" id="modal-del-btn">삭제</button>
                        </div>
                        
                    </form>

                </div>
            </div>
        </div>
        <script>

            
        </script>

        <!-- 그룹 변경용 모달-->
        <div class="modal fade" id="changeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <p class="modal-title" style="font-weight:600">그룹 변경</p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <form action="">
                        <div class="modal-body">
                            <select class="group-select" name="groupNo">
                                <option>선택안함</option>
                                <option>friends</option>
                                <option>aaa</option>
                                <option>거래처</option>
                            </select>
                            <button type="button" id="add-new-group" data-bs-dismiss="modal" data-bs-target="#addNewGroupModal" data-bs-toggle="modal">+</button>
                            <br><br>
                            <button type="button" class="btn-event-gray" data-bs-dismiss="modal" id="modal-close-btn">닫기</button>
                            <button type="submit" class="btn-event-green" id="modal-change-btn">변경하기</button>
                        </div>
                        
                    </form>
    
                </div>
              </div>
        </div>

        <!-- 그룹 추가용 모달 -->
        <div class="modal fade" id="addNewGroupModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header">
                    <p class="modal-title" style="font-weight:600">새 그룹 추가</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="">

                    <div class="modal-body">
                        <input type="text" id="modal-input" name="newGroup">
                        <br><br>
                        <button type="button" class="btn-event-gray" id="modal-close-btn" data-bs-dismiss="modal" data-bs-target="#changeModal" data-bs-toggle="modal">닫기</button>
                        <button type="button" class="btn-event-green" id="modal-add-btn" data-bs-dismiss="modal" data-bs-target="#changeModal" data-bs-toggle="modal">추가</button>
                    </div>
                    
                </form>
              </div>
            </div>
        </div>

        <div align="center">
            <ul id="paging">
            <c:if test="${ not empty list }">
            
                <c:if test="${ pi.currentPage ne 1 }">
                   	<li><a href="internalEnt.add?cpage=${ pi.currentPage-1 }"> < </a></li>
                </c:if>
                   
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            		<c:choose>
            		<c:when test="${ pi.currentPage eq p }">
	            		<li class="on"><a href="internalEnt.add?cpage=${ p }">${ p }</a></li>
            		</c:when>
            		<c:otherwise>
            			<li><a href="internalEnt.add?cpage=${ p }">${ p }</a></li>
            		</c:otherwise>
            		</c:choose>
                </c:forEach>

                   
                <c:if test="${ pi.currentPage ne pi.maxPage }">
                   	<li><a href="internalEnt.add?cpage=${ pi.currentPage+1 }"> > </a></li>
               	</c:if>
            </c:if>
            </ul>
        </div>
       
    
    </div>
</body>
</html>