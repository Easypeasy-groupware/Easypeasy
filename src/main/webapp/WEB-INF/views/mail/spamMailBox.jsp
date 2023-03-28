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
    .menu3{width: 120px;}
    .menu:hover{font-size: 15px; cursor: pointer;}

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
    .mail_imgList{width: 110px; text-align: center; line-height: 43px;}
    .mail_img{width: 30px; line-height: 2.5;}
    #selectMailLine:hover{font-weight: 600; cursor: pointer;}
    .mail_sender_name{width: 60px; margin-right: 15px; overflow: hidden;}
    .mail_sender{width: 180px; margin-right: 15px; overflow: hidden;}
    .mail_title{width: 380px; margin-right: 15px; overflow: hidden;}
    .mail_date{width: 160px; text-align: right;}
    .empty{height: 300px; line-height: 290px; text-align: center; font-size: 23px; font-weight: 600; color: gray;}

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

    <div style="position: absolute; top: 120px;">
        <!-- 메일 사이드바 -->
        <jsp:include page="mailSidebar.jsp" />

        <!-- 메일 컨텐트-->
        <div id="mail_content">
            <div id="mail_header">
                <div id="mail_header1" style="width:100%; float:left">
                    <div id="mail_header_info">
                        <b>스팸 메일함</b>
                        <img src="">
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
                    <div class="menu menu1" id="spam_clear"><img src="">스팸 해제</div>
                    <div class="menu menu2" id="complete_delete"><img src="">영구 삭제</div>
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
                <c:set var="mailCount" value="0" />
                <c:if test="${ not empty mailList }">
                    <c:forEach var="m" items="${ mailList }">
                        <c:if test="${ m.junkMail == 'Y' }">
                            <c:set var="mailCount" value="${mailCount + 1}" />
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
                                            ${m.empName}
                                        </div>
                                        <div class="mail_sender">
                                            ${ m.sendMailAdd }
                                        </div>
                                        <div class="mail_title">
                                            ${ m.mailTitle }
                                        </div>
                                        <div class="mail_date">
                                            ${ m.recDate }
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
                    const input = document.createElement("input");
                    input.setAttribute("style", "display:none")
                    input.setAttribute("name", "div");
                    input.setAttribute("value", 9);
                    this.append(input);
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

            // 스팸 해제
            let spamClear = document.getElementById("spam_clear");
            spamClear.addEventListener('click', function(){
            let checkedBoxSum = 0
            let count = 0;
            let arr = [];
                mailCheckBox.forEach((i) => {
                    if(i.checked == true) {
                        checkedBoxSum += 1;
                        let value = i.parentElement.parentElement.lastElementChild.getElementsByClassName("recMailNo")[0].value;
                        arr.push(value);
                    }
                })

                if(checkedBoxSum != 0) {
                    const form = document.createElement("form");
                    const input = document.createElement("input");
                    input.setAttribute("name", "recMailNoList");
                    input.setAttribute("multiple", "multiple")
                    input.setAttribute("value", arr)
                    form.append(input)
                    form.method = "POST"
                    form.action = "spamClear.ma"
                    document.body.append(form)
                    form.submit();
                }else {
                    alert('체크박스를 선택해주세요');
                }
            });

            // 영구 삭제
            let deleteMail = document.getElementById("complete_delete");
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

            // x button 닫기 효과
            let x_blocks = document.querySelectorAll('.x');
            x_blocks.forEach(function(x){
                x.addEventListener('click', function(){
                    this.parentNode.parentNode.style.display = 'none';
                })
            });
        </script>
    </div>
	

</body>
</html>