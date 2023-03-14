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
	h2 {padding:1% 1%;}
	table {border-collapse: collapse; width: 100%;}
	tr {text-align: center;}
	th, td {text-align: center; padding: 8px; border-bottom: 1px solid #ccc;}
	th {background-color: #ddd;}
	.views {text-align: center;}
   
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
	
		<jsp:include page="../board/boardSidebar.jsp" />
       
       		
       
        <div class="board">
        
        	 <h1>전체 공지사항</h1><br><br>
    
		    <div class="container" style="width:1000px">
		        <form>
		            <button type="button" class="btn btn-outline-success btn-sm"> 새글쓰기</button>
		            <button type="button" class="btn btn-outline-info btn-sm">수정</button>
		            <button type="button" class="btn btn-outline-dark btn-sm">삭제</button>
		            <button type="button" class="btn btn-outline-secondary btn-sm" style="float:right">목록으로</button> 
		            <br><hr><br>
		            
		            <table id="contentArea" align="center" class="table" border="1px, solid">
		                <tr>
		                    <th width="500" colspan="3">제목입니다</th>
		                </tr>
		                <tr>
		                    <td>
		                        이미지
		                    </td>
		                    <td>
		                        작성자 
		                    </td>
		                    <td>
		                        날짜
		                    </td>
		                </tr>
		                <tr>
		                    <td colspan="3">
		                        <input type="file">파일
		                    </td>
		                </tr>
		                <tr>
		                    <td colspan="4">
		                        <p style="height:150px">
		                        내용자리
		                        </p>
		                    </td>
		                </tr>
		            </table>
		        </form>
		    </div>
		
		    <div class="replyContent" >
		        <table id="replyArea" class="table" align="center" border="1px, solid" style="width:1000px">
		            <thead>
		                <tr>
		                    <td colspan="3">댓글 (<span id="rcount">3</span>) </td> 
		                 </tr>
		                <tr>
		                    <th colspan="2">
		                        <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
		                    </th>
		                    <th style="vertical-align: middle"><button class="btn btn-secondary">등록하기</button></th>
		                </tr>
		                
		            </thead>
		            <tbody>
		                <tr>
		                    <th>user02</th>
		                    <td>댓글입니다.1</td>
		                    <td>2020-04-10</td>
		                </tr>
		                <tr>
		                    <th>user01</th>
		                    <td>댓글입니다.2</td>
		                    <td>2020-04-08</td>
		                </tr>
		                <tr>
		                    <th>admin</th>
		                    <td>댓글입니다.3</td>
		                    <td>2020-04-02</td>
		                </tr>
		            </tbody>
		        </table>
		    </div>
        
        </div>
	</div>
	
	
</body>
</html>