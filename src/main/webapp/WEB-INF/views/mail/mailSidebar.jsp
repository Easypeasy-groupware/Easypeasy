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
    .boxList>div{width: 140px; float: left; margin: 5px 0px 0px 15px; padding: 5px 0px 5px 0px; font-size: 14px;}
    .boxList>img{width: 15px; margin: 5px 0px 5px 0px; padding: 5px 0px 5px 0px;}
    #tagList{min-height: 0px; max-height: 110px; overflow-y: auto; overflow-x: hidden;}
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
    .tag{width: 200px; float: left; margin: 0px 0px 2px 10px;}
    .mail_tag{width: 30px; line-height: 32px; float: left;}
    .tagOne{float: left;}
    .tag>div{font-size: 14px;}
    #add_tag{width: 100%; padding: 15px 0px 0px 20px; margin-bottom: 42px; font-size: 14px; font-weight: 600; color: gray;}
    #add_tag_view{width: 300px; height: 350px; padding-top: 15px;  position: absolute; top: 400px; left: 600px; border-radius: 10px;
                  border: 1px solid rgb(185, 187, 221); background: white; z-index: 10; display: none;}
    #select_tag_color{width: 100%; height: 80px; margin: auto;}
    #select_tag_color>div{width: 15px; height: 15px; margin: 4px; float: left; background-color: brown;}

    .favorite{width: 16px;}
    #spambox, #trashcan{width: 125px; float: left;}
    #spambox+button, #trashcan+button{width: 40px; font-size: 10px; padding: 4px;}

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
        <br><br><br>
        <div>
            <div class="mailbox_subject">즐겨찾기</div>
            <img class="settings" src="resources/common_images/setting.png">
            <br><br>
            <div class="boxList">
                <div class="mailbox" id="unread_box">안읽은 메일함</div><img class="favorite" src="resources/common_images/favorite.png">
                <div class="mailbox" id="impor_box">중요 메일함</div><img class="favorite" src="resources/common_images/favorite.png">
                <div class="mailbox" id="temp_box">작성중인 메일함</div><img class="favorite" src="resources/common_images/favorite.png">
            </div>
        </div>
        <br><br>
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

        <script>
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
        </script>

        <div>
            <div class="mailbox_subject">메일함</div>
            <img class="settings" src="resources/common_images/setting.png">
            <br><br>
            <div class="boxList">
                <div id="recMailbox" class="mailbox">받은 메일함(전체)</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div class="mailbox" id="today_box">오늘 온 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div class="mailbox" id="tome_box">내게 쓴 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div class="mailbox" id="attach_box">첨부파일 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div class="mailbox" id="send_box">보낸 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div class="mailbox" id="reservation_box">예약 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div style="width: 200px;">
                    <div class="mailbox" id="spambox">스팸 메일함 </div>
                    <button id="spam_completeDel" class="btn btn-outline-secondary btn-sm">비우기</button>
                </div>
                <div style="width: 200px;">
                    <div class="mailbox" id="trashcan">휴지통 </div>
                    <button id="trashcan_completeDel" class="btn btn-outline-secondary btn-sm">비우기</button>
                </div>
            </div>
        </div>
        <br><br>
    </div>

    <script>
        // 받은 메일함 이동
        document.getElementById("recMailbox").addEventListener("click", function(){
            location.href="list.ma";
        });

        // 오늘 온 메일함
        document.getElementById("today_box").addEventListener("click", function(){
            location.href="todayList.ma";
        });

        // 내게 쓴 메일함
        document.getElementById("tome_box").addEventListener("click", function(){
            location.href="tomeList.ma";
        });

        // 첨부파일 메일함
        document.getElementById("attach_box").addEventListener("click", function(){
            location.href="attachList.ma";
        });

        // 예약 메일함
        document.getElementById("reservation_box").addEventListener("click", function(){
            location.href="reservationList.ma";
        });

        // 중요 메일함
        document.getElementById("impor_box").addEventListener("click", function(){
            location.href="imporList.ma";
        });

        // 안읽은 메일함
        document.getElementById("unread_box").addEventListener("click", function(){
            location.href="unreadList.ma";
        });

        // 작성중인 메일함
        document.getElementById("temp_box").addEventListener("click", function(){
            location.href="tempList.ma";
        });

        // 보낸 메일함
        document.getElementById("send_box").addEventListener("click", function(){
            location.href="sendList.ma";
        });

        // 스팸 메일함 이동
        document.getElementById("spambox").addEventListener("click", function(){
            location.href="spamList.ma";
        });

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

        // 휴지통 이동
        document.getElementById("trashcan").addEventListener("click", function(){
            location.href="deleteList.ma";
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
                    console.log(input)
                    form.submit();
                }
            });
        });
    </script>
    

</body>
</html>