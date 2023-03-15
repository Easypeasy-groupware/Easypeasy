<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EasyPeasy-mail</title>

<style>
    *{box-sizing: content-box;}

    

    /* 메일 컨텐트 css */
    #mail_content{width: 1000px; float: left;}
    #mail_header{height: 130px; border-bottom: 2px solid rgb(185, 187, 221); margin: 10px;}
    #mail_header1{height: 90px;}
    #mail_header_info{font-size: 25px; float: left; margin: 20px;}
    #search_bar{float: right; margin: 20px;}
    #mail_content_menubar{padding: 5px;}
    .menu{float: left; text-align: center; font-weight: 600; font-size: 13px; height: 40px; line-height: 40px;}
    .menu1{width: 100px;}
    .menu2{width: 80px;}
    .menu3{width: 120px;}

    .block{width: 220px; min-height: 150px; max-height: 300px; background: white; border-radius: 10px; border: 1px solid rgb(185, 187, 221); 
               position: absolute; left: 850px; text-align: center; display: none;}
    .block_list{width: 205px; min-height: 115px; max-height: 230px; margin: auto; overflow-x: hidden; overflow-y: auto; 
                margin-bottom: 10px; padding-top: 5px;}
    .block_one{width: 100%; height: 30px; font-size: 13px; float: left;}
    .block_one>div{float: left;}
    .tagTriangleList{height: 0px; width: 10px; border-bottom: 8px solid transparent; margin: 6px 10px 0px 10px;
                     border-top: 8px solid transparent;}
    .tag_name{width: 120px; overflow: hidden;}
    .x-btn{width: 30px; float: right; margin: 10px 10px 0px 10px;}
    .tag_btn.btn.btn-outline-primary.btn-sm{width: 35px; height: 25px; font-size: 10px; padding: 2px 4px 2px 4px;}
    .shift_name{width: 100%; margin: auto; font-size: 15px;}
    .x.btn.btn-outline-secondary.btn-sm{padding: 0px 5px 0px 5px; width: 20px; height: 20px; line-height: 0px;  margin-bottom: 20px;}
    .mail_favorite, .read, .attachment{width: 18px;}

    #mail_list{height: 850px;}
    .mail_one{height: 40px; line-height: 35px; margin: 5px 10px 5px 15px; border-bottom: 1px solid rgb(185, 187, 221);}
    .mail_one div{float: left; height: 40px;}
    .mail_select_area{color: black;}
    .mail_check{width: 30px; padding-top: 2px;}
    .mail_imgList{width: 120px; text-align: center; line-height: 43px;}
    .mail_img{width: 30px; line-height: 2.5;}
    .mail_sender{width: 200px; overflow: hidden;}
    .mail_title{width: 480px; overflow: hidden;}
    .mail_date{width: 130px; text-align: right;}

    #paging{text-align: center; display: inline-block; padding-left :0;}
    #paging li {text-align: center; float: left; list-style:none; border-radius:10px; margin:2px; background-color: rgb(234, 234, 234);}
    #paging li a {display: block; font-size: 12px; color: black; padding: 5px 10px; box-sizing: border-box; text-decoration-line:none;}
    #paging li.on {background:rgb(166, 184, 145);}
    #paging li.on a { color: white;}
