<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#main{position: absolute; top: 120px;}

        .outer1{
            padding:50px;
            width:1000px;
            margin:auto;
            float:left;
            box-sizing: border-box;
        }
        .list1-1 a{text-decoration:none; color:rgb(142, 161, 122); font-size:17px;}		
        .list1-1 a:hover{text-decoration:none;color:rgb(142, 161, 122);}	
	</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

	<div id="main">

		<jsp:include page="appMenubar.jsp" />
		<div class="outer1">
			<p style="font-size:25px;"><b>기안문서함</b></p>
			<br>

			<div class="list-1">
				
					<select name="condition" id="condition">
						<option value="title">문서제목</option>
						<option value="dept">기안부서</option>
						<option value="form">결재양식</option>
					</select>
					<input type="hidden" name="listType" id="listType" value="s">
					<input type="search" name="keyword" id="keyword"> 
					<button onclick="searchResult();">검색</button>
				
			</div>

			<div class="list1-1">
				<a href="statusList.ap?tstatus=전체&listType=s">전체</a> | <a href="statusList.ap?tstatus=진행중&listType=s">진행</a> | <a href="statusList.ap?tstatus=결재&listType=s">완료</a> | <a href="statusList.ap?tstatus=반려&listType=s">반려</a>
			</div>

			<br><br>

			<div class="list-2">
				<table style="text-align:center" class="table" id="result-tb">
					<thead>
						<tr>
							<th>
								<input type="checkbox" name="" id="chk-total">
							</th>
							<th>기안일</th>
							<th>결재양식</th>
							<th>제목</th>
							<th>첨부파일</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan='6'>
										기안된 문서가 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="a" items="${list}">
									<tr>
										<td>
											<input type="checkbox" name="chk" id="">
											<input type="hidden" id="num" value="${a.appNo }">
										</td>
										<td>${a.enrollDate}</td>
										<td>${a.formName }</td>
										<c:choose>
											<c:when test="${a.formCode == 3 || a.formCode == 4 }">
												<td>${a.formName }</td>
											</c:when>
											<c:otherwise>
												<td>${a.title }</td>
											</c:otherwise>
										</c:choose>
										<td>
											<c:if test="${a.attachCount > 0}">
												<span><img src="resources/common_images/attachment.png" width="10px;"></span>
											</c:if>
										</td>
										<td>${a.tstatus }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<br><br>
				<div id="pagingArea-1" align="center">
					<ul id="paging">
						<c:choose>
							<c:when test="${tpi == null }">
								<c:choose>
									<c:when test="${pi.currentPage eq 1 }">
										<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
									</c:when>
									<c:otherwise>
										<li class=""><a class="page-link" href="sendList.ap?cpage=${pi.currentPage -1 }">&lt;</a>  </li> 
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
									<li class=""><a class="page-link" href="sendList.ap?cpage=${p }">${p }</a></li>
								</c:forEach>
								
								<c:choose>
									<c:when test="${pi.currentPage eq pi.maxPage }">
										<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="sendList.ap?cpage=${pi.currentPage + 1 }">&gt;</a></li>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${tpi.currentPage eq 1 }">
										<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
									</c:when>
									<c:otherwise>
										<li class=""><a class="page-link" href="statusList.ap?cpage=${tpi.currentPage -1 }&tstatus=${ta.tstatus }&listType=${ta.listType}">&lt;</a>  </li> 
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="p" begin="${tpi.startPage }" end="${tpi.endPage }">
									<li class=""><a class="page-link" href="statusList.ap?cpage=${p}&tstatus=${ta.tstatus }&listType=${ta.listType}">${p }</a></li>
								</c:forEach>
								
								<c:choose>
									<c:when test="${tpi.currentPage eq tpi.maxPage }">
										<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="statusList.ap?cpage=${tpi.currentPage +1 }&tstatus=${ta.tstatus }&listType=${ta.listType}">&gt;</a></li>
									</c:otherwise>
								</c:choose>								
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<script>
				$(function(){
					
					// 체크박스 전체선택 or 해제하는 function
					$("#chk-total").on("click", function(){
						if($("#chk-total").is(":checked")){
							$("#result-tb tbody input[name='chk']").prop("checked", true);
						}else{
							$("#result-tb tbody input[name='chk']").prop("checked", false);
						}
					});
					
					$("#result-tb tbody input[name='chk']").on("click", function(){
						var total = $("#result-tb tbody input[name='chk']").length;
						var checked = $("#result-tb tbody input[name='chk:checked']").length;
						
						if(total != checked){
							$("#result-tb thead input[name='chk']").prop("checked", false);
						}else{
							$("#result-tb thead input[name='chk']").prop("checked", true);
						}
					});
					
					// 상세페이지로 이동하는 function
					if(${not empty list}){
						$("table tbody").on("click", "tr", function(){
							location.href = 'detailSPrg.ap?no=' + $(this).children().eq(0).find("#num").val()+"&form="+ $(this).children().eq(2).text()+"&st=기안전체"; 
						}); 
					}
				});
				
				
				function searchResult(page){
					
					$.ajax({
						url:"search.ap",
						data: {condition : $("#condition").val(),
							  listType : $("#listType").val(),
							  keyword : $("#keyword").val(),
							  cpage:page
						}
						,success:function(result){
							
							if(result){
									
								//swal("총 " + result.sListCount + "건의 결과가 조회되었습니다.");
									
								$("#condition").val(result.a.condition);
								$("#listType").val(result.a.listType);
								$("#keyword").val(result.a.keyword);
								
								let val1 = "";
								
								if(result.sList.length == 0){
									val1 += "<td colspan='6'> 검색결과에 일치되는 문서가 없습니다. </td>"
								}else{
									
									for(var i = 0; i < result.sList.length; i++){
										
										val1 += "<tr>"
											  + "<td>"
											  + "<input type='checkbox' name='chk'>"
											  + "<input type='hidden' id='num' value="+ result.sList[i].appNo + " >"
											  + "</td>"
											  + "<td>" + result.sList[i].enrollDate + "</td>"
											  + "<td>" + result.sList[i].formName + "</td>";
											  if(result.sList[i].formCode == 3 || result.sList[i].formCode == 4){
												 val1 += "<td>" + result.sList[i].formName + "</td>";
											  }else{
												  val1 += "<td>" + result.sList[i].title + "</td>";
											  }
											  if(result.sList[i].attachCount > 0){
												  val1 += "<td><span><img src='resources/common_images/attachment.png' width='10px;'></span></td>";
											  }else{
												  val1 += "<td></td>";
											  }
											  val1 += "<td>" + result.sList[i].tstatus +"</td></tr>";
										
									}
									
								}
								
								$("#result-tb tbody").html(val1);
								
								if(result.spi != null){
										
									let val2 = "";
									
									if(result.spi.currentPage == 1){
										val2 += "<li class='page-item disabled'><button class='btn-sm'>&lt;</button></li>";
										
									}else{
																			
										val2 += "<li class='page-link'><button onclick='searchResult(" + (result.spi.currentPage-1) + ");' class='btn-sm' >&lt;</button></li>";
									}
									
									for(var i = result.spi.startPage;  i < result.spi.endPage ; i++){
										
										val2 +=" <li class=''><button onclick='searchResult(" + i + ");' class='btn-sm' >"+ i +" </button></li>";									
									}
									
									if(result.spi.currentPage == result.spi.maxPage){
										val2 += "<li class='page-item disabled'><button class='btn-sm'>&gt;</button></li>";
									}else{
										
										val2+= "<button onclick='searchResult("+ (result.spi.currentPage+1) + ");' class='btn-sm' > &gt;</button>";															
									}
									
									$("#pagingArea-1 ul").html(val2);
									
								}
							}
							
						}, error :function(request, status, error){
							console.log("검색용 ajax 통신실패");
                            console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);

						}	  
					});
					
				}

				
				</script>
			
				<br clear="both"><br>



			</div>
		</div>
    </div>
</body>
</html>