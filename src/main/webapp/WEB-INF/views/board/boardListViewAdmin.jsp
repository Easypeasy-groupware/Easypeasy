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
    .container {margin: 20px auto; width: 900px; border: 1px solid #ccc; padding: 20px;}
	h1 {padding:5% 10%;}
	table {border-collapse: collapse; width: 100%;}
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
            <h1>공지사항 게시판</h1>
            <br><br>
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
                            <button onclick="search()">검색</button>
                    </div>
                </form>
            <br>
                <button type="button" class="btn btn-outline-success btn-sm"> 새글쓰기</button>
                <button type="button" class="btn btn-outline-danger btn-sm"> 삭제</button>
        
                <br><br>
            <table>
              <thead>
                <tr>
                  <th style="width: 10px;"><input type="checkbox" name="ckbAll" id="ckbAll"></th>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>조회수</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><input type="checkbox" name="ckb"></td>
                  <td>1</td>
                  <td>공지사항 제목입니다.</td>
                  <td>관리자</td>
                  <td>2022-02-26</td>
                  <td class="views">10</td>
                </tr>
                <tr>
                  <td><input type="checkbox" name="ckb"></td>
                  <td>2</td>
                  <td>공지사항 제목입니다.</td>
                  <td>관리자</td>
                  <td>2022-02-25</td>
                  <td class="views">7</td>
                </tr>
                <tr>
                  <td><input type="checkbox" name="ckb"></td>
                  <td>3</td>
                  <td>공지사항 제목입니다.</td>
                  <td>관리자</td>
                  <td>2022-02-24</td>
                  <td class="views">5</td>
                </tr>
                <tr>
                  <td><input type="checkbox" name="ckb"></td>
                  <td>4</td>
                  <td>공지사항 제목입니다.</td>
                  <td>관리자</td>
                  <td>2022-02-23</td>
                  <td class="views">2</td>
                </tr>
                <tr>
                  <td><input type="checkbox" name="ckb"></td>
                  <td>5</td>
                  <td>공지사항 제목입니다.</td>
                  <td>관리자</td>
                  <td>2022-02-22</td>
                  <td class="views">1</td>
                </tr>
                 <tr>
                  <td><input type="checkbox" name="ckb"></td>
                  <td>5</td>
                  <td>공지사항 제목입니다.</td>
                  <td>관리자</td>
                  <td>2022-02-22</td>
                  <td class="views">1</td>
                </tr>
              </tbody>
              <script>
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