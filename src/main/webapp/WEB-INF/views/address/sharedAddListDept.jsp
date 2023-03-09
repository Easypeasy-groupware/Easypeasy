<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.content-outer{width:1000px; padding-left:10px; margin-left:200px;}
	.content-outer *{box-sizing: border-box;}
	
	#address-group{font-size:22px; font-weight:600;}
	#group-name{color:rgb(96, 96, 96); font-size:18px; font-weight:600;}
	
	/*검색*/
	#searchKey{width:200px; height:25px; border:1px solid gray; border-radius:5px;}
	#searchBtn{width:50px; height:25px; border:0; border-radius:5px; background: rgb(166, 184, 145); color:white;}
	
	/*연락처 추가*/
	.newAdd{width:120px; height:25px; border:1px solid gray; border-radius:5px;}
	.addBtn{width:80px; height:25px; border:0; border-radius:5px;}
	#addBtn1{background: rgb(127, 127, 127); color:white;}
	#addBtn2{background: rgb(166, 184, 145); color:white;}
	
	/*주소록 리스트 헤더*/
	.btnGroup{width:80px; height:25px; border:0; border-radius:5px; margin-bottom:10px; color:white;}
	.btnGroup:hover{cursor: pointer; font-weight:600;}
	#sendMail{background: rgb(77, 88, 64);}
	
	
	/*주소록 리스트 테이블*/
	table{
	    margin:auto;
	    border-collapse: collapse;
	}
	th{border-bottom:1px solid gray; padding:5px 0 5px 0;}
	td{padding:3px 0 3px 0; height:40px;}
	input[type="checkbox"]{accent-color:rgb(166, 184, 145);}
	.like:hover{cursor: pointer;}
	tbody>tr:hover{background:rgb(233, 233, 233); font-weight:600;}
	
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
	
    <div class="content-outer">

        <p id="address-group">공유주소록</p>
        <p id="group-name">사내주소록(인사팀)</p>


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
        <p class="subheading" id="psSubheading">인사팀 총 n개</p>

        <button class="btnGroup" id="sendMail">메일쓰기</button>

        <br>

        <div id="psLike">
            <table>
                <copgroup>
                    <col style="width:10px;">
                    <col style="width:30px;">
                    <col style="width:50px;"><!--이름-->
                    <col style="width:50px;"><!--직위-->
                    <col style="width:150px;"><!--휴대폰-->
                    <col style="width:150px;"><!--이메일-->
                    <col style="width:70px;"><!--부서-->
                    <col style="width:120px;"><!--회사-->
                    <col style="width:100px;"><!--회사전화-->
                    <col style="width:150px;"><!--회사주소-->
                    <col style="width:70px;"><!--메모-->
                    <col style="width:50px;"><!--그룹-->
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
                        <th>회사전화</th>
                        <th>회사주소</th>
                        <th>메모</th>
                        <th>그룹</th>
                    </tr>
                </thead>
                <tbody align="center" id="ps-tbody">
                    <tr>
                        <td style="display:none">1</td>
                        <td><input type="checkbox" class="ps-checkbox"></input></td>
                        <td class="like">⭐</td>
                        <td class="clck-detail">홍길동</td>
                        <td class="clck-detail">사원</td>
                        <td class="clck-detail">010-1111-2222</td>
                        <td class="clck-detail">gildong@gmail.com</td>
                        <td class="clck-detail">영업1팀</td>
                        <td class="clck-detail">구디아카데미</td>
                        <td>02-222-3333</td>
                        <td>서울시 금천구 </td>
                        <td></td>
                        <td>friends</td>
                    </tr>
                    <tr>
                        <td style="display:none">2</td>
                        <td><input type="checkbox" class="ps-checkbox"></input></td>
                        <td class="like"><i class="fi fi-rr-star"></i></td>
                        <td class="clck-detail">홍길동</td>
                        <td class="clck-detail">사원</td>
                        <td class="clck-detail">010-1111-2222</td>
                        <td class="clck-detail">gildong@gmail.com</td>
                        <td class="clck-detail">영업1팀</td>
                        <td class="clck-detail">구디아카데미</td>
                        <td>02-222-3333</td>
                        <td>서울시 금천구 </td>
                        <td></td>
                        <td>friends</td>
                    </tr>
                    <tr>
                        <td style="display:none">3</td>
                        <td><input type="checkbox" class="ps-checkbox"></input></td>
                        <td class="like">⭐</i></td>
                        <td class="clck-detail">홍길동</td>
                        <td class="clck-detail">사원</td>
                        <td class="clck-detail">010-1111-2222</td>
                        <td class="clck-detail">gildong@gmail.com</td>
                        <td class="clck-detail">영업1팀</td>
                        <td class="clck-detail">구디아카데미</td>
                        <td>02-222-3333</td>
                        <td>서울시 금천구 </td>
                        <td></td>
                        <td>friends</td>
                    </tr>
                    <tr>
                        <td style="display:none">4</td>
                        <td><input type="checkbox" class="ps-checkbox"></input></td>
                        <td class="like"><i class="fi fi-rr-star"></i></td>
                        <td class="clck-detail">홍길동</td>
                        <td class="clck-detail">사원</td>
                        <td class="clck-detail">010-1111-2222</td>
                        <td class="clck-detail">gildong@gmail.com</td>
                        <td class="clck-detail">영업1팀</td>
                        <td class="clck-detail">구디아카데미</td>
                        <td>02-222-3333</td>
                        <td>서울시 금천구 </td>
                        <td></td>
                        <td>friends</td>
                    </tr>
                    <tr>
                        <td style="display:none">5</td>
                        <td><input type="checkbox" class="ps-checkbox"></input></td>
                        <td class="like">⭐</i></td>
                        <td class="clck-detail">홍길동</td>
                        <td class="clck-detail">사원</td>
                        <td class="clck-detail">010-1111-2222</td>
                        <td class="clck-detail">gildong@gmail.com</td>
                        <td class="clck-detail">영업1팀</td>
                        <td class="clck-detail">구디아카데미</td>
                        <td>02-222-3333</td>
                        <td>서울시 금천구 </td>
                        <td></td>
                        <td>friends</td>
                    </tr>
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

            $(".like").click(function(){ /*즐겨찾기*/
                if($(this).html()=="⭐"){
                    $(this).html('<i class="fi fi-rr-star"></i>');
                }else{
                    $(this).html("⭐");
                }
            })


        </script>

        <div align="center">
            <ul id="paging">
                <li><a href=""> < </a></li>
                <li class='on'><a href=""> 1 </a></li>
                <li><a href=""> 2 </a></li>
                <li><a href=""> 3 </a></li>
                <li><a href=""> 4 </a></li>
                <li><a href=""> 5 </a></li>
                <li><a href=""> > </a></li>
            </ul>
        </div>
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