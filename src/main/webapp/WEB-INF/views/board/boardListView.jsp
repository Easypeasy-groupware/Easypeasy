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
	tr:hover {background-color: #f5f5f5;}
	.views {text-align: center;}
    .search-container {display: flex; justify-content: flex-end; margin-bottom: 10px;}
	.search-container input[type=text] {padding: 6px; margin-right: 10px; border: none; border-radius: 3px; width: 200px;}

	/* 페이징바 */
    #paging{text-align: center; display: inline-block; padding-left :0;}
    #paging li {text-align: center; float: left; list-style:none; border-radius:10px; margin:2px; background-color: rgb(234, 234, 234);}
    #paging li a {display: block; font-size: 12px; color: black; padding: 5px 10px; box-sizing: border-box; text-decoration-line:none;}
    #paging li.on {background:rgb(166, 184, 145);}
    #paging li.on a { color: white;}
    
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
	
		<jsp:include page="../board/boardSidebar.jsp" />
       
        <div class="board">
          <!-- 게시판 내용 -->
          <bheader>
            <h2>전체 공지사항</h2>
            <br>
         </bheader>
        <div class="container">
            <form>
                <div class="search-container">
                    <select>
                        <option value="">전체</option>
                        <option value="1">1일</option>
                        <option value="7">1주일</option>
                        <option value="30">1개월</option>
                    </select>
                    <select>
                        <option value="">선택하세요</option>
                        <option value="title">제목</option>
                        <option value="author">작성자</option>
                        <option value="content">내용</option>
                    </select>
                        <input type="text" placeholder="검색">
                        <button type="button" class="btn btn-success btn-sm" onclick="search()">검색</button>
                </div>
            </form>
            <button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='enroll.bo';"> 새글쓰기</button>
            <br><br>
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="b" items="${list}">
	                    <tr>
	                        <td>${b.boardNo}</td>
	                        <td>${b.boardTitle}</td>
	                        <td>${b.boardWriter}</td>
	                        <td>${b.createDate}</td>
	                        <td class="views">${b.boardCount}</td>
	                    </tr>
                    </c:forEach>
                    <tr>
                        <td>2</td>
                        <td>공지사항 제목입니다.</td>
                        <td>사용자</td>
                        <td>2022-02-25</td>
                        <td class="views">7</td>
                    </tr>
                   
                </tbody>
            </table>
            <br><br>
            <tfoot>
                <div align="center">
		            <ul id="paging">
		                <li><a href=""> < </a></li>
		                <li class='on'><a href=""> 1 </a></li>
		                <li><a href=""> 2 </a></li>
		                <li><a href=""> 3 </a></li>
		                <li><a href=""> 4 </a></li>
		                <li><a href=""> 5 </a></li>
		                <li><a href=""> > </a></li>
		            </ul>
		        </div>
		        <script>
		            $(function(){
		                 $("#ps-tbody").on("click", "tr", function(){
		                     location.href = 'xxxxx.ad?no=' + $(this).children().eq(0).text(); 
		                 })
		            })
		        </script>
            </tfoot>
        </div>
        </div>
      </div>
</body>
</html>