<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    .menu:hover{font-size: 15px; cursor: pointer;}

    .block{width: 220px; min-height: 150px; max-height: 300px; background: white; border-radius: 10px; border: 1px solid rgb(185, 187, 221); 
           position: absolute; left: 850px; text-align: center; display: none; z-index: 10;}
    .block_list{width: 205px; min-height: 115px; max-height: 230px; margin: auto; overflow-x: hidden; overflow-y: auto; 
                margin-bottom: 10px; padding-top: 5px;}
    .block_one{width: 100%; height: 30px; font-size: 13px; float: left;}
    .block_one>div{float: left;}
    .tagTriangleList{width: 10px; margin-left: 18px; line-height: 15px; float: left;}
    .tag_name{width: 120px; overflow: hidden;}
    .x-btn{width: 30px; float: right; margin: 10px 10px 0px 10px;}
    .tag_btn.btn.btn-outline-primary.btn-sm{width: 35px; height: 25px; font-size: 10px; padding: 2px 4px 2px 4px;}
    .shift_name{width: 145px; margin-left: 10px; text-align: left; font-size: 15px;}
    .x.btn.btn-outline-secondary.btn-sm{padding: 0px 5px 0px 5px; width: 20px; height: 20px; line-height: 0px;  margin-bottom: 20px;}
    .mail_impor, .mail_read, .attachment{width: 18px;}

    #mail_list{height: 850px;}
    .mail_one{height: 40px; line-height: 35px; margin: 3px 10px 3px 15px; border-bottom: 1px solid rgb(185, 187, 221);}
    .mail_one div{float: left; height: 40px;}
    .mail_select_area{color: black;}
    .mail_check{width: 30px; padding-top: 2px;}
    .mail_imgList{width: 110px; text-align: center; line-height: 43px;}
    .mail_img{width: 30px; line-height: 2.5;}
    #selectMailLine:hover{font-weight: 600; cursor: pointer;}
    .mail_sender_name{width: 50px; margin-right: 15px; overflow: hidden; text-overflow: ellipsis;}
    .mail_sender{width: 100px; margin-right: 15px; overflow: hidden; text-overflow: ellipsis;}
    .mail_title{width: 270px; margin-right: 15px; overflow: hidden; text-overflow: ellipsis;}
    .mail_sent_date, .mail_read_date{width: 175px; text-align: right; text-align: center;}
    .mail_sent_date{margin-right: 15px; color: gray;}

    #paging{text-align: center; display: inline-block; padding-left :0; margin-top: 20px;}
    #paging li {text-align: center; float: left; list-style:none; border-radius:10px; margin:2px; background-color: rgb(234, 234, 234);}
    #paging li a {display: block; font-size: 12px; color: black; padding: 5px 10px; box-sizing: border-box; text-decoration-line:none;}
    #paging li.on {background:rgb(166, 184, 145);}
    #paging li.on a { color: white;}

    
