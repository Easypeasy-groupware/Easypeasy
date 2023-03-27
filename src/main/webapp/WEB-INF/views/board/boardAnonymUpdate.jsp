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
    .wrapper { width: 1200px; margin: 0 auto; position: absolute; top: 120px}
    body {font-family: Arial, sans-serif; margin: 0; padding: 0;}

    /* 게시판 스타일 */
    .board {width: 1000px;float: right;}
    .container {margin: 20px auto; width: 900px; padding: 20px;}
    form {max-width: 1000px; margin: 0 auto; padding: 20px; border-radius: 5px; box-sizing: border-box;}
    label {display: inline-block; margin-bottom: 5px; font-weight: bold;}
	input[type="text"],input[type="file"],textarea,
	select {width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 3px; box-sizing: border-box; margin-bottom: 20px; font-size: 16px; font-family: inherit;}
	select {height: 40px;}
	
	/* 파일첨부 스타일 */
	#attach_area{height: 100px; border: 2px dashed gray; background: whitesmoke; vertical-align: middle;}
    #no_attachment{width: 100%; margin: auto; display: block;}
    #no_attachment img, #no_attachment div{float: left;}
    #no_attachment div{margin-left: 10px; line-height: 26px; font-size: 18px; font-weight: 600; color: gray;}
    #in_attachments{width: 100%; max-height: 100px; padding-left: 20px; display: none;}
    #attach{width: 25px;}
    .attach_delete_btn{border: none;}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
	
		<jsp:include page="../board/boardSidebar.jsp" />
       
        <div class="board">
        	<form method="post" action="updateA.bo" enctype="multipart/form-data">
          <h3>게시글 수정/삭제</h3>
          <br><br>
          	  <input type="hidden" name="boardNo" value="${b.boardNo}">
              <label>게시판그룹</label>
                  <select name="boardCno">
                  	 <%--  <option value="${b.boardCno}" name="boardCno" id="">${b.boardCno}</option>
                      <option>-----</option>
                      <option value="1" name="boardCno" id="1">전체 공지사항</option>
                      <option value="2" name="boardCno" id="2">식단표</option> --%>
                      <option value="3" name="boardCno" id="3">자유게시판</option>
                     <!--  <option value="4" name="boardCno" id="4">커뮤니티</option>
                      <option value="5" name="boardCno" id="5">부서 공지사항</option>
                      <option value="6" name="boardCno" id="6">부서 자유게시판</option> -->
                  </select><br>
                  <script>
					$(function(){
						$('select[name=boardCno] value=[${b.boardCno}]').attr("selected", true);
					})
				  </script>
                  
              <label for="title">게시글 제목</label>
                  <input type="text" id="boardTitle" name="boardTitle" value="${b.boardTitle}" required /><br>
              	  <input type="hidden" name="boardWriter" value="${b.boardWriter}">

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
                                  <c:when test="${ empty atList }">
                                          <div>첨부파일이 없습니다.</div>
                                  </c:when>
                                  <c:otherwise>
                                      <c:forEach var="a" items="${ atList }">
                                           <a href="${ a.changeName }" download="">${ a.originName }</a><br>
                                       </c:forEach>
                                   </c:otherwise>
                             </c:choose>
	                 </td>
                  </table>
              <br>    
              
              <label for="content">내용</label>
                  <textarea name="boardContent" id="boardContent" cols="30" rows="10" value="${b.boardContent}" required></textarea><br>
              <label for="boardPin">공지등록</label>
                  <input type="checkbox" value="N" name="boardPin" /><br>
               
                    <br><br>
              <div align="center">
                <button type="button" class="btn btn-dark" onclick="javascript:history.go(-1);">이전으로</button>
                <button type="submit" class="btn btn-success">수정하기</button>
                <button type="button" class="btn btn-danger" onclick="location.href='deleteA.bo';">삭제하기</button>
              </div>
              </form>
        </div>
	</div>
	
	
	
</body>
</html>