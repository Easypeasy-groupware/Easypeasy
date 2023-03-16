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
	input[type="text"],textarea,
	select {width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 3px; box-sizing: border-box; margin-bottom: 20px; font-size: 16px; font-family: inherit;}
	select {height: 40px;}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
	
		<jsp:include page="../board/boardSidebar.jsp" />
       
        <div class="board">
        
        	<form action="" method="POST">
                <h2>게시판 추가</h2>
                <br><br>
                    <label>게시판그룹</label>
                        <select name="boardCno" required>
                            <option value="1">전체 공지사항</option>
                            <option value="2">식단표</option>
                            <option value="3">자유게시판</option>
                            <option value="4">커뮤니티</option>
                            <option value="5">부서 공지사항</option>
                            <option value="6">부서 자유게시판</option>
                        </select><br>
                    
                    <hr>
                    
                    <label for="title">게시판 제목:</label>
                        <input type="text" id="title" name="title" required /><br>
                    <label for="about">설명:</label>
                        <textarea name="" id="" cols="20" rows="3" required placeholder="내용을 입력하세요"></textarea><br>
        
                    <hr>
        
                    <label>전체공개 설정</label><br>
                        <input type="radio" id="all" name="display" checked/>전체 부서 공개  &nbsp;&nbsp;
                        <input type="radio" id="dc" name="display" />해당 부서 공개 
                        <button type="button" class="btn btn-outline-primary">+ 부서 추가</button><br><br>
                    
                    <label>비공개 설정</label><br>
                        <input type="radio" id="n" name="status" checked/>사용하지 않음  &nbsp;&nbsp;
                        <input type="radio" id="y" name="status" />사용함<br><br>
                    
                    <label>익명 설정</label><br>
                        <input type="radio" id="n" name="anonym" checked/>사용하지 않음  &nbsp;&nbsp;
                        <input type="radio" id="y" name="anonym" />사용함<br><br>
                    
                    <label>댓글 작성</label><br>
                        <input type="radio" id="y" name="reply" checked/>허용  &nbsp;&nbsp;
                        <input type="radio" id="n" name="reply" />허용하지 않음<br>
                    
                    <br><br><br>
					<div align="center">
						<button type="button" class="btn btn-secondary" onclick="javascript:history.go(-1);">이전으로</button>
						<button type="submit" class="btn btn-success">등록하기</button>
					</div>
            </form>   
        
        </div>
        
	</div>
</body>
</html>