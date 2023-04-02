<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
    
          /*div{border:1px solid red;} */ 
		#main{position: absolute; top: 120px;}
		#main a:hover {
		  text-decoration: none;
		  font-weight:600; color:black;
		}
        .outer1{
            width:1000px; 
            padding:50px;
            margin:auto;
            float:left;
            box-sizing: border-box;
        }
        .app-wait{width:100%; height:50%;padding:0px;}
        .app-prgs{height:50%;width:100%;padding:0px;}
        .wapp{
            float:left;
            width:160px;
            height:200px;  
            border:1px solid gray; 
            border-radius: 30px; 
            padding:15px;
            margin-right: 10px; 
            font-size:13px;
           
        }
        .app-wait *{overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
        .app-wait button{width:120px;}
        .app-wait>p>b>a, .app-prgs>p>b>a{color:black;}
      	#recBtn:hover{background:rgb(234, 234, 234); border:none; color:gray;}
		tbody>tr:hover{background:rgb(233, 233, 233); cursor:pointer;}
    </style>   
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div id="main">
		<jsp:include page="appMenubar.jsp" />
			<div class="outer1" >
				<div class="outer1-1">
					<p style="font-size:30px; "><a style="color: rgb(142, 161, 122);" href="main.ap"><b> 전자결재 홈</b></a></p>
					<br><br>	
					<div class="app-wait">
				
						<p style="font-size:25px;"><b><a href="" style="color: gray;"> 결재 대기 문서</a></b></p>
						<div>
							<c:choose>
								<c:when test="${empty list1}">
									<br><br>
									<div align="center">
										결재 대기중인 문서가 없습니다.
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach var="w" items="${list1}">
										<div class="wapp">
											<input type="hidden" name="aNum" id="aNum" value="${w.appNo }">
											${w.tstatus} <br>
										<span id="formN"> ${w.formName }</span><br>
											<c:choose>
												<c:when test="${w.formCode == 3 || w.formCode == 4}">
													${w.formName }
												</c:when>
												<c:otherwise>
													${w.title }
												</c:otherwise>
											</c:choose>
											<br><br>
											${w.empName}<br>
											${w.enrollDate } <br><br>
											<span style="padding-left:0px;"><button type="button" id="recBtn" class="btn btn-outline-secondary" onclick="receiveDetail(${w.appNo },'${w.formName }');">결재하기</button></span>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<br><br>

					<div class="app-prgs">
						
						<p style="font-size:25px; "><b><a href="" style="color: gray;">기안 진행 문서</a></b></p>
						<table style="width:100%; text-align:center" class="table">
							<thead>
								<tr>
									<th>no.</th>
									<th>기안일</th>
									<th>결재양식</th>
									<th>제목</th>
									<th>기안자</th>
									<th>결재상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list2}">
										<tr>
											<td colspan='6' >
												<div align="center">
													기안 진행중인 문서가 없습니다.
												</div>
											</td>
										</tr>
									</c:when>   
									<c:otherwise>                     
										<c:forEach var="s" items="${list2}">
												<tr>
													<td>${s.appNo}</td>
													<td>${s.enrollDate}</td>
													<td>${s.formName}</td>
													<c:choose>
														<c:when test="${s.formCode == 3 || s.formCode == 4}">
															<td id = "clk">${s.formName}</td>
														</c:when>
														<c:otherwise>
															<td id= "clk">${s.title}</td>
														</c:otherwise>
													</c:choose>
													<td>${s.empName}</td>
													<td>${s.tstatus}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				<br><br><br><br><br><br><br><br><br><br>
			</div>
	</div>
        <script>
        
        	function receiveDetail(no, form){
        		
        		location.href='detailRec.ap?no='+ no +"&form="+ form +"&st=결재대기"; 
        		
        	}

	     	// 상세페이지로 이동하는 function
	     	if(${not empty list2}){
		        $("table tbody").on("click", "tr", function(){
		            location.href = 'detailSPrg.ap?no=' + $(this).children().eq(0).text()+"&form="+ $(this).children().eq(2).text()+"&st=기안진행"; 
		        }); 
	        }
        </script>
 
</body>
</html>