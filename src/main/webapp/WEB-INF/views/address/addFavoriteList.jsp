<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .content-outer{width:1000px; margin-left:200px; padding-top:20px;}
    .content-outer *{box-sizing: border-box;}
    #address-group{font-size:20px; font-weight:600; color:rgb(93, 109, 75);}

    /*검색*/
    #searchKey{width:200px; height:25px; border:1px solid gray; border-radius:5px;}
    #searchBtn{width:50px; height:25px; border:0; border-radius:5px; background: rgb(166, 184, 145); color:white;}

    /*연락처 추가*/
    .newAdd{width:120px; height:25px; border:1px solid gray; border-radius:5px;}
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
    .like-tb tbody>tr:hover{background:rgb(233, 233, 233); font-weight:600;}
    .like-tb thead>tr{background-color:rgb(210, 217, 201); position: sticky; top:0;}
    .like-tb th{padding:8px 0 8px 0;}
    .like-tb td{padding:3px 0 3px 0;}
    .like-tb input[type="checkbox"]{accent-color:rgb(166, 184, 145);}
    .like:hover{cursor: pointer;}
    
    /*스크롤*/
	#psLike::-webkit-scrollbar, #pbLike::-webkit-scrollbar{width:5px;}
	#psLike::-webkit-scrollbar-thumb, #pbLike::-webkit-scrollbar-thumb{background-color:rgb(166, 184, 145); border-radius:5px;}
	#psLike::-webkit-scrollbar-track, #pbLike::-webkit-scrollbar-track{background-color:white;}

</style>
</head>
<body>
	
	<jsp:include page="addMenubar.jsp"/>
	
    <div class="content-outer">

        <p id="address-group">즐겨찾기</p>

        <div class="search" align="right">
            <input type="text" id="searchKey" placeholder="이름, 회사, 전화번호">
            <button id="searchBtn">검색</button>
        </div>

        <div class="addNew">
            <input type="text" class="newAdd" placeholder="이름">
            <input type="text" class="newAdd" placeholder="이메일">
            <input type="text" class="newAdd" placeholder="휴대폰">
            <button class="addBtn" id="addBtn1">추가정보</button>
            <button class="addBtn" id="addBtn2">추가</button>
        </div>

        <br><br>

        <button id="sendMail">메일쓰기</button>
        <span class="subheading" id="psSubheading"><b>개인주소록 (3개)</b></span>

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
                			<td colspan="8" style="text-align:center;">😓 즐겨찾기한 주소록이 없습니다</td>
                		</tr>
                	</c:when>
                	<c:otherwise>
	                	<c:forEach var="p" items="${ p }">
		                    <tr>
		                        <td style="display:none">${ p.addNo }</td>
		                        <td><input type="checkbox" class="ps-checkbox"></input></td>
		                        <td class="like">⭐</td>
		                        <td class="clck-detail">${ p.addName }</td>
		                        <td class="clck-detail">${ p.phone }</td>
		                        <td class="clck-detail">${ p.email }</td>
		                        <td></td>
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

		<span class="subheading" id="pbSubheading"><b>공유주소록 (5개)</b></span>
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
                			<td colspan="8" style="text-align:center;">😓 즐겨찾기한 주소록이 없습니다</td>
                		</tr>
                	</c:when>
                	<c:otherwise>
	                	<c:forEach var="e" items="${ e }">
		                    <tr>
		                        <td style="display:none">${ e.empNo }</td>
		                        <td><input type="checkbox" class="ps-checkbox"></input></td>
		                        <td class="like">⭐</td>
		                        <td class="clck-detail">${ e.empName }</td>
		                        <td class="clck-detail">${ e.phone }</td>
		                        <td class="clck-detail">${ e.email }</td>
		                        <td></td>
		                        <td>${ e.deptName }</td>
		                    </tr>
	                	</c:forEach>
	                	<c:forEach var="s" items="${ s }">
		                    <tr>
		                        <td style="display:none">${ s.addNo }</td>
		                        <td><input type="checkbox" class="ps-checkbox"></input></td>
		                        <td class="like">⭐</td>
		                        <td class="clck-detail">${ s.addName }</td>
		                        <td class="clck-detail">${ s.phone }</td>
		                        <td class="clck-detail">${ s.email }</td>
		                        <td></td>
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

            $(".like").click(function(){ /*별 누르면 실행할 내용*/
                
            })

            $(function(){
                $("#sendMail").click(function(){ /*메일쓰기 누르면 실행할 내용*/
                    
                })
            })

            
        </script>

        <script>
            $(function(){
                $('.clck-detail').on("click", $('.clck-detail'), function(){
                    location.href = 'detail.ad?no=' + $(this).siblings().eq(0).text(); 
                })
            })
        </script>


    </div>

</body>
</html>