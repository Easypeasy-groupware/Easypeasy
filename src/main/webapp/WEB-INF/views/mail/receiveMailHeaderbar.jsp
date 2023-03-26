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
    #userInfo{display: none;}
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

    #paging{text-align: center; display: inline-block; padding-left :0; margin-top: 20px;}
    #paging li {text-align: center; float: left; list-style:none; border-radius:10px; margin:2px; background-color: rgb(234, 234, 234);}
    #paging li a {display: block; font-size: 12px; color: black; padding: 5px 10px; box-sizing: border-box; text-decoration-line:none;}
    #paging li.on {background:rgb(166, 184, 145);}
    #paging li.on a { color: white;}

    
</style>
</head>
<body>
    <div id="userInfo">${loginUser.email}</div>
    <div id="mail_header2">
        <div style="width: 27px; float: left; padding-left: 5px; padding-top: 8px;"><input type="checkbox" name="" id="check_all"></div>
        <div class="menu menu1" id="spam">스팸 등록</div>
        <div class="menu menu2" id="reply">답장</div>
        <div class="menu menu2" id="delete">삭제</div>
        <div class="menu menu2" id="tag">태그</div>
        <div class="menu menu2" id="forward">전달</div>
        <div class="menu menu2 read">읽음</div>
        <div class="menu menu2 unread">안읽음</div>
        <div class="menu menu1" id="refresh">새로고침</div>
        <div style="float: right; width: 150px; font-size: 12px;">
            정렬
            <select name="" id="">
                <option value="">최근 메일</option>
                <option value="">오래된 메일</option>
            </select>
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

    <script>
        document.addEventListener("DOMContentLoaded", function(){

            // 전역 번수 선언부
            let checkedBoxSum = 0
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
                mailSelectArea = document.querySelectorAll(".mail_select_area");
                checkedBoxSum = 0;
                index = 0;
                mailCheckBox.forEach((i, number) => {
                    if(i.checked == true) {
                        index = number
                        checkedBoxSum += 1;
                    }
                })
                if(checkedBoxSum == 1) {
                    mailSelectArea = mailSelectArea.item(index);
                    let replyAdd = mailSelectArea.getElementsByClassName("mail_sender");
                    if(replyAdd[0].innerText == userInfo.innerText){
                        alert('자신에게 답장할 수 없습니다.')
                    }else{
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
                    }
                }else{
                    alert('한 개의 체크박스를 선택해주세요!')
                }
            });

            // 전달
            let forward = document.getElementById("forward");
            forward.addEventListener('click', function(){
                let mailSelectArea = document.querySelectorAll(".mail_select_area");
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
                    form.setAttribute("style", "display:none;");
                    input.setAttribute("name", "recMailNoList");
                    input.setAttribute("value", arr);
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

            // 읽음 처리
            let read = document.querySelector(".read");
            read.addEventListener('click', function(){
                checkedBoxSum = 0
                arr = [];
                let recMailMoList = ""
                mailCheckBox.forEach((i, index) => {
                    if(i.checked == true) {
                        let value = i.parentElement.parentElement.lastElementChild.getElementsByClassName("recMailNo")[0].value;
                        arr.push(value);
                        checkedBoxSum += 1;
                    };
                })
                let recCheck = 'Y'
                for(let i=0; i<arr.length; i++){
                    recMailMoList += (arr[i] + ",");
                }
                if(checkedBoxSum > 0) {
                    $.ajax({
                        url:"updateReadUnread.ma",
                        type:"POST",
                        data:{
                            recMailNoListData: recMailMoList,
                            recCheck: recCheck
                        },
                        success: function(result){
                            let mailCount = 0
                            let unreadCount = 0;
                            result.mailList.forEach(function(i, index){
                                if(i.status == 'Y' && i.junkMail == 'N'){
                                    mailCount += 1;
                                }
                                if(i.recCheck == 'Y' && i.status == 'Y' && i.junkMail == 'N'){
                                    $(".mail_read").each(function(){
                                        if($(this).closest($(".mail_one")).find($(".recMailNo")).val() == i.recMailNo){
                                            $(this).attr("src", "resources/common_images/mail_read.png");
                                        };
                                    });
                                    unreadCount += 1;
                                };
                            });
                            $("input:checkbox").each(function(){
                                $(this).prop("checked", false);
                            })
                            $("#all_mail_no").text(mailCount);
                            $("#unread_mail_no").text(mailCount-unreadCount);
                        }, error: function(){

                        }
                    });
                }else{
                    alert('체크박스를 선택해주세요');
                }
            }); 

            
            // 안읽음 처리
            let unread = document.querySelector(".unread");
            unread.addEventListener('click', function(){
                checkedBoxSum = 0
                arr = [];
                let recMailMoList = ""
                mailCheckBox.forEach((i, index) => {
                    if(i.checked == true) {
                        let value = i.parentElement.parentElement.lastElementChild.getElementsByClassName("recMailNo")[0].value;
                        arr.push(value);
                        checkedBoxSum += 1;
                    };
                })
                let recCheck = 'N'
                for(let i=0; i<arr.length; i++){
                    recMailMoList += (arr[i] + ",");
                }
                if(checkedBoxSum > 0) {
                    $.ajax({
                        url:"updateReadUnread.ma",
                        type:"POST",
                        data:{
                            recMailNoListData: recMailMoList,
                            recCheck: recCheck
                        },
                        success: function(result){
                            let mailCount = 0
                            let readCount = 0;
                            result.mailList.forEach(function(i, index){
                                if(i.status == 'Y' && i.junkMail == 'N'){
                                    mailCount += 1;
                                }
                                if(i.recCheck == 'N' && i.status == 'Y' && i.junkMail == 'N'){
                                    $(".mail_read").each(function(){
                                        if($(this).closest($(".mail_one")).find($(".recMailNo")).val() == i.recMailNo){
                                            $(this).attr("src", "resources/common_images/mail_unRead.png");
                                        };
                                    });
                                    readCount += 1;
                                };
                            });
                            $("#all_mail_no").text(mailCount);
                            $("#unread_mail_no").text(readCount);
                            $("input:checkbox").each(function(){
                                $(this).prop("checked", false);
                            })
                        }, error: function(){

                        }
                    });
                }else{
                    alert('체크박스를 선택해주세요');
                }
            }); 

            // 새로고침
            let refresh = document.getElementById("refresh");
            refresh.addEventListener('click', function(){
                location.href = 'list.ma';
            });

            // 즐겨찾기
            let imporList = document.querySelectorAll('.mail_impor');
            imporList.forEach(function(impor){
                impor.addEventListener('click', function(){
                    console.log("즐겨찾기");
                });
            });
        });
    </script>
</body>
</html>