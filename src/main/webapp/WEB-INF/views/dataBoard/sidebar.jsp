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
<!-- icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"></script>
</head>
<style>
     #sidebar{
        width: 200px;
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
<body>
	<div id="sidebar">
        <h5>
            <a href="">자료실</a>
        </h5>
        <br>
        <div id="slide1">전사 자료실</div>
        
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