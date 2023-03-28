<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--flatPicker-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<style>
    /*---------------------------메인-------------------------------------*/
    .outer{width:1200px; padding-top:10px;}
	#main_content{position: absolute; top: 170px;}
    #left-col{width:800px; padding:0 10px 0 10px; margin-left:20px; float:left;}
    #right-col{width:400px; padding:0 10px 0 10px; float:left;}

    /*카테고리별 공통 css*/
    .subtitle{float:left; border-bottom:2px solid lightgray; text-align:center; width:24%; height:28px; padding-bottom:4px;}
    table{width:97%; border-collapse: collapse;}
    tbody tr:hover:not(.work-time tr, .commute-time tr){cursor:pointer; font-weight:600; background:rgb(241, 241, 241);}
    b{font-size:large; font-weight:700; color:rgb(65, 64, 64);}

    /*게시판*/
    .board{height:280px;}
    .board-title:hover{cursor:pointer; font-weight:600;}
    #doc-etc{width:48%;}
    #board-notice{border-bottom:4px solid rgb(166, 184, 145); font-weight:600;  overflow: hidden; text-overflow: ellipsis;}

    /*결재문서*/
    .document{height:280px;}
    #doc-arrived{border-bottom:4px solid rgb(166, 184, 145); font-weight:600;}
    #doc-arrived:hover, #doc-departed:hover{cursor:pointer; font-weight:600;}
    #doc-etc{width:48%;}
    thead tr{border-bottom:1px solid gray;}

    /*메일함*/
    .mail{height:280px;}
    #mail-received{border-bottom:4px solid rgb(166, 184, 145); font-weight:600;}
    #mail-received:hover{cursor:pointer; font-weight:600;}
    #mail-etc{width:72%;}

    /*근태*/
    .attendance{height:320px;}
    #date-today{color:gray; display: inline-block;}
    #current-time{display: inline-block; margin-left:10px; color:gray;}
    .work-time{width:80%;}
    .work-th{font-size:17px; font-weight:700; color:rgb(65, 64, 64); width:30%; height:30px; padding:0;}
    .work-td2{width:70%; height:30px; padding:0;}
    .commute-time{width:80%; font-size:20px;}
    .commute-time td{height:30px;}

    .commute-th{font-size:17px; font-weight:700; color:rgb(65, 64, 64);}

    .commute-btn{width:100px; height:35px; border:0; border-radius:5px; color:white; font-size:16px;}
    #in-btn{background:rgb(166, 184, 145); margin-left:30px;}
    #in-btn:hover{font-weight:600; background: rgb(116, 129, 101); cursor:pointer;}
    #out-btn{background: gray; margin-left:5px;}
    #out-btn:hover{cursor:pointer; font-weight:600; background: rgb(85, 85, 85);}


	#scheduleList a{
		text-decoration: none;
		color: black;
	}
	#scheduleList a:hover{
		font-weight:600;
	}
