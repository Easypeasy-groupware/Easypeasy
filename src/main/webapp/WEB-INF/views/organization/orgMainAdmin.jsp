<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 조직도 트리 -->
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<link rel="stylesheet" type="text/css" href="resources/org/jquery.treeview.css"/>
<link rel="stylesheet" type="text/css" href="resources/org/demo/screen.css"/>
	
<style>
  /* 전체 wrapper */
  .wrapper {width: 1200px;margin: 0 auto;}
  body {font-family: Arial, sans-serif;	margin: 0; padding: 0;}

  /* content */
  .board {width: 1000px; float: right;}
  .container {margin: 20px auto; width: 100%; border: 1px solid #ccc; padding: 20px;}
  form {max-width: 1000px; margin: 0 auto; padding: 10px; border-radius: 5px; box-sizing: border-box;}
  h2 {padding:1% 1%;}
	table {border-collapse: collapse; width: 100%;}
	tr {text-align: center;}
	th, td {text-align: center; padding: 8px; border-bottom: 1px solid #ccc;}
	th {background-color: #ddd;}
	tr:hover {background-color: #f5f5f5;}
  .search-container {display: flex; justify-content: flex-end;margin-bottom: 10px;}
  /* Modal styles */
    .modal {
      display: none; /* Hide modal by default */
      position: fixed; /* Position modal */
      z-index: 1; /* Make modal appear on top of other elements */
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.4); /* Add black background with opacity */
    }
    .modal-content {
      background-color: white;
      margin: 15% auto; /* 15% from the top and centered */
      padding: 20px;
      border: 1px solid #888;
      width: 500px; /* Could be more or less, depending on screen size */
    }
    .close {color: #aaa; float: right; font-size: 28px; font-weight: bold;}
    .close:hover, .close:focus {color: black; text-decoration: none; cursor: pointer;}
    
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
        
         <jsp:include page="../organization/orgSidebar.jsp" />
    

        <div class="board">
            <cheader>
                <br><br>
                <h2>조직도-관리자페이지</h2>
                <br>
            </cheader>
            <div class="container">
                <form>
                    <div class="search-container">
                            <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#tree-modal" >사원 검색</button>
                    </div>
                </form>
                <button type="button" class="btn btn-outline-success btn-sm" onclick="minsert();">등록</button>
                <button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='settings.org';">설정</button>
                
                <script>
	                function minsert() {
	                	location.href="memberEnroll.org";
	                }
                </script>
                
                <br><br>
                <table id="memberList">
                    <thead>
                        <tr>
                            <th>사원번호</th>
                            <th>이름</th>
                            <th>부서</th>
                            <th>직위</th>
                            <th>이메일</th>
                            <th>휴대폰</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="o" items="${list}">
	                        <tr>
	                            <td class="ono">${o.empNo}</td>
	                            <td>${o.empName}</td>
	                            <td>${o.deptName}</td>
	                            <td>${o.jobName}</td>
	                            <td>${o.email}</td>
	                            <td>${o.phone}</td>
	                            <td>${o.entYn}</td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <br><br>
                <tfoot>
                     <div align="center">
			            <ul id="paging">
			            	<c:choose>
			            		<c:when test="${ pi.currentPage eq 1 }">
			            			<li class="page-item disabled"><a class="page-link" href="#"> < </a></li>
			            		</c:when>
			            		<c:otherwise>
			            			<li class="page-item"><a class="page-link" href="adminList.org?cpage=${ pi.currentPage-1 }"> < </a></li>
			            		</c:otherwise>
			            	</c:choose>
			            	
			            	 <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    	<li class="on"><a class="page-link" href="adminList.org?cpage=${p}">${p}</a></li>
		     				</c:forEach>
                    
			                <c:choose>
			                    <c:when test="${pi.currentPage eq pi.maxPage }">
			                    	<li class="page-item disabled"><a class="page-link" href="#"> > </a></li>
			                    </c:when>
			                    <c:otherwise>
			                    	<li class="page-item"><a class="page-link" href="adminList.org?cpage=${ pi.currentPage + 1 }"> > </a></li>
		                    	</c:otherwise>
		                    </c:choose>
			            </ul>
			        </div>
			        <script>
			            $(function(){
			                 $("#memberList>tbody>tr").click(function(){
			            			location.href='detailForm.org?no=' + $(this).children(".ono").text();
			            		})
			            })
			        </script>
                </tfoot>
                
                 <!-- 검색/조직도 트리 -->
					<!-- 모달 -->
					<div class="modal fade" id="tree-modal" tabindex="-1" role="dialog" aria-labelledby="tree-modal-label" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="tree-modal-label"><input type="text" placeholder="사원 검색"></h5> &nbsp;&nbsp;<button type="button" class="btn btn-success">검색</button>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- 조직도 트리 -->
									
									<div id="main">
				
										<h5>Easy peasy조직도</h5>
										<form action="adminList.org">
											<input type="hidden" name="userNo" value="">
											<ul id="browser" class="filetree treeview-famfamfam">
												<li><span class="folder">이지피지</span>
													<ul>
														<li><span class="file">대표</span></li>
														<li><span class="file">상무</span></li>
														
														<c:forEach var="o" items="${list}">
															<li class="closed"><span class="folder">${o.deptCode}</span>
																<ul>
																	<li><span class="file">사원1</span></li>
																	<li><span class="file">사원2</span></li>
																	<li><span class="file">사원3</span></li>
																	<li><span class="file">사원4</span></li>
																</ul>
															</li>
														</c:forEach>
														
														<li class="closed"><span class="folder">경영지원부</span>
															<ul>
																<li><span class="file">사원1</span></li>
																<li><span class="file">사원2</span></li>
																<li><span class="file">사원3</span></li>
																<li><span class="file">사원4</span></li>
															</ul>
														</li>
														<li class="closed"><span class="folder">영업부</span>
															<ul>
																<li><span class="folder">영업1팀</span>
																	<ul id="folder21">
																		<li><span class="file">사원1</span></li>
																		<li><span class="file">사원2</span></li>
																		<li><span class="file">사원3</span></li>
																	</ul>
																</li>
																<li><span class="folder">영업2팀</span>
																	<ul>
																		<li><span class="file">사원1</span></li>
																		<li><span class="file">사원2</span></li>
																		<li><span class="file">사원3</span></li>
																	</ul>
																</li>
																<li><span class="folder">영업3팀</span>
																	<ul>
																		<li><span class="file">사원1</span></li>
																		<li><span class="file">사원2</span></li>
																		<li><span class="file">사원3</span></li>
																	</ul>
																</li>
															</ul>
														</li>
														<li class="closed"><span class="folder">마케팅부</span>
															<ul>
																<li><span class="file">사원1</span></li>
																<li><span class="file">사원2</span></li>
																<li><span class="file">사원3</span></li>
															</ul>
														</li>
														
													</ul>
												</li>
											</ul>
										</form>
									</div>
				                    <div class="modal-footer">
				                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				                    </div>
				                </div>
				            </div>
				        </div>
					</div>
					  <script src="resources/org/demo/jquery.cookie.js" type="text/javascript"></script>
					  <script src="resources/org/jquery.treeview.js" type="text/javascript"></script>
					  <script type="text/javascript">
							$(document).ready(function(){
								$("#browser").treeview({
									toggle: function() {
										console.log("%s was toggled.", $(this).find(">span").text());
									}
								});
						
								$("#add").click(function() {
									var branches = $("<li><span class='folder'>New Sublist</span><ul>" +
										"<li><span class='file'>Item1</span></li>" +
										"<li><span class='file'>Item2</span></li></ul></li>").appendTo("#browser");
									$("#browser").treeview({
										add: branches
									});
								});
							});
					  </script>
                
            </div>
        </div>
    </div>
</body>
</html>