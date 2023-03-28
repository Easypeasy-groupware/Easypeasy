<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	/* 메일 사이드바 css*/
    .menu-title{margin:20px 0 20px 0; text-align:center;}
    #title{font-size:20px; font-weight:600; color:rgb(93, 109, 75);}
    #title:hover{color:rgb(58, 69, 47); text-decoration:none;}
    .menu-btn{width:70%; height:35px; margin:auto; margin-bottom:15px; padding:5px 0 5px 0; background-color: rgb(142, 161, 122); border-radius:4px; text-align:center;}
	#menu-add-btn{color:white; text-decoration:none; cursor: pointer;}
	.menu-btn:hover{background-color: rgb(93, 105, 81);}
    .mailbox:hover{font-weight: 600; cursor: pointer;}
    .tagOne:hover{font-weight: 600; cursor: pointer;}
    #mail_side_bar{width: 200px; height: 1010px; float: left; border-right: 2px solid rgb(185, 187, 221); padding: 10px;}
    .mailbox_subject{width: 157px; float: left; font-size: 18px; font-weight: 700; color: darkslategrey;}
    .settings{width: 13px; padding-top: 5px;}
    .boxList{width: 170px;}
    .boxListOne>div{width: 140px; float: left; margin: 5px 0px 0px 15px; padding: 5px 0px 5px 0px; font-size: 14px;}
    .boxListOne>img{width: 15px; margin: 5px 0px 5px 0px; padding: 6px 0px 5px 0px;}
    #tagList{min-height: 0px; max-height: 160px; overflow-y: auto; overflow-x: hidden;}
    #tagList>div{float: left;}
    .tagBoxList{width: 30px; float: left; float: left; line-height: 15px;}
    .tagBlock{display: inline-block; position: relative;}
    .tag_innerBlock1{display: inline-block; position: relative; width: 12px; height: 12px; margin: 0 8px 0 0; vertical-align: middle;}
    .tag_innerBlock1 span.tag_innerBlock2{border-bottom: 6px solid transparent; border-style: solid; border-top: 6px solid transparent; border-width: 6px 0 6px 6px; 
                                          right: -7px; top: -1px;}
    .tagColor .tag_innerBlock2{border-color: #42d692;}             
    .tag_innerBlock1 span{position: absolute; width: 0; height: 0;}
    .tag_innerBlock1 span.tag_innerBlock2 span{border-bottom: 5px solid transparent; border-style: solid; border-top: 5px solid transparent; border-width: 5px 0 5px 5px;
                                               right: 2px; top: -5px;}
    .tag{width: 200px; float: left; margin: 0px 0px 6px 10px;}
    .mail_tag{width: 30px; line-height: 32px; float: left;}
    .tagOne{float: left;}
    .tag>div{font-size: 14px;}
    #add_tag{width: 100%; padding: 15px 0px 0px 20px; margin-bottom: 42px; font-size: 14px; font-weight: 600; color: gray;}
    #add_tag_view{width: 300px; height: 350px; padding-top: 15px;  position: absolute; top: 400px; left: 600px; border-radius: 10px;
                  border: 1px solid rgb(185, 187, 221); background: white; z-index: 10; display: none;}
    #select_tag_color{width: 100%; height: 80px; margin: auto;}
    #select_tag_color>div{width: 15px; height: 15px; margin: 4px; float: left; background-color: brown;}

    .favorite{width: 16px;}
    .trashmailbox{width: 185px;}
    .trashmailbox>div{width: 140px; float: left; margin: 5px 0px 0px 15px; padding: 5px 0px 5px 0px; font-size: 14px;}
    #spambox, #trashcan{width: 125px; float: left;}
    #spambox+button, #trashcan+button{width: 40px; font-size: 10px; padding: 4px; margin-top: 10px;}

