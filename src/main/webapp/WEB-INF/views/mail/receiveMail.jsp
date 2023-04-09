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
    #mail_header2{height: 100%;}
    #mail_header_info{font-size: 25px; float: left; margin: 20px;}
    #search_bar{float: right; margin: 20px;}
    #mail_content_menubar{padding: 5px;}
    .menu{float: left; text-align: center; font-weight: 600; font-size: 13px; height: 40px; line-height: 40px;}
    .menu1{width: 100px;}
    .menu2{width: 80px;}
    .menu3{width: 120px;}
    .mail_img{width: 20px; padding-bottom: 3px; margin-right: 5px;}

    .block{width: 220px; min-height: 150px; max-height: 300px; background: white; border-radius: 10px; border: 1px solid rgb(185, 187, 221); 
           position: absolute; top: 150px; left: 750px; text-align: center; display: none; z-index: 10;}
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

    #mail_detail_content{padding: 0px 15px 0px 15px; overflow-y: auto;}
    .detail_info_tr{height: 25px;}
    .detail_info_th{width: 100px; text-align: left;}
    .detail_info_attach{width: 90%; height: 100px; padding: 5px 0px 5px 20px; float: left; border: 1px solid grey; 
                        box-sizing: border-box; font-weight: 600; overflow-y: auto;}
    .detail_info_attach>div{font-size: 14px; margin: 3px 0px 3px 0px;}
    .tr_attach{margin-top: 15px}
    #attach{width: 20px; margin: 35px 5px 5px 35px; line-height: 25px; float: left;}

    #content_text_area{margin: 5px 1.8px 0px 1.8px; height: 535px; max-height: 2000px; padding: 20px;}
