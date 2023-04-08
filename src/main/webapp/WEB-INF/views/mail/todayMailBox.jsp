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
    .mail_sender_name{width: 60px; margin-right: 15px; overflow: hidden;}
    .mail_sender{width: 180px; margin-right: 15px; overflow: hidden;}
    .mail_title{width: 380px; margin-right: 15px; overflow: hidden;}
    .mail_date{width: 160px; text-align: right;}

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
                        <b>오늘 온 메일함</b>
                        <img src="">
                        <b style="font-size: 20px;">전체메일 </b>
                        <b id="all_mail_no" style="color: dodgerblue; font-size: 23px;">
                            <c:set var="allMail" value="0" />
                            <c:forEach var="m" items="${ mailList }">
                                <c:set var="allMail" value="${allMail + 1}" />
                            </c:forEach>
                            ${allMail}
                        </b>
                        <b>/ </b>
                        <b style="font-size: 20px;">안읽은 메일 </b>
                        <b id="unread_mail_no" style="color: crimson; font-size: 23px;">
                            <c:set var="readMail" value="0" />
                            <c:forEach var="m" items="${ mailList }">
                                <c:if test="${ m.recCheck == 'Y' }">
                                    <c:set var="readMail" value="${readMail + 1}" />
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
                <jsp:include page="receiveMailHeaderbar.jsp" />
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
                                    <div class="tagTriangleList">
                                        <span class="tagBlock">
                                            <span class="tag_innerBlock1 tagColor" style="background-color: ${t.tagColor}; border: 1px solid ${t.tagColor};">
                                                <span class="tag_innerBlock2" style="border-inline-color: inherit;">
                                                    <span style="border-inline-color: inherit;"></span>
                                                </span>
                                            </span>
                                        </span>
                                    </div>
                                    <div class="tag_name">${t.tagName}</div>
                                    <div>
                                        <button class="tag_btn btn btn-outline-primary btn-sm">적용</button>
                                        <input type="hidden" class="tagNo" name="tagNo" value="${t.tagNo}">
                                    </div>
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
                <b style="line-height: 40px;">메일함</b>
                <div class="x-btn">
                    <button class="x btn btn-outline-secondary btn-sm">X</button>
                </div>
                <div class="block_list shift_list">
                    <div class="block_one shift_one">
                        <div class="shift_name">받은 메일함</div>
                        <div>
                            <button class="tag_btn btn btn-outline-primary btn-sm">적용</button>
                            <input type="hidden" class="tagNo" name="tagNo" value="">
                        </div>
                    </div>
                    <br>
                    <div class="block_one shift_one">
                        <div class="shift_name">중요 메일함</div>
                        <div>
                            <button class="tag_btn btn btn-outline-primary btn-sm">적용</button>
                            <input type="hidden" class="tagNo" name="tagNo" value="">
                        </div>
                    </div>
                    <br>
                    <div class="block_one shift_one">
                        <div class="shift_name">메일함 이름</div>
                        <div>
                            <button class="tag_btn btn btn-outline-primary btn-sm">적용</button>
                            <input type="hidden" class="tagNo" name="tagNo" value="">
                        </div>
                    </div>
                    <br>
                </div>
            </div>

            <!-- 메일 리스트 -->
            <div id="mail_list">
                <c:set var="mailCount" value="0" />
                <c:if test="${ not empty pgMailList }">
                    <c:forEach var="m" items="${ pgMailList }">
                        <c:if test="${ m.status == 'Y' and m.junkMail == 'N' }">
                        <c:set var="mailCount" value="${mailCount + 1}" />
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
                                    <c:if test="${ not empty attachList }">
                                        <c:forEach var="attach" items="${ attachList }">
                                            <c:forEach var="a" begin="0" end="0" items="${ attach }">
                                                <c:if test="${ m.mailNo == a.refNo }">
                                                    <div class="mail_img"><img class="attachment" src="resources/common_images/attachment.png"></div>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                    </c:if>
                                </div>
                                <form class="mail_select_area">
                                    <input class="mailNo" type="hidden" name="mailNo" value="${ m.mailNo }">
                                    <input class="recMailNo" type="hidden" name="recMailNo" value="${ m.recMailNo }">
                                    <div id="selectMailLine">
                                        <div class="mail_sender_name">
                                            ${m.sendName}
                                        </div>
                                        <div class="mail_sender">
                                            ${ m.sendMailAdd }
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
                                        <div class="mail_date">
                                            ${ m.dateDay } ${ m.dateTime }
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${mailCount == 0}">
                    <div class="empty">메일함이 비었습니다.</div>
                </c:if>
                </div>
            </div>
            
            <jsp:include page="paging.jsp" />

        </div>

        <script>

            // 메일 상세조회
            let mailSelectList = document.querySelectorAll('.mail_select_area');
            mailSelectList.forEach(function(select){
                select.addEventListener('click', function(){
                    const input = document.createElement("input");
                    input.setAttribute("style", "display:none")
                    input.setAttribute("name", "div");
                    input.setAttribute("value", 2);
                    this.append(input);
                    this.action = "select.ma";
                    this.method = "POST";
                    this.submit();

                });
            });

            // 전체 체크박스 선택 취소
            let checkAll = document.getElementById("check_all");
            let mailCheckBox = document.querySelectorAll('.mail_checkbox');
            checkAll.addEventListener('change', function(event){
                mailCheckBox.forEach((checkbox) => {
                    checkbox.checked = checkAll.checked;
                })
            });

            
            // 스팸 등록
            let spamEnroll = document.getElementById("spam");
            spamEnroll.addEventListener('click', function(){
                checkedBoxSum = 0
                arr = [];
                    mailCheckBox.forEach((i) => {
                        if(i.checked == true) {
                            let value = i.parentElement.parentElement.lastElementChild.getElementsByClassName("recMailNo")[0].value;
                            arr.push(value);
                            checkedBoxSum += 1;
                        };
                    })

                if(checkedBoxSum != 0) {
                    const form = document.createElement("form");
                    const input = document.createElement("input");
                    form.setAttribute("style", "display:none;");
                    input.setAttribute("name", "recMailNoList");
                    input.setAttribute("multiple", "multiple");
                    input.setAttribute("value", arr);
                    form.append(input);
                    form.method = "POST";
                    form.action = "spamEnroll.ma";
                    document.body.append(form);
                    form.submit();
                }else {
                    alert('체크박스를 선택해주세요');
                };
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
                            let value = i.parentElement.parentElement.lastElementChild.getElementsByClassName("recMailNo")[0].value;
                            arr.push(value);
                            checkedBoxSum += 1;
                        };
                    })

                if(checkedBoxSum != 0) {
                    const form = document.createElement("form");
                    const input = document.createElement("input");
                    const input2 = document.createElement("input");
                    form.setAttribute("style", "display:none;");
                    input.setAttribute("style", "display:none;");
                    input.setAttribute("name", "recMailNoList");
                    input.setAttribute("value", arr);
                    input2.setAttribute("style", "display:none;");
                    input2.setAttribute("name", "div");
                    input2.setAttribute("value", );
                    form.append(input);
                    console.log(form)
                    form.method = "POST";
                    form.action = "delete.ma";
                    document.body.append(form);
                    form.submit();
                }else {
                    alert('체크박스를 선택해주세요');
                };
            });

            // 태그
            let tag = document.getElementById("tag");
            let tagBlock = document.querySelector(".tag_block");
            let tagBtnList = document.querySelectorAll(".tag_btn");
            tag.addEventListener('click', function(){
                checkedBoxSum = 0
                arr = [];
                mailCheckBox.forEach((i, index) => {
                    if(i.checked == true) {
                        let value = i.parentElement.parentElement.lastElementChild.getElementsByClassName("recMailNo")[0].value;
                        arr.push(value);
                        checkedBoxSum += 1;
                    };
                })
                if(checkedBoxSum >= 1) {
                    tagBlock.style.display = 'block';
                    let tagNo = document.querySelectorAll(".tagNo");
                    tagBtnList.forEach(function(tagBtn, index){
                        tagBtn.addEventListener('click', function(){
                            tagNo = tagNo.item(index).value
                            const form = document.createElement("form");
                            const input1 = document.createElement("input");
                            const input2 = document.createElement("input");
                            form.setAttribute("style", "display:none;");
                            input1.setAttribute("name", "recMailNoList");
                            input1.setAttribute("multiple", "multiple");
                            input1.setAttribute("value", arr);
                            input2.setAttribute("name", "tagNo");
                            input2.setAttribute("value", tagNo);
                            form.append(input1);
                            form.append(input2);
                            form.method = "POST";
                            form.action = "tag.ma";
                            console.log(form)
                            document.body.append(form);
                            form.submit();
                        });
                    });
                }else{
                    alert('체크박스를 선택해주세요')
                }
            });

            // x button 닫기 효과
            let x_blocks = document.querySelectorAll('.x');
            x_blocks.forEach(function(x){
                x.addEventListener('click', function(){
                    this.parentNode.parentNode.style.display = 'none';
                })
            });

            // 새로고침
            let refresh = document.getElementById("refresh");
            refresh.addEventListener('click', function(){
                location.href = 'todayList.ma';
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