</style>
</head>
<body>
	
	<!-- 메일 사이드바 -->
    <div id="mail_side_bar">
        <div class="menu-title">
            <p id="title">메일</p>
        </div>
        <div class="menu-btn">
            <a href="enrollForm.sm" id="menu-add-btn">메일 쓰기</a>
        </div>
        <br>
        <div>
            <div class="mailbox_subject">태그</div>
            <br><br>
            <div id="tagList">
                <c:if test="${ not empty tagList }" >
                    <c:forEach var="t" items="${ tagList }" >
                        <div class="tag">
                            <div class="tagBoxList">
                                <span class="tagBlock">
                                    <span class="tag_innerBlock1 tagColor" style="background-color: ${t.tagColor}; border: 1px solid ${t.tagColor};">
                                        <span class="tag_innerBlock2" style="border-inline-color: inherit;">
                                            <span style="border-inline-color: inherit;"></span>
                                        </span>
                                    </span>
                                </span>
                            </div>
                            <div class="tagOne">${ t.tagName }</div>
                            <input type="hidden" class="tagNo" name="tagNo" value="${ t.tagNo }" >
                        </div>
                    </c:forEach>
                </c:if>
            </div>
            <div id="add_tag"> + 태그 추가</div>

            <!-- 태그 추가 화면 -->
            <form id="add_tag_view" action="insert.tg" method="POST">
                <b style="line-height: 50px; font-size: 20px; padding-left: 30px; color: grey;">태그 추가</b>
                <br><br>
                <div style="width: 80%; margin: auto;">
                    <b style="color: rgb(80, 80, 80); margin-bottom: 3px;">새 태그 이름을 입력해주세요</b>
                    <input id="tagName" type="text" name="tagName" style="width: 100%; margin-top: 5px; box-sizing: border-box;">
                </div>
                <div style="width: 80%; margin: auto; margin-top: 15px; margin-bottom: 15px; border: 1px solid rgb(185, 187, 221);"></div>
                <div style="width: 80%; margin: auto;">
                    <b style="color: rgb(80, 80, 80); margin-bottom: 3px;">태그 색상을 선택해주세요</b>
                    <div id="select_tag_color">
                        <div style="background-color: cadetblue;"></div>
                        <div style="background-color: darkseagreen;"></div>
                        <div style="background-color: greenyellow;"></div>
                        <div style="background-color: cornflowerblue;"></div>
                        <div style="background-color: crimson;"></div>
                        <div style="background-color: coral;"></div>
                        <div style="background-color: darkcyan;"></div>
                        <div style="background-color: darkgoldenrod;"></div>
                        <div style="background-color: darkblue;"></div>
                        <div style="background-color: darkgreen;"></div>
                        <div style="background-color: darkgrey;"></div>
                        <div style="background-color: darkslategray;"></div>
                        <div style="background-color: darkmagenta;"></div>
                        <div style="background-color: darkturquoise;"></div>
                        <div style="background-color: dodgerblue;"></div>
                        <div style="background-color: gold;"></div>
                        <div style="background-color: deeppink;"></div>
                        <div style="background-color: wheat;"></div>
                        <div style="background-color: brown;"></div>
                        <div style="background-color: black;"></div>
                    </div>
                    <input type="hidden" id="tagColor" name="tagColor">
                    <input type="hidden" name="empNo" value="${loginUser.empNo}" />
                </div>
                <div style="width: 100%; text-align: center;">
                    <button class="btn btn-danger">추가</button>
                    <button class="x btn btn-secondary" type="button">취소</button>
                </div>
            </form>
        </div>

        <div>
            <div class="mailbox_subject">메일함</div>
            <br><br>
            <div class="boxList normal">
                <div class="boxListOne">
                    <div id="recMailbox" class="mailbox">받은 메일함(전체)</div>
                </div>
                <div class="boxListOne">
                    <div class="mailbox" id="today_box">오늘 온 메일함</div>
                </div>
                <div class="boxListOne">
                    <div class="mailbox" id="tome_box">내게 쓴 메일함</div>
                </div>
                <div class="boxListOne">
                    <div class="mailbox" id="attach_box">첨부파일 메일함</div>
                </div>
                <div class="boxListOne">
                    <div class="mailbox" id="send_box">보낸 메일함</div>
                </div>
                <div class="boxListOne">
                    <div class="mailbox" id="unread_box">안읽은 메일함</div>
                </div>
                <div class="boxListOne">
                    <div class="mailbox" id="impor_box">중요 메일함</div>
                </div>
                <div class="boxListOne">
                    <div class="mailbox" id="temp_box">작성중인 메일함</div>
                </div>
                <div class="trashmailbox">
                    <div class="mailbox" id="spambox">스팸 메일함</div>
                    <button id="spam_completeDel" class="btn btn-outline-secondary btn-sm">비우기</button>
                </div>
                <div class="trashmailbox">
                    <div class="mailbox" id="trashcan">휴지통</div>
                    <button id="trashcan_completeDel" class="btn btn-outline-secondary btn-sm">비우기</button>
                </div>
            </div>
        </div>
        <br><br>
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

            // 중요 메일 등록
            let imporList = document.querySelectorAll('.mail_impor');
            imporList.forEach(function(impor){
                impor.addEventListener('click', function(){
                    const recMailNo = this.closest(".mail_one").getElementsByClassName("recMailNo")[0].value;
                    let imporMail;
                    if($(this).attr("src") == "resources/common_images/unFavorite.png") {
                        imporMail = 'Y'
                    }else{
                        imporMail = 'N'
                    }
                    $.ajax({
                        url: "imporEroll.ma",
                        type: "POST",
                        data: {
                            recMailNo: recMailNo,
                            imporMail: imporMail
                        },
                        success:function(result){
                            if(result == 1 && imporMail == 'Y'){
                                $(".mail_impor").each(function(){
                                    if($(this).closest($(".mail_one")).find($(".recMailNo")).val() == recMailNo){
                                        $(this).attr("src", "resources/common_images/favorite.png");
                                    };
                                });
                            }else if(result == 1 && imporMail == 'N'){
                                $(".mail_impor").each(function(){
                                    if($(this).closest($(".mail_one")).find($(".recMailNo")).val() == recMailNo){
                                        $(this).attr("src", "resources/common_images/unFavorite.png");
                                    };
                                });
                            }

                        }, error:function(){

                        }
                    });
                });
            });

            // 태그 추가 화면
            document.getElementById("add_tag").addEventListener('click', function(){
                document.getElementById("add_tag_view").style.display = 'block'
            });
            
            // tag_color 선택
            let tagColorList = document.querySelectorAll("#select_tag_color div");
            tagColorList.forEach(function(tagColor){
                tagColor.addEventListener('click', function(){
                    tagColorList.forEach(function(tagColor){
                        tagColor.style.border = "none"
                    });
                    this.style.border = "2px dashed white";
                    const inputColor = document.getElementById("tagColor");
                    let colorValue = this.getAttribute("style").split(': ', 2)[1].split(';', 1)[0];
                    inputColor.setAttribute("value", colorValue);
                });
            });

            // 받은 메일함 이동
            document.querySelectorAll(".mailbox").forEach(function(selectBox){
                selectBox.addEventListener("click", function(){
                    if(this.innerText == "받은 메일함(전체)"){
                        location.href="list.ma";
                    }else if(this.innerText == "오늘 온 메일함"){
                        location.href="todayList.ma";
                    }else if(this.innerText == "내게 쓴 메일함"){
                        location.href="tomeList.ma";
                    }else if(this.innerText == "첨부파일 메일함"){
                        location.href="attachList.ma";
                    }else if(this.innerText == "보낸 메일함"){
                        location.href="sendList.ma";
                    }else if(this.innerText == "안읽은 메일함"){
                        location.href="unreadList.ma";
                    }else if(this.innerText == "중요 메일함"){
                        location.href="imporList.ma";
                    }else if(this.innerText == "작성중인 메일함"){
                        location.href="tempList.ma";
                    }else if(this.innerText == "예약 메일함"){
                        location.href="reservationList.ma";
                    }else if(this.innerText == "스팸 메일함"){
                        location.href="spamList.ma";
                    }else if(this.innerText == "휴지통"){
                        location.href="deleteList.ma";
                    }
                })
            })

            // 스팸 메일함 비우기
            document.getElementById("spam_completeDel").addEventListener("click", function(){
                swal({
                    title: "영구 삭제하시겠습니까?",
                    text: "삭제된 메일들은 복구되지 않습니다.",
                    icon: "warning",
                    buttons: ["취소", "삭제"],
                    dangerMode: true,
                })
                .then((willDelete) => {
                    if(willDelete){
                        let form = document.createElement("form");
                        let input = document.createElement("input");
                        input.setAttribute("name", "junkMail");
                        input.setAttribute("value", "Y");
                        form.action = "completeDelete.ma";
                        form.method = "POST";
                        form.append(input);
                        document.body.append(form);
                        form.submit();
                    }
                });
            });

            // 휴지통 비우기
            document.getElementById("trashcan_completeDel").addEventListener("click", function(){
                swal({
                    title: "영구 삭제하시겠습니까?",
                    text: "삭제된 메일들은 복구되지 않습니다.",
                    icon: "warning",
                    buttons: ["취소", "삭제"],
                    dangerMode: true,
                })
                .then((willDelete) => {
                    if(willDelete){
                        let form = document.createElement("form");
                        let input = document.createElement("input");
                        input.setAttribute("name", "status");
                        input.setAttribute("value", "N");
                        form.action = "completeDelete.ma";
                        form.method = "POST";
                        form.append(input);
                        document.body.append(form);
                        form.submit();
                    }
                });
            });

            document.querySelectorAll(".tagOne").forEach(function(tag){
                tag.addEventListener('click', function(){
                    let form = document.createElement("form");
                    let input = document.createElement("input");
                    input.setAttribute("name", "tagNo");
                    input.setAttribute("value", this.nextElementSibling.value);
                    form.action = "tagginMailList.ma";
                    form.method = "POST";
                    form.append(input);
                    document.body.append(form);
                    form.submit();
                });
            });

        });    
    </script>

</body>
</html>