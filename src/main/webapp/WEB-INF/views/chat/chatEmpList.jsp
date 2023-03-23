<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

a {
    text-decoration: none;
}

.chat-area {
    padding: 40px 0;
    background-color: #A8C0D6;
}

.chat-area .chat {
    display: flex;
    align-items: flex-start;
    padding: 20px;
}

.chat-area .chat .icon {
    position: relative;
    overflow: hidden;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background-color: #eee;
}

.chat-area .chat .icon i {
    position: absolute;
    top: 10px;
    left: 50%;
    font-size: 2.5rem;
    color: #aaa;
    transform: translateX(-50%);
}

.chat-area .chat .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 10px;
    margin-top: 7px;
    font-size: 13px;
    border-radius: 10px;
}

.chat-area .chat .textbox::before {
    position: absolute;
    display: block;
    top: 0;
    font-size: 1.5rem;
}

.chat-area .ch1 .textbox {
    margin-left: 20px;
    background-color: #ddd;
}

.chat-area .ch1 .textbox::before {
    left: -15px;
    content: "◀";
    color: #ddd;
}

.chat-area .ch2 {
    flex-direction: row-reverse;
}

.chat-area .ch2 .textbox {
    margin-right: 20px;
    background-color: #F9EB54;
}

.chat-area .ch2 .textbox::before {
    right: -15px;
    content: "▶";
    color: #F9EB54;
}
 </style>
</head>
<body>

    <div class="chat-area">
        <div class="chat ch1">
            <div class="icon"><i class="fa-solid fa-user"></i></div>
            <div class="textbox">안녕하세요. 반갑습니다.</div>
        </div>
        <div class="chat ch2">
            <div class="icon"><i class="fa-solid fa-user"></i></div>
            <div class="textbox">안녕하세요. 친절한효자손입니다. 그동안 잘 지내셨어요?</div>
        </div>
        <div class="chat ch1">
            <div class="icon"><i class="fa-solid fa-user"></i></div>
            <div class="textbox">아유~ 너무요너무요! 요즘 어떻게 지내세요?</div>
        </div>
        <div class="chat ch2">
            <div class="icon"><i class="fa-solid fa-user"></i></div>
            <div class="textbox">뭐~ 늘 똑같은 하루 하루를 보내는 중이에요. 코로나가 다시 극성이어서 모이지도 못하구 있군요 ㅠㅠ 얼른 좀 잠잠해졌으면 좋겠습니다요!</div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>  


</body>
</html>