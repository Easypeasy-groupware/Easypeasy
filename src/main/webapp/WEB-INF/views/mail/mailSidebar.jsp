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
    #mail_side_bar{width: 200px; height: 1000px; float: left; border-right: 2px solid rgb(185, 187, 221); padding: 10px;}
    #send_mail_btn{width: 170px;}
    .mailbox_subject{width: 157px; float: left; font-size: 18px; font-weight: 700; color: darkslategrey;}
    .settings{width: 13px; padding-top: 5px;}
    .boxList{width: 170px;}
    .boxList>div{width: 140px; float: left; margin: 5px 0px 0px 15px; padding: 5px 0px 5px 0px; font-size: 14px;}
    .boxList>img{width: 15px; margin: 5px 0px 5px 0px; padding: 5px 0px 5px 0px;}
    #tagList{min-height: 0px; max-height: 200px; overflow-y: auto; overflow-x: hidden;}
    #tagList>div{float: left;}
    .tag{width: 200px; float: left; margin: 0px 0px 2px 10px;}
    .tag>div{font-size: 14px;}
    .tagTriangle{width: 10px; height: 0px; float: left; border-top: 8px solid transparent; 
                 border-left: 15px solid pink; border-bottom: 8px solid transparent; margin-top: 6px; margin-right: 10px;}
    .tagTriangle+div{width: 140px; height: 17px; margin: 3px 0px 3px 0px; overflow: hidden;}
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
        <h2>메일</h2>
        <br>
        <form action="enrollForm.sm">
            <button id="send_mail_btn" class="btn btn-outline-dark">메일 쓰기</button>
        </form>
        <br><br><br>
        <div>
            <div class="mailbox_subject">즐겨찾기</div>
            <img class="settings" src="resources/common_images/setting.png">
            <br><br>
            <div class="boxList">
                <div>안읽은 메일함</div><img class="favorite" src="resources/common_images/favorite.png">
                <div>중요 메일함</div><img class="favorite" src="resources/common_images/favorite.png">
                <div>작성중인 메일함</div><img class="favorite" src="resources/common_images/favorite.png">
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
                            <div class="tagTriangle" style="border-left: 15px solid ${t.tagColor};"></div><div>${ t.tagName }</div>
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
            <img class="settings" src="resources/common_images/setting.png">
            <br><br>
            <div class="boxList">
                <div>받은 메일함(전체)</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div>오늘 온 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div>내게 쓴 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div>첨부 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div>보낸 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div>예약 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div style="width: 200px;">
                    <div id="spambox">스팸 메일함 </div>
                    <button class="btn btn-outline-secondary btn-sm">비우기</button>
                </div>
                <div style="width: 200px;">
                    <div id="trashcan">휴지통 </div>
                    <button class="btn btn-outline-secondary btn-sm">비우기</button>
                </div>
            </div>
        </div>
        <br><br>
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
	
</body>
</html>