</style>
</head>
<body>
	<!-- 헤더 영역 -->
	<jsp:include page="../common/header.jsp" />
    <div id="main">
    <div style="position: absolute; top: 120px;">
        <!-- 메일 사이드바 -->
        <jsp:include page="mailSidebar.jsp" />

        <!-- 메일 컨텐트-->
        <div id="mail_content">
            <div id="mail_header">
                <div id="mail_header1" style="width:100%; float:left">
                    <div id="mail_header_info">
                        <b>보낸 메일함</b>
                        <img src="">
                        <b style="font-size: 20px;">전체메일 </b>
                        <b id="all_mail_no" style="color: dodgerblue; font-size: 23px;">
                            <c:set var="allMail" value="0" />
                            <c:forEach var="m" items="${ mailList }">
                                <c:if test="${ m.status == 'Y' and m.junkMail == 'N' }">
                                    <c:set var="allMail" value="${allMail + 1}" />
                                </c:if>
                            </c:forEach>
                            ${allMail}
                        </b>
                        <b>/ </b>
                        <b style="font-size: 20px;">수신 미확인 </b>
                        <b id="unread_mail_no" style="color: crimson; font-size: 23px;">
                            <c:set var="readMail" value="0" />
                            <c:forEach var="m" items="${ mailList }">
                                <c:if test="${ m.status == 'Y'}">
                                    <c:if test="${ m.recCheck == 'Y' }">
                                        <c:set var="readMail" value="${readMail + 1}" />
                                    </c:if>
                                </c:if>
                            </c:forEach>
                            ${allMail-readMail}
                        </b>
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
                    <div style="width: 27px; float: left; padding-left: 5px; padding-top: 8px;"><input type="checkbox" name="" id="check_all"></div>
                    <div class="menu menu2" id="reply">답장</div>
                    <div class="menu menu2" id="forward">전달</div>
                    <div class="menu menu2" id="delete">삭제</div>
                    <div style="float: right; width: 150px; font-size: 12px;">
                        정렬
                        <select name="" id="">
                            <option value="">최근 메일</option>
                            <option value="">오래된 메일</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- 메일 리스트 -->
            <div id="mail_list">
                <c:if test="${ not empty pgMailList }">
                    <c:forEach var="m" items="${ pgMailList }">
                        <c:if test="${ m.status == 'Y' }">
                            <div class="mail_one" >
                                <div class="mail_check">
                                    <input type="checkbox" name="mail_checkbox" class="mail_checkbox" value="">
                                </div>
                                <div class="mail_imgList">
                                    <c:choose>
                                        <c:when test="${ m.imporMail == 'Y' }">
                                            <div class="mail_img read"><img class="mail_impor" src="resources/common_images/favorite.png"></div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="mail_img unread"><img class="mail_impor" src="resources/common_images/unFavorite.png"></div>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${ m.recCheck == 'Y' }" >
                                            <div class="mail_img read"><img class="mail_read" src="resources/common_images/mail_read.png"></div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="mail_img unread"><img class="mail_read" src="resources/common_images/mail_unRead.png"></div>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:if test="${ not empty attachmentList }">
                                        <div class="mail_img"><img class="attachment" src="resources/common_images/attachment.png"></div>
                                    </c:if>
                                </div>
                                <form class="mail_select_area">
                                    <input class="mailNo" type="hidden" name="mailNo" value="${ m.mailNo }">
                                    <input class="recMailNo" type="hidden" name="recMailNo" value="${ m.recMailNo }">
                                    <div id="selectMailLine">
                                        <div class="mail_sender_name">
                                            ${m.empName}
                                        </div>
                                        <div class="mail_sender">
                                            ${ m.recMailAdd }
                                        </div>
                                        <div class="mail_title">
                                            <c:forEach var="t" items="${tagList}">
                                                <c:if test="${ m.tagNo == t.tagNo }">
                                                    <div class="mail_tag">
                                                        <span class="tagBlock">
                                                            <span class="tag_innerBlock1 tagColor" style="background-color: ${t.tagColor}; border: 1px solid ${t.tagColor};">
                                                                <span class="tag_innerBlock2" style="border-inline-color: inherit;">
                                                                    <span style="border-inline-color: inherit;"></span>
                                                                </span>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            ${ m.mailTitle }
                                        </div>
                                        <div class="mail_sent_date">
                                            ${ m.sentDate }
                                        </div>
                                        <div class="mail_read_date">
                                            <c:choose>
                                                <c:when test="${m.recDate == null}">
                                                    <b>미확인</b>
                                                </c:when>
                                                <c:otherwise>
                                                    ${ m.recDate }
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:if>
                </div>
            </div>
            <div align="center">
                <ul id="paging">
                    <c:choose>
                        <c:when test="${ mailPi.currentPage == 1 }">
                            <li><a href=""> < </a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="on"><a href="list.ma?cpage=${ mailPi.currentPage-1 }"> < </a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="p" begin="${ mailPi.startPage }" end="${ mailPi.endPage }">
                        <li class='on'><a href="list.ma?cpage=${ p }"> ${ p } </a></li>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${ mailPi.currentPage == mailPi.maxPage }">
                            <li><a href=""> > </a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="on"><a href="list.ma?cpage=${ mailPi.currentPage+1 }"> > </a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>

        <script>
            // 전역 번수 선언부
            let checkedBoxSum = 0
            let mailSelectArea = document.querySelectorAll(".mail_select_area");
            let index = 0;
            let arr = [];

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

            // 전체 체크박스 선택 취소
            let checkAll = document.getElementById("check_all");
            let mailCheckBox = document.querySelectorAll('.mail_checkbox');
            checkAll.addEventListener('change', function(event){
                mailCheckBox.forEach((checkbox) => {
                    checkbox.checked = checkAll.checked;
                })
            });

            // 답장
            let reply = document.getElementById("reply");
            reply.addEventListener('click', function(){
                checkedBoxSum = 0
                index = 0;
                mailCheckBox.forEach((i, number) => {
                    if(i.checked == true) {
                        index = number
                        checkedBoxSum += 1;
                    }
                })
                if(checkedBoxSum == 1) {
                    mailSelectArea = mailSelectArea.item(index)
                    const mail = mailSelectArea.cloneNode(true);
                    const input = document.createElement("input");
                    mail.setAttribute("style", "display:none;");
                    mail.method = "POST";
                    mail.action = "reply.ma";
                    input.name = "replyForwadDiv"
                    // 1 = 답장 / 2 = 전달
                    input.value = 1
                    mail.append(input)
                    document.body.append(mail);
                    mail.submit();
                }else{
                    alert('한 개의 체크박스를 선택해주세요!')
                }
            });

            // 전달
            let forward = document.getElementById("forward");
            forward.addEventListener('click', function(){
                checkedBoxSum = 0
                index = 0;
                mailCheckBox.forEach((i, number) => {
                    if(i.checked == true) {
                        index = number;
                        checkedBoxSum += 1;
                    }
                })
                if(checkedBoxSum == 1) {
                    mailSelectArea = mailSelectArea.item(index)
                    const mail = mailSelectArea.cloneNode(true);
                    const input = document.createElement("input");
                    mail.setAttribute("style", "display:none;");
                    mail.method = "POST";
                    mail.action = "reply.ma";
                    input.name = "replyForwadDiv"
                    // 1 = 답장 / 2 = 전달
                    input.value = 2
                    mail.append(input)
                    document.body.append(mail);
                    mail.submit();
                }else{
                    alert('한 개의 체크박스를 선택해주세요!')
                }
            });

            // 메일 삭제
            let deleteMail = document.getElementById("delete");
            deleteMail.addEventListener('click', function(){
                checkedBoxSum = 0
                arr = [];
                mailCheckBox.forEach((i) => {
                    if(i.checked == true) {
                        let value = i.parentElement.parentElement.lastElementChild.getElementsByClassName("mailNo")[0].value;
                        arr.push(value);
                        checkedBoxSum += 1;
                    };
                })

                if(checkedBoxSum != 0) {
                    swal({
                        title: "영구 삭제하시겠습니까?",
                        text: "삭제된 메일은 복구되지 않습니다.",
                        icon: "warning",
                        buttons: ["취소", "삭제"],
                        dangerMode: true,
                    })
                    .then((willDelete) => {
                        if(willDelete){
                            let form = document.createElement("form");
                            let input = document.createElement("input");
                            input.setAttribute("name", "mailNoList");
                            input.setAttribute("multiple", "multiple");
                            input.setAttribute("value", arr);
                            form.action = "delete.sm";
                            form.method = "POST";
                            form.append(input);
                            document.body.append(form);
                            console.log(input)
                            form.submit();
                        }
                    });
                }else {
                    alert('체크박스를 선택해주세요');
                };
            });

            // x button 닫기 효과
            let x_blocks = document.querySelectorAll('.x');
            x_blocks.forEach(function(x){
                x.addEventListener('click', function(){
                    this.parentNode.parentNode.style.display = 'none';
                })
            });

            // 즐겨찾기
            let imporList = document.querySelectorAll('.mail_impor');
            imporList.forEach(function(impor){
                impor.addEventListener('click', function(){
                    console.log("즐겨찾기");
                });
            });
        </script>
    </div>
</body>
</html>