</style>
</head>
<body>
	<!-- 헤더 영역 -->
	<jsp:include page="../common/header.jsp" />

	<!-- 메일 사이드바 -->
	<jsp:include page="mailSidebar.jsp" />

    <!-- 메일 컨텐트-->
    <div id="mail_content">
        <div id="mail_header">
            <div id="mail_header1" style="width:100%; float:left">
                <div id="mail_header_info">
                    <b>받은 메일함</b>
                    <img src="">
                    <b>전체메일 </b><b style="color: dodgerblue;">150 </b><b>/ </b><b style="color: crimson">75</b>
                </div>
                <div id="search_bar">
                    <form action="">
                        <select name="search" id="">
                            <option value="searchAll">전체</option>
                            <option value="searchAddress">메일 주소</option>
                            <option value="searchTitle">메일 제목</option>
                            <option value="searchContent">메일 내용</option>
                        </select>
                        <input type="text">
                        <button>검색</button>
                    </form>
                </div>
            </div><br>
            <div id="mail_header2">
                <div class="menu" style="width: 27px;"><input type="checkbox" name="" id="check_all"></div>
                <div class="menu menu1" id="spam"><img src="">스팸 등록</div>
                <div class="menu menu2" id="reply"><img src="">답장</div>
                <div class="menu menu2" id="delete"><img src="">삭제</div>
                <div class="menu menu2" id="tag"><img src="">태그</div>
                <div class="menu menu2" id="forward"><img src="">전달</div>
                <div class="menu menu2" id="shift"><img src="">이동</div>
                <div class="menu menu3" id="read_unread"><img src="">읽음/안읽음</div>
                <div class="menu menu1" id="refresh"><img src="">새로고침</div>
                <div style="float: right; width: 150px; font-size: 12px;">
                    정렬
                    <select name="" id="">
                        <option value="">최근 메일</option>
                        <option value="">오래된 메일</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- 태그 블록 -->
        <div class="block tag_block">
            <b style="line-height: 40px;">태그 목록</b>
            <div class="x-btn">
                <button class="x btn btn-outline-secondary btn-sm">X</button>
            </div>
            <div class="block_list tag_list">
                <c:choose>
                    <c:when test="${ not empty tagList }">
                        <c:forEach var="t" items="${ tagList }">
                            <div class="block_one tag_one">
                                <div class="tagTriangleList" style="border-left: 15px solid ${t.tagColor};"></div><div class="tag_name">${t.tagName}</div><div><button class="tag_btn btn btn-outline-primary btn-sm">적용</button></div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <br>
                        <div style="width: 100%; text-align: center"> 생성된 태그가 없습니다</div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- 이동 블록 -->
        <div class="block shift_block">
            <b style="line-height: 30px;">메일함</b>
            <div class="x-btn">
                <button class="x">X</button>
            </div>
            <div class="block_list shift_list">
                <div class="block_one shift_one">
                    <div class="shift_name">메일함 이름</div><br>
                    <div class="shift_name">메일함 이름</div><br>
                    <div class="shift_name">메일함 이름</div><br>
                    <div class="shift_name">메일함 이름</div><br>
                    <div class="shift_name">메일함 이름</div><br>
                </div>
            </div>
        </div>

        <!-- 메일 리스트 -->
        <div id="mail_list">
            <c:if test="${ not empty mailList }">
                <c:forEach var="m" items="${ mailList }">
                    <div class="mail_one" >
                        <div class="mail_check">
                            <input type="checkbox" name="mail_checkbox" class="mail_checkbox" value="">
                        </div>
                        <div class="mail_imgList">
                            <c:choose>
                                <c:when test="${ m.imporMail == 'Y' }">
                                    <div class="mail_img"><img class="mail_favorite" src="resources/common_images/favorite.png"></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="mail_img"><img class="mail_favorite" src="resources/common_images/unFavorite.png"></div>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${ m.recCheck == 'Y' }" >
                                    <div class="mail_img"><img class="read" src="resources/common_images/mail_read.png"></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="mail_img"><img class="read" src="resources/common_images/mail_unRead.png"></div>
                                </c:otherwise>
                            </c:choose>
                            <c:if test="${ not empty attachmentList }">
                                <div class="mail_img"><img class="attachment" src="resources/common_images/attachment.png"></div>
                            </c:if>
                        </div>
                        <form class="mail_select_area">
                            <input class="mailNo" type="hidden" name="mailNo" value="${ m.mailNo }">
                            <input class="recMailNo" type="hidden" name="recMailNo" value="${ m.recMailNo }">
                            <div class="mail_sender">
                                ${ m.sendMailAdd }
                            </div>       
                            <div class="mail_title">
                                메일 제목 - ${ m.mailTitle }
                            </div>
                            <div class="mail_date">
                                ${ m.recDate }
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </c:if>
        </div>
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
    </div>

    <script>
        // 메일 상세조회
        let mailSelectList = document.querySelectorAll('.mail_select_area');
        mailSelectList.forEach(function(select){
            select.addEventListener('click', function(){
                this.action = "select.ma";
                this.method = "POST";
                this.submit();
            });
        });

        // 페이징
        $(function(){
                 $("#ps-tbody").on("click", "tr", function(){
                     location.href = 'xxxxx.ad?no=' + $(this).children().eq(0).text(); 
                 })
            })

        // 전체 체크박스
        let checkAll = document.getElementById("check_all");
        let mailCheckBox = document.querySelectorAll('.mail_checkbox');
        checkAll.addEventListener('change', function(event){
            mailCheckBox.forEach((checkbox) => {
                checkbox.checked = checkAll.checked;
            })
        });

        // 스팸 등록
        let spamEnroll = document.getElementById("spam");
        let mailNoList = document.getElementsByClassName("mailNo");
        spamEnroll.addEventListener('click', function(){
        let checkedBoxSum = 0
        let count = 0;
        let arr = [];
        let form = document.createElement("form");
            mailCheckBox.forEach((i) => {
                if(i.checked == true) {
                    checkedBoxSum += 1;
                    arr[count] = mailNoList[i.value].value;
                    count += 1; 
                }
            })
            console.log(arr);

            if(checkedBoxSum != 0) {

            // form.setAttribute("charset", "UTF-8");
            // form.setAttribute("method", "POST");  
            // form.setAttribute("action", "액션 주소");

            // let hiddenInput = document.createElement("input");
            // hiddenInput.setAttribute("type", "hidden");
            // hiddenInput.setAttribute("name", "mailNoArr");
            // hiddenInput.setAttribute("value", arr);
            // form.appendChild(hiddenInput);

            // document.body.appendChild(form);
            // form.submit();

            }else {
                alert('체크박스를 선택해주세요');
            }
        });

        // 답장
        let reply = document.getElementById("reply");
        reply.addEventListener('click', function(){
            let checkedBoxSum = 0
            let count = 0;
            mailCheckBox.forEach((i) => {
                if(i.checked == true) {
                    count = i.value
                    checkedBoxSum += 1;
                }
            })
            if(checkedBoxSum == 1 && checkedBoxSum > 0) {
                mailSelectList[count].action = "www.naver.com";
                mailSelectList[count].method = "POST";
                mailSelectList[count].submit();
            }else{
                alert('한 개의 체크박스를 선택해주세요!')
            }
        });

        // 메일 삭제 - 스팸 등록과 동일
        let deleteMail = document.getElementById("delete");
        deleteMail.addEventListener('click', function(){
            let checkedBoxSum = 0
            let count = 0;
            let arr = [];
            let form = document.createElement("form");
                mailCheckBox.forEach((i) => {
                    if(i.checked == true) {
                        checkedBoxSum += 1;
                        arr[count] = mailNoList[i.value].value;
                        count += 1; 
                    }
                })
                console.log(arr);

            if(checkedBoxSum != 0) {

            }else{
                alert('체크박스를 선택해주세요');
            }
        });

        // 태그
        let tagging = document.getElementById("tag");
        let tagBlock = document.querySelector(".tag_block")
        tagging.addEventListener('click', function(){
            let checkedBoxSum = 0
            let count = 0;
            let arr = [];
            let form = document.createElement("form");
            mailCheckBox.forEach((i) => {
                if(i.checked == true) {
                    checkedBoxSum += 1;
                    arr[count] = mailNoList[i.value];
                    count += 1; 
                }
            })
            if(checkedBoxSum > 0) {
                console.log(checkedBoxSum);
                tagBlock.style.display = 'block';
            }else{
                alert('체크박스를 선택해주세요');
            }
        });

        // 메일 이동 - 태그와 동일
        let shift = document.getElementById("shift");
        let shiftBlock = document.querySelector(".shift_block")
        shift.addEventListener('click', function(){
            shiftBlock.style.display = 'block';
        });

        // x button 닫기 효과
        let x_blocks = document.querySelectorAll('.x');
        x_blocks.forEach(function(x){
            x.addEventListener('click', function(){
                this.parentNode.parentNode.style.display = 'none';
            })
        });

        // 전달 - 답장과 동일
        let forward = document.getElementById("forward");
        forward.addEventListener('click', function(){
            let checkedBoxSum = 0
            let count = 0;
            mailCheckBox.forEach((i) => {
                if(i.checked == true) {
                    count = i.value
                    checkedBoxSum += 1;
                }
            })
            if(checkedBoxSum == 1 && checkedBoxSum > 0) {
                mailSelectList[count].action = "www.naver.com";
                mailSelectList[count].method = "POST";
                mailSelectList[count].submit();
            }else{
                alert('한 개의 체크박스를 선택해주세요!')
            }
        });

        // 읽음 처리 - 스팸 처리와 동일
        let readAndUnread = document.getElementById("read_unread");
        readAndUnread.addEventListener('click', function(){
            let checkedBoxSum = 0
            let count = 0;
            let arr = [];
            let form = document.createElement("form");
                mailCheckBox.forEach((i) => {
                    if(i.checked == true) {
                        checkedBoxSum += 1;
                        arr[count] = mailNoList[i.value].value;
                        count += 1; 
                    }
                })
            if(checkedBoxSum != 0) {

            }else{
                alert('체크박스를 선택해주세요');
            }
        }); 

        // 새로고침
        let refresh = document.getElementById("refresh");
        refresh.addEventListener('click', function(){
            
        });

        // 즐겨찾기
        let favoriteList = document.querySelectorAll('.favorite');
        favoriteList.forEach(function(favorite){
            favorite.addEventListener('click', function(){
                console.log("즐겨찾기");
            });
        });

        // 아이콘 읽기 처리
        let readList = document.querySelectorAll('.read');
        readList.forEach(function(read){
            read.addEventListener('click', function(){
                console.log("읽기");
            });
        });
        

    </script>

</body>
</html>