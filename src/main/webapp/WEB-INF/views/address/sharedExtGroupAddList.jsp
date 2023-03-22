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
    .content-outer{width:1000px; padding-left:10px; margin-left:200px; padding-top:20px;}
    .content-outer *{box-sizing: border-box;}
    
    #address-group{font-size:20px; font-weight:600; display:inline-block;}
    #group-name{color:rgb(96, 96, 96); font-size:16px; font-weight:600;}

    /*검색*/
    #searchKey{width:200px; height:25px; border:1px solid gray; border-radius:5px;}
    #searchBtn{width:50px; height:25px; border:0; border-radius:5px; background: rgb(166, 184, 145); color:white;}


	.subheading{display:inline-block; margin-left:820px;}
	
	/*주소록 리스트 헤더*/
	.btnGroup{width:80px; height:25px; border:0; border-radius:5px; margin-bottom:10px; color:white;}
	.btnGroup:hover{cursor: pointer; font-weight:600;}
	#sendMail{background: rgb(77, 88, 64);}
	#myAddr{width:120px; background: rgb(166, 184, 145); float:right;}

    /*주소록 리스트 테이블*/
    #addList{
        margin:auto;
        border-collapse: collapse;
    }
    #addList th{border-bottom:1px solid gray; padding:5px 0 5px 0;}
    #addList td{height:40px;}
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

	<jsp:include page="addMenubar.jsp" />
	
    <div class="content-outer">
    
		<div class="search" align="right" style="float:right">
            <input type="text" id="searchKey" placeholder="이름, 회사, 전화번호">
            <button id="searchBtn">검색</button>
        </div>
        
        <p id="address-group">외부주소록</p>
        <p id="group-name">
        <c:choose>
			<c:when test="${ not empty ag.groupName }">
				${ ag.groupName }
			</c:when>
			<c:otherwise>
				기타
			</c:otherwise>
		</c:choose>
			(${ count }명)
        </p>

		<br><br>
		
        <button class="btnGroup" id="sendMail">메일쓰기</button>
        <button class="btnGroup" id="myAddr">등록한 연락처</button>
		<script>
			$("#myAddr").click(function(){
				if("${ag.groupNo}" == ""){
					console.log("0");
					location.href="extReg.add?group=0";
				}else{
					//console.log(${ag.groupNo});
					location.href="extReg.add?group=${ag.groupNo}";
				}
				
			})
		</script>
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
                    <col style="width:50px;"><!--메모-->
                    <col style="width:150px;"><!--그룹-->
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
                		<tr>
                			<td colspan="11">
                			<c:choose>
								<c:when test="${ not empty ag.groupName }">
									<b>${ ag.groupName }</b>
								</c:when>
								<c:otherwise>
									<b>기타</b>
								</c:otherwise>
							</c:choose>
                			그룹에 등록된 공유주소록이 없습니다😅
                			</td>
                		</tr>
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
            
            $(".like").click(function(){//즐겨찾기
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
            	
            	<c:if test="${ pi.currentPage ne 1 }">
                   	<li><a href="externalGroup.add?cpage=${ pi.currentPage-1 }"> < </a></li>
                </c:if>
                   
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            		<c:choose>
            		<c:when test="${ pi.currentPage eq p }">
	            		<li class="on"><a href="externalGroup.add?cpage=${ p }">${ p }</a></li>
            		</c:when>
            		<c:otherwise>
            			<li><a href="externalGroup.add?cpage=${ p }">${ p }</a></li>
            		</c:otherwise>
            		</c:choose>
                </c:forEach>

                   
                <c:if test="${ pi.currentPage ne pi.maxPage }">
                   	<li><a href="externalGroup.add?cpage=${ pi.currentPage+1 }"> > </a></li>
               	</c:if>
            </ul>
        </div>

    
    </div>  
</body>
</html>