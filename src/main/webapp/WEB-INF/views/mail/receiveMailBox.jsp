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
    .empty{height: 300px; line-height: 290px; text-align: center; font-size: 23px; font-weight: 600; color: gray;}

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
                        <b>받은 메일함</b>
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
                        <b style="font-size: 20px;">안읽은 메일 </b>
                        <b id="unread_mail_no" style="color: crimson; font-size: 23px;">
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
                    </div>
                    
                    <jsp:include page="mailSearch.jsp" />
                    
                </div><br>
                <jsp:include page="receiveMailHeaderbar.jsp" />
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
                                            <div class="mail_img read"><img class="mail_impor impor" src="resources/common_images/favorite.png"></div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="mail_img unread"><img class="mail_impor unImpor" src="resources/common_images/unFavorite.png"></div>
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
    </div>

    <script>

        // 전체 체크박스 선택 취소
        let checkAll = document.getElementById("check_all");
        let mailCheckBox = document.querySelectorAll('.mail_checkbox');
        checkAll.addEventListener('change', function(event){
            mailCheckBox.forEach((checkbox) => {
                checkbox.checked = checkAll.checked;
            })
        });

        // 메일 상세조회
        let mailSelectList = document.querySelectorAll('.mail_select_area');
            mailSelectList.forEach(function(select){
                select.addEventListener('click', function(){
                    const input = document.createElement("input");
                    input.setAttribute("style", "display:none")
                    input.setAttribute("name", "div");
                    input.setAttribute("value", 1);
                    this.append(input);
                    this.action = "select.ma";
                    this.method = "POST";
                    console.log(this)
                    this.submit();
                });
            });

    </script>

</body>
</html>