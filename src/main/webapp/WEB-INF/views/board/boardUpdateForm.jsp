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
    .wrapper { width: 1200px; margin: 0 auto;}
    body {font-family: Arial, sans-serif; margin: 0; padding: 0;}

    /* 게시판 스타일 */
    .board {width: 1000px;float: right;}
    .container {margin: 20px auto; width: 900px; padding: 20px;}
    .replyContent{margin: 20px auto; width: 900px; padding: 10px;}
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
        	<form id="enrollForm" method="post" action="update.bo" enctype="multipart/form-data">
          <h3>게시글 수정/삭제</h3>
          <br><br>
          	  <input type="hidden" name="boardNo" value="${b.boardNo}">
              <label>게시판그룹</label>
                  <select name="boardCno">
                      <option value="1" name="boardCno" id="1">전체 공지사항</option>
                      <option value="2" name="boardCno" id="2">식단표</option>
                      <option value="3" name="boardCno" id="3">자유게시판</option>
                      <option value="4" name="boardCno" id="4">커뮤니티</option>
                      <option value="5" name="boardCno" id="5">부서 공지사항</option>
                      <option value="6" name="boardCno" id="6">부서 자유게시판</option>
                  </select><br>
              <label for="title">게시글 제목</label>
                  <input type="text" id="boardTitle" name="boardTitle" required /><br>
              	  <input type="hidden" name="boardWriter" value="${loginUser.empNo}">
              
              
              <label for="file">파일첨부</label>
                  <table>
                  	<tr>
	                  <td>
		                  <button id="file_choose" type="button" class="btn btn-secondary btn-sm">파일 선택</button>
	                      <button id="file_delete" type="button" class="btn btn-secondary btn-sm">모두 삭제</button>
		              </td>
		            </tr>
	                  <td colspan="2" id="attach_area">
	                         <c:choose>
                                  <c:when test="${ empty attachmentList }">
                                          <div>첨부파일이 없습니다.</div>
                                  </c:when>
                                  <c:otherwise>
                                      <c:forEach var="a" items="${ attachmentList }">
                                           <a href="${ a.changeName }" download="${ a.originName }">${ a.originName }</a><br>
                                       </c:forEach>
                                   </c:otherwise>
                             </c:choose>
	                 </td>
                  </table>
              <br>    
              
              
              <label for="content">내용</label>
                  <textarea name="boardContent" id="boardContent" cols="30" rows="10" required></textarea><br>
              <label for="boardPin">공지등록</label>
                  <input type="checkbox" id="N" name="boardPin" /><br>
               
                    <br><br>
              <div align="center">
                <button type="button" class="btn btn-dark" onclick="javascript:history.go(-1);">이전으로</button>
                <button type="submit" class="btn btn-success">수정하기</button>
                <button type="button" class="btn btn-secondary">삭제하기</button>
              </div>
              </form>
        </div>
	</div>
</body>
</html>