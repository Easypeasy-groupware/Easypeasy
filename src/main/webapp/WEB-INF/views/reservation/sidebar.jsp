<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<!-- Bootstrap 5.2.3 Version -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 달력 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"></script>
<style>
	#sidebar{
		border-right: 2px solid rgb(185, 187, 221);
        width: 200px;
        height: 1000px;
        float: left;
        padding-left: 30px;
        padding-top: 5px;
    }
    #sidebar a{
        color: black;
        text-decoration: none;
    }
    #slide2, #slide3, #slide2-1-1, #slide2-2-1, #slide3-1-1{
        display: none;
    }
</style>
</head>
<body>

	<div id="sidebar">
        <h5>
            <a href="">예약</a>
        </h5>
        <br>
        <div id="slide1">전사자산 <i id="upDown1" class="fas fa-regular fa-angle-down"></i></div>
        <div id="slide2">
            <div id="slide2-1"><a href="">회의실</a> <i id="upDown2-1" class="fas fa-regular fa-angle-down"></i></div>
            <div id="slide2-1-1">
                <span style="font-size: small;"><a href="">A회의실(20명)</a></span><br>
                <span style="font-size: small;"><a href="">B회의실(15명)</a></span><br>
                <span style="font-size: small;"><a href="">C회의실(6명)</a></span>
            </div>
            <div id="slide2-2"><a href="">빔프로젝터</a> <i id="upDown2-2" class="fas fa-regular fa-angle-down"></i></div>
            <div id="slide2-2-1">
                <span style="font-size: small;"><a href="">1번 프로젝터</a></span><br>
                <span style="font-size: small;"><a href="">2번 프로젝터</a></span><br>
                <span style="font-size: small;"><a href="">3번 프로젝터</a></span>   
            </div> 
        </div>
        <div id="slide3">
            <div id="slide3-1">예약관리 <i id="upDown3" class="fas fa-regular fa-angle-down"></i></div>
            <div id="slide3-1-1">
                <span style="font-size: small;"><a href="">자산 관리</a></span><br>
            </div>
        </div>
    </div>

    <script>
        $("#slide1").click(function(){
            const $s = $(this).nextAll("div");

            if($s.css("display") == "none"){
                $s.siblings("#slide2, #slide3").slideUp();
                $("#upDown1").attr("class", "fas fa-regular fa-angle-up")
                $s.slideDown();
            }else {
                $("#upDown1").attr("class", "fas fa-regular fa-angle-down")
                $s.slideUp();
            }
        })

        $("#slide2-1").click(function(){
            const $s = $(this).next("div");

            if($s.css("display") == "none"){
                $s.siblings("#slide2-1-1").slideUp();
                $("#upDown2-1").attr("class", "fas fa-regular fa-angle-up")
                $s.slideDown();
            }else {
                $("#upDown2-1").attr("class", "fas fa-regular fa-angle-down")
                $s.slideUp();
            }
        })

        $("#slide2-2").click(function(){
            const $s = $(this).next("div");

            if($s.css("display") == "none"){
                $s.siblings("#slide2-2-1").slideUp();
                $("#upDown2-2").attr("class", "fas fa-regular fa-angle-up")
                $s.slideDown();
            }else {
                $("#upDown2-2").attr("class", "fas fa-regular fa-angle-down")
                $s.slideUp();
            }
        })

        $("#slide3-1").click(function(){
            const $s = $(this).next("div");

            if($s.css("display") == "none"){
                $s.siblings("#slide3-1-1").slideUp();
                $("#upDown3").attr("class", "fas fa-regular fa-angle-up")
                $s.slideDown();
            }else {
                $("#upDown3").attr("class", "fas fa-regular fa-angle-down")
                $s.slideUp();
            }
        })
    </script>
	
</body>
</html>