</style>
</head>
<body>
	
	<jsp:include page="header.jsp"/>

	<div id="main_content">
		<div id="left-col">
			<div class="board">
				<b>게시판 최근글</b>
		
				<br><br>
				<div class="subtitle board-title" id="board-notice">전체공지사항</div>
				<div class="subtitle board-title" id="board-all">자유게시판</div>
				<div class="subtitle" id="doc-etc"></div>
				<br clear="both"><br>
		
				<table class="board-table" id="notice-tb">
					<colgroup>
						<col style="width:70%;">
						<col style="width:15%;">
						<col style="width:15%;">
					</colgroup>
					<thead align="center">
						<tr>
							<th>제목</th>
							<th>작성자</th>
							<th>게시일</th>
						</tr>
					</thead>
					<tbody align="center">
						
					</tbody>
				</table>
	 
				<table class="board-table" id="free-tb" style="display:none">
					<colgroup>
						<col style="width:70%;">
						<col style="width:15%;">
						<col style="width:15%;">
					</colgroup>
					<thead align="center">
						<tr>
							<th>제목</th>
							<th>작성자</th>
							<th>게시일</th>
						</tr>
					</thead>
					<tbody align="center" style=" overflow: hidden; text-overflow: ellipsis;">
						
					</tbody>
				</table>
				 
			</div>
			<script>
				$(function(){
					$("#board-notice").click(function(){
						$(this).css("border-bottom", "4px solid rgb(166, 184, 145)").css("font-weight", 600);
						$("#board-all").css("border-bottom", "2px solid lightgray").css("font-weight", 400);
						$("#notice-tb").show();
						$("#free-tb").hide();
					})
					$("#board-all").click(function(){
						$(this).css("border-bottom", "4px solid rgb(166, 184, 145)").css("font-weight", 600);
						$("#board-notice").css("border-bottom", "2px solid lightgray").css("font-weight", 400);
						$("#free-tb").show();
						$("#notice-tb").hide();
					})
				})
				
				$(function(){
					topBoardList();
					topFreeList();
            		/* $(document).on("click", "#notice-tb>tbody>tr", function(){
            			location.href = 'detailForm.bo?no=' + $(this).children().eq(0).text(); // 자손들 중 첫번째 값
            		}) */
				})
				
            	function topBoardList(){
            		$.ajax({
            			url:"topList.bo",
            			success:function(list){
            				console.log(list);
            				
            				let value = "";
            				if(list.length == 0){
								value1+= "<tr>" 
										+ "<td colspan='3'>"
										+ "전체 공지사항이 없습니다."
										+ "</td>"
										+"</tr>";
							}else{
								
	            				for(let i=0; i<list.length; i++){
	            					let b = list[i]; 
	            					value += "<tr>"
	            							+	"<td>" + list[i].boardTitle + "</td>"
	            							+	"<td>" + list[i].empName + "</td>"
	            							+	"<td>" + list[i].createDate + "</td>"
	            							+ "</tr>"; 
	            				}
	            				
							}
            				
            				$("#notice-tb tbody").html(value);
            				
            			},error:function(){
            				console.log("top5 공지게시글 조회용 ajax 통신 실패");
            			}
            		})
            	}
				
			
				function topFreeList(){
	            		$.ajax({
	            			url:"topFree.bo",
	            			success:function(flist){
	            				console.log(flist);
	            				
	            				let value = "";
	            				if(flist.length == 0){
									value1+= "<tr>" 
											+ "<td colspan='3'>"
											+ "자유게시판에 게시글이 없습니다."
											+ "</td>"
											+"</tr>";
								}else{
									
		            				for(let j=0; j<flist.length; j++){
		            					let b = flist[j]; 
		            					value += "<tr>"
		            							+	"<td>" + b.boardTitle + "</td>"
		            							+	"<td>" + "익명" + "</td>"
		            							+	"<td>" + b.createDate + "</td>"
		            							+   "</tr>"; 
		            				}
		            				
								}
	            				
	            				$("#free-tb tbody").html(value);
	            				
	            			},error:function(){
	            				console.log("top5 자유게시글 조회용 ajax 통신 실패");
	            			}
	            		})
	            	}
				  
			</script>	
			
			<div class="document">
			<a href="main.ap"><b>결재문서</b></a>
				
				
				<br><br>
				<div class="subtitle doc-approval" id="doc-arrived">결재 대기 문서</div>
				<div class="subtitle doc-approval" id="doc-departed">기안 진행 문서</div>
				<div class="subtitle" id="doc-etc"></div>
				<br clear="both"><br>
		
				<table class="doc-table" id="arrived-tb">
					<colgroup>
						<col style="width:15%;">
						<col style="width:15%;">
						<col style="width:55%;">
						<col style="width:15%;">
					</colgroup>
					<thead>
						<tr>
							<th>기안일</th>
							<th>결재양식</th>
							<th>제목</th>
							<th>기안자</th>
						</tr>
					</thead>
					<tbody align="center">
					
					</tbody>
				</table>
				<table class="doc-table" id="departed-tb" style="display:none;">
					<colgroup>
						<col style="width:15%;">
						<col style="width:15%;">
						<col style="width:55%;">
						<col style="width:15%;">
					</colgroup>
					<thead>
						<th>기안일</th>
						<th>결재양식</th>
						<th>제목</th>
						<th>결재대기</th>
					</thead>
					<tbody align="center">
					
					</tbody>
				</table>
		 
			</div>
			<script>
				$("#doc-arrived").click(function(){
					$(this).css("border-bottom", "4px solid rgb(166, 184, 145)").css("font-weight", 600);
					$("#doc-departed").css("border-bottom", "2px solid lightgray").css("font-weight", 400);
					$("#arrived-tb").show();
					$("#departed-tb").hide();
				})
				$("#doc-departed").click(function(){
					$(this).css("border-bottom", "4px solid rgb(166, 184, 145)").css("font-weight", 600);
					$("#doc-arrived").css("border-bottom", "2px solid lightgray").css("font-weight", 400);
					$("#departed-tb").show();
					$("#arrived-tb").hide();
				})
				
				// 결재목록을 조회해주는 ajax
				$(function(){
					recentApproval();
					//setInterval(recentApproval, 3000);
				})
				
				function recentApproval(){
					$.ajax({
						url:"recent.ap",
						success:function(result){
							
							console.log(result);
							
							let value1 = "";
							
							if(result.list1.length == 0){
								value1+= "<tr>" 
										+ "<td colspan='4'>"
										+ "결재 대기중인 문서가 없습니다."
										+ "</td>"
										+"</tr>";
							}else{
								for(let i = 0; i < result.list1.length; i++){
									let a = result.list1[i];
									value1 += "<tr>"
											+ "<td>" + a.enrollDate + "</td>"
											+ "<td>" + a.formName + "</td>";
											if(a.formCode == 3 || a.formCode == 4){
												value1 += "<td>" + a.formName + "</td>";
											}else{
												value1 += "<td>" + a.title + "</td>";
											}
											
											value1+= "<td>" + a.empName + "</td></tr>";
								}
							}
							$("#arrived-tb tbody").html(value1);
							
							
							let value2 = "";
							if(result.list2.length == 0){
								value2+= "<tr>" 
									+ "<td colspan='4'>"
									+ "기안 진행중인 문서가 없습니다."
									+ "</td>"
									+"</tr>";							
							}else{
								for(let i = 0; i<result.list2.length; i++){
									let b = result.list2[i];
									value2 += "<tr>"
										+ "<td>" + b.enrollDate + "</td>"
										+ "<td>" + b.formName + "</td>";
										if(b.formCode == 3 || b.formCode == 4){
											value2 += "<td>" + b.formName + "</td>";
										}else{
											value2 += "<td>" + b.title + "</td>";
										}
										
										value2 += "<td>" + b.empName + "</td></tr>";								
								}
							}
							
							$("#departed-tb tbody").html(value2);
							
						}, error:function(){
							//console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
							console.log("전자결재 조회용 ajax 통신실패");
						}
					});
				}
			</script>
		
			<div class="mail">
				<b>메일함</b>
				<br><br>
				<div class="subtitle mail-list" id="mail-received">받은 메일</div>
				<div class="subtitle mail-list" id="mail-etc"></div>
				<br clear="both"><br>
		
				<table>
					<colgroup>
						<col style="width:35%;">
						<col sytle="width:50%;">
						<col style="width:15%;">
					</colgroup>
					<thead>
						<tr>
							<th>발신자</th>
							<th>제목</th>
							<th>수신일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${ not empty recMailList }">
								<c:forEach var="m" begin="0" end="5" items="${ recMailList }">
									<c:if test="${ m.status == 'Y' }">
										<tr class="mailOne">
											<td>
												<div style="width: 25%; float: left;">
													${ m.empName }&nbsp;
												</div>
												<div style="width: 70%; float: left; overflow: hidden; text-overflow: ellipsis;">
													${ m.sendMailAdd }
												</div>
											</td>
											<td>
												<div style="width: 92%; float: left; overflow: hidden; text-overflow: ellipsis;">
													${ m.mailTitle }
												</div>
											</td>
											<td>
												${ m.dateDay }
												<input class="mailNo" type="hidden" name="mailNo" value="${ m.mailNo }">
												<input class="recMailNo" type="hidden" name="recMailNo" value="${ m.recMailNo }">
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3" style="text-align: center;">수신 메일이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
	
				<script>
					document.querySelectorAll(".mailOne").forEach(function(mailOne){
						mailOne.addEventListener('click', function(){
							const form = document.createElement("form");
							const table = document.createElement("table");
							const tr = this.cloneNode(true)
							table.append(tr);
							form.append(table);
							form.setAttribute("style", "display:none;")
							form.action = "select.ma";
							form.method = "POST";
							document.body.append(form);
							form.submit();
						})
					});
				</script>
	
			</div>
		</div>
		<div id="right-col">
			<div class="attendance">
				<b>근태현황</b>
				<br>
				<p id="date-today">2023년 3월 3일 (금)</p>
				<div id="current-time">
					<span id="hour"></span>
					:
					<span id="minutes"></span>
					:
					<span id="seconds"></span>
				</div>
		
				<table class="work-time">
					<tr>
						<td class="work-th" style="text-align:center;">정규근무</td>
						<td class="work-td2" style="text-align:right;"><span id="sum-time"></span>/40h</td>
					</tr>
					<tr>
						<td class="work-th" style="text-align:center;">추가근무</td>
						<td class="work-td2" style="text-align:right;">0h</td>
					</tr>
				</table>
		
				<br><br>
		
				<table class="commute-time" style="text-align:center;">
					<tr>
						<td class="commute-th">출근시각</td>
						<td class="commute-th">퇴근시각</td>
					</tr>
					<tr>
						<td id="in-time"></td>
						<td id="out-time"></td>
					</tr>
				</table>
				<br>
				<button class="commute-btn" id="in-btn" onclick="inTime();">출근하기</button>
				<button class="commute-btn" id="out-btn" onclick="outTime();">퇴근하기</button>
		
				<script>
					let h = "";
					let m = "";
					let s = ""; 
		
					$(function(){
						updateClock();
					})
		
					function updateClock(){ /* 실시간 시계 */
						const ampmEl = document.getElementById("ampm");
						const hourEl = document.getElementById("hour");
						const minuteEl = document.getElementById("minutes");
						const secondEl = document.getElementById("seconds");
		
						h = new Date().getHours();
						m = new Date().getMinutes();
						s = new Date().getSeconds();
		
						h = h < 10 ? "0" + h : h;
						m = m < 10 ? "0" + m : m;
						s = s < 10 ? "0" + s : s;
		
						hourEl.innerText = h;
						minuteEl.innerText = m;
						secondEl.innerText = s;
						
						setTimeout(()=>{
							updateClock()
						}, 1000)
					}
					
					let strTime = "";
					let endTime = "";
		
					function inTime(){/*출근하기 버튼 클릭시*/
		
						strTime = new Date(); /*경과시간계산용*/
		
						let inTime = h + ":" + m + ":" + s;
						$("#in-time").text(inTime);
						$("#in-btn").css("color", "gray").css("background-color", "rgb(93, 104, 83)").attr("disabled", true);
					}
					function outTime(){/*퇴근하기 버튼 클릭시*/
		
						endTime = new Date();/*경과시간계산용*/
		
						let outTime = h + ":" + m + ":" + s;
						$("#out-time").text(outTime);
						$("#out-btn").css("color", "gray").css("background-color","rgb(85, 85, 85)").attr("disabled", true);
		
						/*경과시간 계산*/
						let diff = (endTime - strTime);
						var hh = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
						var mm = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
						var ss = Math.ceil((diff % (1000 * 60)) / 1000);
		
						var diffResult = hh + "h " + mm + "m " + ss + "s ";
		
						$("#sum-time").text(diffResult);
		
		
					}
					$(function(){
						
						
					})
				</script>
			</div>
			<div class="schedule">
				<div class="show-month">
					<span id="thisYear"><b>2023</b></span>
					<b> / </b>
					<span id="thisMonth"><b>3</b></span>
				</div>
				<div id="calander" style="padding-top:10px;">
					<input class="dateSelector" style="display:none"/>
				</div>
				
				<br>
				<div>
					<span>Today's 일정</span>
					<ul id="scheduleList">
						
					</ul>
				</div>
				
				
				<script>
					$(function(){
					
						topScheduleList();
						
						function topScheduleList(){
							
							$.ajax({
								url:"topList.sc",
								success:function(scList){
									console.log(scList);
									
									let value = "";
									
									for(let i=0; i<scList.length; i++){
										let s = scList[i]; // {}
										if(s.allDay == 'Y'){ 
											value += "<a href='scheduleUpDel.sc?no=" + s.scNo + "'>"
												   + 	"<li>" + s.scTitle + "<br>" + s.startDate +  " ~ "  + s.endDate + "</li>"
												   + "</a>"
										}else{
											value += "<a href='scheduleUpDel.sc?no=" + s.scNo + "'>"
												   +	"<li>" + s.scTitle + "<br>" + s.startDate + " " + s.startTime +  " ~ "  + s.endDate + " " + s.endTime + "</li>"
												   + "</a>"
										}
									}
									
									$("#scheduleList").html(value);
									
								},error:function(){
									console.log("top3 일정 조회용 ajax 통신 실패");
								}
							})
							
						}
						
					})
				</script>
				
		
				<script>
					$(function(){
						var dateSelector = document.querySelector('.dateSelector');
						flatpickr.localize(flatpickr.l10ns.ko);
						flatpickr(dateSelector);
						dateSelector.flatpickr({
							local: 'ko',
							inline: true,
							disable: [
							// 주말 제외 (토, 일)
							function(date) {
							//return (date.getDay() === 0 || date.getDay() === 6);
							}
							],
							dateFormat: "Y-m-d",
						});
		
					})
				</script>
			</div>
	</div>
</div>
	       
		

</body>
</html>