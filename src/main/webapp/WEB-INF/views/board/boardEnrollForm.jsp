<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 전체 wrapper */
    .wrapper { width: 1200px; margin: 0 auto;} /* 중앙 정렬을 위한 margin: 0 auto; */
    body {font-family: Arial, sans-serif; margin: 0; padding: 0;}
    /* 게시판 스타일 */
    .board {width: 1000px;float: right;}
    .container {margin: 20px auto; width: 900px; padding: 20px;}
    form {max-width: 1000px; margin: 0 auto; padding: 20px; border-radius: 5px; box-sizing: border-box;}
    label {display: inline-block; margin-bottom: 5px; font-weight: bold;}
	input[type="text"],input[type="file"],textarea,
	select {width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 3px; box-sizing: border-box; margin-bottom: 20px; font-size: 16px; font-family: inherit;}
	select {height: 40px;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
	
		<jsp:include page="../board/boardSidebar.jsp" />
       
        <div class="board">
        	<form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">
          <h3>게시글 작성</h3>
          <br><br>
              <label>게시판그룹</label>
                  <select name="boardType">
                      <option value="">전체 공지사항</option>
                      <option value="">식단표</option>
                      <option value="">자유게시판</option>
                      <option value="">커뮤니티</option>
                      <option value="">부서 공지사항</option>
                      <option value="">부서 자유게시판</option>
                  </select><br>
              <label for="title">게시글 제목</label>
                  <input type="text" id="title" name="title" required /><br>
              <label for="title">파일첨부</label>
                  <input type="file" id="file" name="file" /><br>
              <label for="about">내용</label>
                  <textarea name="" id="" cols="30" rows="10" required placeholder="내용을 입력하세요"></textarea><br>
              <label for="title">공지등록</label>
                  <input type="checkbox" id="tckb" name="tckb" /><br>
               
                    <br><br>
              <div align="center">
                <button type="button" class="btn btn-dark" onclick="javascript:history.go(-1);">이전으로</button>
                <button type="submit" class="btn btn-success">등록하기</button>
                <button type="button" class="btn btn-secondary">임시저장</button>
              </div>
        </div>
	</div>
</body>
</html>