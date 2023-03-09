<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .content-outer{width:1000px; margin-left:200px;}
    .content-outer *{box-sizing: border-box;}
    #address-group{font-size:22px; font-weight:600; color:rgb(93, 109, 75);}

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

    /*주소록 리스트 테이블*/
    table{
        margin:auto;
        border-collapse: collapse;
    }
    tbody>tr:hover{background:rgb(233, 233, 233); font-weight:600;}
    th{border-bottom:1px solid gray; padding:5px 0 5px 0;}
    td{padding:3px 0 3px 0;}
    input[type="checkbox"]{accent-color:rgb(166, 184, 145);}
    .like:hover{cursor: pointer;}

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
            $("#psCheck").click(function(){
                if($(this).prop("checked")){
                    $(".ps-checkbox").prop("checked", true);
                   
                }else {
                    $(".ps-checkbox").prop("checked", false);
                }
            })
        </script>

        <br><br>

        <div id="pbLike">
            <span class="subheading" id="pbSubheading"><b>공유주소록 (5개)</b></span>
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
                        <th><input type="checkbox" id="pbCheck"></input></th>
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
                <tbody align="center">
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
            $("#pbCheck").click(function(){
                if($(this).prop("checked")){
                    $(".pb-checkbox").prop("checked", true);
                }else {
                    $(".pb-checkbox").prop("checked", false);
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