</style>
</head>
<body>
	<!-- 구글 아이콘, 폰트 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	
    <div style="position: absolute; top: 120px;">

        <!-- 메일 사이드바 -->
        <jsp:include page="mailSidebar.jsp" />

        <!-- 메일 컨텐트-->
        <input type="hidden" id="recMailNo" name="recMailNo" value="${mail.recMailNo}">
        <input type="hidden" id="mailNo" name="mailNo" value="${mail.mailNo}">
        
        <div id="mail_content">
            <div id="mail_header">
                <div id="mail_header1" style="width:100%; float:left">
                    <div id="mail_header_info">
                        <c:choose>
                            <c:when test="${division >= 1 && division < 5 || division >= 6 && division < 10}">
                                <b style="font-size: 20px;">전체메일 </b>
                                <b id="allCount" style="color: dodgerblue; font-size: 23px;">
                                    <c:set var="allMail" value="0" />
                                    <c:forEach var="m" items="${ mailList }">
                                        <c:if test="${ m.status == 'Y' and m.junkMail == 'N' }">
                                            <c:set var="allMail" value="${allMail + 1}" />
                                        </c:if>
                                    </c:forEach>
                                    ${allMail}
                                </b>
                                <b>/ </b>
                                <b style="font-size: 20px;">안읽은 메일 </b>
                                <b id="unreadCount" style="color: crimson; font-size: 23px;">
                                    <c:set var="readMail" value="0" />
                                    <c:forEach var="m" items="${ mailList }">
                                        <c:if test="${ m.status == 'Y' and m.junkMail == 'N' }">
                                            <c:if test="${ m.recCheck == 'Y' }">
                                                <c:set var="readMail" value="${readMail + 1}" />
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                    ${allMail-readMail}
                                </b>
                            </c:when>
                            <c:when test="${division == 5}">
                                <b style="font-size: 20px;">전체메일 </b>
                                <b id="all_mail_no" style="color: dodgerblue; font-size: 23px;">
                                    <c:set var="allMail" value="0" />
                                    <c:forEach var="m" items="${ mailList }">
                                        <!-- <c:if test="${ m.status == 'Y' and m.junkMail == 'N' }"> -->
                                            <c:set var="allMail" value="${allMail + 1}" />
                                        <!-- </c:if> -->
                                    </c:forEach>
                                    ${allMail}
                                </b>
                                <b>/ </b>
                                <b style="font-size: 20px;">미확인 </b>
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
                            </c:when>
                            <c:when test="${division == 10}">
                                <b>휴지통</b>
                                <b style="font-size: 20px;">삭제메일 </b>
                                <b style="color: cadetblue; font-size: 23px;">
                                <c:set var="allMail" value="0" />
                                    <c:forEach var="m" items="${ mailList }">
                                        <c:if test="${ m.status == 'N' }">
                                            <c:set var="allMail" value="${allMail + 1}" />
                                        </c:if>
                                    </c:forEach>
                                    ${allMail}
                                </b>
                            </c:when>
                            <c:otherwise>
                                <b>스팸 메일함</b>
                                <b style="font-size: 20px;">스팸메일 </b>
                                <b style="color: cadetblue; font-size: 23px;">
                                <c:set var="allMail" value="0" />
                                    <c:forEach var="m" items="${ mailList }">
                                        <c:if test="${ m.junkMail == 'Y' }">
                                            <c:set var="allMail" value="${allMail + 1}" />
                                        </c:if>
                                    </c:forEach>
                                    ${allMail}
                                </b>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div><br>
                <div id="mail_header2">
                    <!-- 메일함에 따라 보여지는 메뉴 탭 -->
                    <c:choose>
                        <c:when test="${check == 'send'}" >
                            <div class="menu menu2" id="reply">답장</div>
                            <div class="menu menu2" id="forward">전달</div>
                            <div class="menu menu2" id="delete">삭제</div>
                            <div style="display: none;" class="menu menu2" id="tag">태그</div>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${mail.junkMail == 'Y'}">
                                    <div class="menu menu1" id="spam_clear">스팸 해제</div>
                                    <div style="display: none;" class="menu menu1" id="spam">스팸 등록</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="menu menu1" id="spam">스팸 등록</div>
                                    <div style="display: none;" class="menu menu1" id="spam_clear">스팸 해제</div>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${mail.status == 'Y' && mail.junkMail == 'N'}">
                                    <div class="menu menu2" id="reply">답장</div>
                                    <div class="menu menu2" id="delete">삭제</div>
                                    <div class="menu menu2" id="tag">태그</div>
                                    <div class="menu menu2" id="forward">전달</div>
                                    <div style="display: none;" class="menu menu2" id="restore"><img src="">복원</div>
                                    <div style="display: none;" class="menu menu2" id="complete_delete">영구 삭제</div>
                                </c:when>
                                <c:when test="${mail.status == 'Y' && mail.junkMail == 'Y'}">
                                    <div style="display: none;" class="menu menu2" id="reply">답장</div>
                                    <div style="display: none;" class="menu menu2" id="delete">삭제</div>
                                    <div style="display: none;" class="menu menu2" id="tag">태그</div>
                                    <div style="display: none;" class="menu menu2" id="forward">전달</div>
                                    <div class="menu menu2" id="complete_delete">영구 삭제</div>
                                    <div class="menu menu3" id="read" style="display: none;"><img class="mail_img" src="resources/common_images/mail_read.png">읽음</div>
                                    <div class="menu menu3" id="unRead" style="display: none;"><img class="mail_img" src="resources/common_images/mail_unRead.png">안읽음</div>
                                </c:when>
                                <c:otherwise>
                                    <div style="display: none;" class="menu menu2" id="reply">답장</div>
                                    <div style="display: none;" class="menu menu2" id="delete">삭제</div>
                                    <div style="display: none;" class="menu menu2" id="tag">태그</div>
                                    <div style="display: none;" class="menu menu2" id="forward">전달</div>
                                    <div class="menu menu2" id="complete_delete">영구 삭제</div>
                                    <div class="menu menu2" id="restore"><img src="">복원</div>
                                    <div class="menu menu3" id="read" style="display: none;"><img class="mail_img" src="resources/common_images/mail_read.png">읽음</div>
                                    <div class="menu menu3" id="unRead" style="display: none;"><img class="mail_img" src="resources/common_images/mail_unRead.png">안읽음</div>
                                </c:otherwise>
                            </c:choose>

                            <!-- 메일 수신 처리 -->
                            <c:if test="${mail.status == 'Y' && mail.junkMail == 'N'}">
                                <c:choose>
                                    <c:when test="${ mail.recCheck == 'Y' }">
                                        <div class="menu menu3" id="read" style="display: block;"><img class="mail_img" src="resources/common_images/mail_read.png">읽음</div>
                                        <div class="menu menu3" id="unRead" style="display: none;"><img class="mail_img" src="resources/common_images/mail_unRead.png">안읽음</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="menu menu3" id="unRead" style="display: block;"><img class="mail_img" src="resources/common_images/mail_unRead.png">안읽음</div>
                                        <div class="menu menu3" id="read" style="display: none;"><img class="mail_img" src="resources/common_images/mail_read.png">읽음</div>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </c:otherwise>
                    </c:choose>

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

                    <!-- 메일 위치 이동 -->
                    <div class="menu menu1" style="float: right; margin-left: 10px;" id="after_mail">
                        다음 메일
                        <div class="material-symbols-outlined" style="display: block; padding-top: 8px; float: right;">expand_more</div>
                    </div>
                    <div class="menu menu1" style="float: right;" id="before_mail">
                        이전 메일
                        <div class="material-symbols-outlined" style="display: block; padding-top: 8px; float: right;">expand_less</div>
                    </div>
                </div>
                <div id="mail_detail_content">
                    <div>
                        <img id="favorite" style="width: 18px; margin-right: 20px; float: left; padding-top: 6px;" src="resources/common_images/favorite.png">
                        <div style="font-size: 22px; font-weight: 700;">
                            ${ mail.mailTitle }
                            <c:forEach var="t" items="${ tagList }">
                                <c:if test="${t.tagNo == mail.tagNo}">
                                    <div class="mail_tag" style="line-height: 25px; margin-right: 5px;">
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
                        </div> 
                        <br>
                        <table>
                            <tr class="detail_info_tr">
                                <th class="detail_info_th">보낸 사람</th>
                                <td style="width: 90%;">${ mail.sendName } ${ mail.sendMailAdd }</td>
                            </tr>
                            <tr class="detail_info_tr">
                                <th class="detail_info_th">받는 사람</th>
                                <td>
                                    <c:forEach var="r" items="${ receiverList }">
                                        <c:if test="${ r.reference == 'N' && r.hiddenReference == 'N' }">
                                            ${ r.recName } ${ r.recMailAdd }
                                        </c:if>
                                    </c:forEach>
                                </td>
                            </tr>
                            <tr class="detail_info_tr">
                                <th class="detail_info_th">참 조</th>
                                <td>
                                    <c:forEach var="r" items="${ receiverList }">
                                        <c:if test="${ r.reference == 'Y' }">
                                            ${ r.recName } ${ r.recMailAdd } &nbsp;
                                        </c:if>
                                    </c:forEach>
                                </td>
                            </tr>
                            <tr class="detail_info_tr">
                                <th class="detail_info_th">보낸 날짜</th>
                                <td>${ mail.recDate }</td>
                            </tr>
                            <tr style="height: 10px;"></tr>
                            <tr class="detail_info_tr tr_attach">
                                <td colspan="2" style="padding: 4px; border: 2px solid gray; background: whitesmoke;">
                                    <div style="width: 10%; height: 100px; float: left;">
                                        <img id="attach" src="resources/common_images/attachment.png">
                                    </div>
                                    <div class="detail_info_attach">
                                        <c:choose>
                                            <c:when test="${ empty attachmentList }">
                                                <div>첨부파일이 없습니다.</div>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="a" items="${ attachmentList }">
                                                    <a href="${ a.filePath }" download="">${ a.originName }</a><br>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div id="content_text_area">
                            ${ mail.mailContent }
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // 스팸 등록
            let spam = document.getElementById("spam");
            spam.addEventListener('click', function(){
                const form = document.createElement("form");
                const recMailNo = document.getElementById("recMailNo");
                console.log(recMailNo);
                form.setAttribute("style", "display:none;");
                form.append(recMailNo);
                form.action = "spamEnroll.ma"
                form.method = "POST"
                document.body.append(form);
                form.submit();
            });

            // 답장
            let reply = document.getElementById("reply");
            reply.addEventListener('click', function(){
                const form = document.createElement("form");
                const input = document.createElement("input");
                form.setAttribute("style", "display:none;");
                input.setAttribute("style", "display:none;");
                form.method = "POST";
                form.action = "reply.ma";
                input.name = "replyForwadDiv";
                // 1 = 답장 / 2 = 전달
                input.value = 1;
                form.append(input);
                document.body.append(form);
                form.submit();
            });

            // 전달
            let forward = document.getElementById("forward");
            forward.addEventListener('click', function(){
                const form = document.createElement("form");
                const input = document.createElement("input");
                form.setAttribute("style", "display:none;");
                input.setAttribute("style", "display:none;");
                form.method = "POST";
                form.action = "reply.ma";
                input.name = "replyForwadDiv";
                // 1 = 답장 / 2 = 전달
                input.value = 2;
                form.append(input);
                document.body.append(form);
                form.submit();
            });

            // 메일 삭제
            let deleteMail = document.getElementById("delete");
            deleteMail.addEventListener('click', function(){
            swal({
                title: "정말로 삭제하시겠습니까?",
                text: "삭제된 메일은 휴지통으로 이동됩니다.",
                icon: "warning",
                buttons: ["취소", "삭제"],
                dangerMode: true,
                })
                .then((willDelete) => {
                    if(willDelete){
                        const form = document.createElement("form");
                        const input1 = document.createElement("input");
                        const input2 = document.createElement("input");
                        const input3 = document.createElement("input");
                        const input4 = document.createElement("input");
                        input1.setAttribute("name", "mailNo");
                        input2.setAttribute("name", "recMailNo");
                        input3.setAttribute("name", "recMailAdd");
                        input4.setAttribute("name", "empNo");
                        input1.value = "${ mail.mailNo }";
                        input2.value = "${ mail.recMailNo }";
                        input3.value = "${loginUser.email}";
                        input4.value = "${loginUser.empNo}";
                        form.append(input1);
                        form.append(input2);
                        form.append(input3);
                        form.append(input4);
                        form.action = "delete.ma"
                        form.method = "POST"
                        document.body.append(form);
                        form.submit();
                    }
                });
            });

            // 복원
            let restore = document.getElementById("restore");
            restore.addEventListener('click', function(){
                const recMailNo = document.getElementById("recMailNo").value;
                const form = document.createElement("form");
                const input = document.createElement("input");
                form.setAttribute("style", "display:none;");
                input.setAttribute("style", "display:none;");
                input.setAttribute("name", "recMailNo");
                input.setAttribute("value", recMailNo);
                form.append(input);
                form.method = "POST";
                form.action = "restore.ma";
                document.body.append(form);
                form.submit();
            });

            // 영구 삭제
            let deleteCompleteMail = document.getElementById("complete_delete");
            deleteCompleteMail.addEventListener('click', function(){
                const recMailNo = document.getElementById("recMailNo").value;
                const form = document.createElement("form");
                const input = document.createElement("input");
                form.setAttribute("style", "display:none;");
                input.setAttribute("style", "display:none;");
                input.setAttribute("name", "recMailNo");
                input.setAttribute("value", recMailNo);
                form.append(input);
                form.method = "POST";
                form.action = "completeDelete.ma";
                document.body.append(form);
                form.submit();
            });

            // 태그
            let tagging = document.getElementById("tag");
            let tagBlock = document.querySelector(".tag_block")
            tagging.addEventListener('click', function(){
                tagBlock.style.display = 'block';
            });

            // x button 닫기 효과
            let x_blocks = document.querySelectorAll('.x');
            x_blocks.forEach(function(x){
                x.addEventListener('click', function(){
                    this.parentNode.parentNode.style.display = 'none';
                })
            });

            // 읽음 처리
            window.onload = function(){
                let read = document.getElementById("read");
                let unread = document.getElementById("unRead");
                let recMailNo = document.getElementById("recMailNo").value;
                let mailNo = document.getElementById("mailNo").value
                let recMailNoListData = recMailNo + "," + mailNo;
                read.addEventListener('click', function(){
                    $.ajax({
                        url: "updateReadUnread.ma",
                        type: "POST",
                        data: {
                            recMailNoListData: recMailNo + "," + mailNo,
                            recCheck : "N"
                        },
                        success: function(result){
                            if(result != null) {
                                read.style.display = 'none';
                                unread.style.display = 'block';
                                let unreadCount = document.getElementById("unreadCount").innerText
                                unreadCount = Number(unreadCount) + 1;
                                document.getElementById("unreadCount").innerText = unreadCount;
                            }
                        }, error: function(){

                        }
                    });
                });
                unread.addEventListener('click', function(){
                    $.ajax({
                        url: "updateReadUnread.ma",
                        type: "POST",
                        data: {
                            recMailNoListData: recMailNo + "," + mailNo,
                            recCheck: "Y"
                        },
                        success: function(result){
                            if(result != null) {
                                read.style.display = 'block';
                                unread.style.display = 'none';
                                let unreadCount = document.getElementById("unreadCount").innerText
                                unreadCount = Number(unreadCount) - 1;
                                document.getElementById("unreadCount").innerText = unreadCount;
                            }
                        }, error: function(){

                        }
                    });
                });
            };

            // 스팸 해제
            document.getElementById("spam_clear").addEventListener('click', function(){
                const recMailNo = document.getElementById("recMailNo").value;
                const form = document.createElement("form");
                const input = document.createElement("input");
                form.setAttribute("style", "display:none;");
                input.setAttribute("style", "display:none;");
                input.setAttribute("name", "recMailNo");
                input.setAttribute("value", recMailNo);
                form.append(input);
                form.method = "POST";
                form.action = "spamClear.ma";
                document.body.append(form);
                form.submit();
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
            
            // 이전 메일
            const prev = document.getElementById("before_mail")
            prev.addEventListener('click', function(){
                
            })

            // 다음 메일
            const next = document.getElementById("after_mail")
            next.addEventListener('click', function(){

            })
        </script>
    </div>
</body>
</html>