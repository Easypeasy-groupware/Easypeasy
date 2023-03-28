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
    .wrapper { width: 1200px; margin: 0 auto; position: absolute; top: 120px} /* 중앙 정렬을 위한 margin: 0 auto; */
    body {font-family: Arial, sans-serif; margin: 0; padding: 0;}

    /* 게시판 스타일 */
    .board {width: 1000px;float: right;}
    .container {margin: 20px auto; width: 900px; padding: 20px;}
	h4 {padding-left: 25px; padding-top: 15px; float: left		!important;}
	table {border-collapse: collapse; width: 100%;}
	tr {text-align: center;}
	th, td {text-align: center; padding: 8px; border-bottom: 1px solid #ccc;}
	th {background-color: #ddd;}
	tr:hover {background-color: #f5f5f5;}
	.views {text-align: center;}
    .search-container {display: flex; justify-content: flex-end; margin-bottom: 10px;}
	.search-container input[type=text] {padding: 6px; margin-right: 10px; border: none; border-radius: 3px; width: 200px;}
	.notice{font-color:red;}

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
            <h4><b style="color:rgb(93, 109, 75);">자유게시판</b></h4>
            <br><br><br><br>
         </bheader>
        <div class="container">
            <!-- <form>
                <div class="search-container">
                
                    <select>
                        <option value="all">전체</option>
                        <option value="1">1일</option>
                        <option value="7">1주일</option>
                        <option value="30">1개월</option>
                    </select>
                    
                    <select>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                        <input type="text" placeholder="검색">
                        <button type="button" class="btn btn-success btn-sm" onclick="search()">검색</button>
                </div>
            </form> -->
            <button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='enrollAForm.bo';">새글쓰기</button>
            <%-- <c:if test="${ loginUser.deptCode eq 'D1' }"> 
            	<button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='delete.bo';"> 삭제</button>
           </c:if> --%>
            <br><br>
            <table id="boardList">
                <thead>
                    <tr>
                    	<%-- <c:if test="${ loginUser.deptCode eq 'D1' }">
                    		<th style="width: 10px;"><input type="checkbox" name="ckbAll" id="ckbAll"></th>
                    	 </c:if> --%>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="b" items="${list}">
	                    <tr>
	                    	<%-- <c:if test="${ loginUser.deptCode eq 'D1' }"> 
	                    		<td><input type="checkbox" name="ckb"></td>
	                    	 </c:if> --%>
	                        <td class="bno">${b.boardNo}</td>
	                        <td class="notice">${b.boardTitle}</td>
	                        <td>익명</td>
	                        <td>${b.createDate}</td>
	                        <td>${b.boardCount}</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            	<script>
            		// 테이블 클릭
			        $(function(){
		                 $("#boardList>tbody>tr").click(function(){
		            			location.href='detailAForm.bo?no=' + $(this).children(".bno").text();
		            	})
		            })
		            
		          
	                // 체크박스 
	                $(document).ready(function() {
	                    $("#ckbAll").click(function() {
	                      if($("#ckbAll").is(":checked")) $("input[name=ckb]").prop("checked", true);
	                      else $("input[name=ckb]").prop("checked", false);
	                    });
	
	                    $("input[name=ckb]").click(function() {
	                      var total = $("input[name=ckb]").length;
	                      var checked = $("input[name=ckb]:checked").length;
	
	                      if(total != checked) $("#ckbAll").prop("checked", false);
	                      else $("#ckbAll").prop("checked", true); 
	                    });
	                  });
           
		        </script>
            
            <br><br>
            <tfoot>
                <div align="center">
		            <ul id="paging">
		               <c:choose>
		                	<c:when test="${ pi.currentPage eq 1 }">
			                    <li class="page-item disabled"><a class="page-link" href="#"> < </a></li>
			                </c:when>
			                <c:otherwise>
			                    <li class="page-item"><a class="page-link" href="free.bo?cpage=${ pi.currentPage-1 }"> < </a></li>
		                    </c:otherwise>
	                    </c:choose>
	                    
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<li class="page-item"><a class="page-link" href="free.bo?cpage=${p}">${p}</a></li>
	     				</c:forEach>
	                    
	                    <c:choose>
		                    <c:when test="${pi.currentPage eq pi.maxPage }">
		                    	<li class="page-item disabled"><a class="page-link" href="#"> > </a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item"><a class="page-link" href="free.bo?cpage=${ pi.currentPage + 1 }"> > </a></li>
	                    	</c:otherwise>
	                    </c:choose>
		            </ul>
		        </div>
		        
            </tfoot>
        </div>
        </div>
      </div>
</body>
</html>