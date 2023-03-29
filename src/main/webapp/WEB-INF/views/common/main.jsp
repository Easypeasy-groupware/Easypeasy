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
    #clock{color:gray; display: inline-block;}
    #clock{display: inline-block; margin-left:10px; color:gray; font-size:20px;}
    .work-time{width:80%;}
    .work-th{font-size:17px; font-weight:700; color:rgb(65, 64, 64); width:30%; height:30px; padding:0;}
    .work-td2{width:70%; height:30px; padding:0;}
    .commute-time{width:80%; font-size:20px;}
    .commute-time td{height:30px;}

    .commute-th{font-size:17px; font-weight:700; color:rgb(65, 64, 64);}

    .commute-btn{width:100px; height:35px; border:0; border-radius:5px; color:white; font-size:16px;}
    #in-btn{background:rgb(166, 184, 145); margin-left:30px;}
    #in-btn:hover{font-weight:600; background: rgb(116, 129, 101); cursor:pointer;}
    #out-btn{background: gray; margin-left:50px;}
    #out-btn:hover{cursor:pointer; font-weight:600; background: rgb(85, 85, 85);}


	#scheduleList a{
		text-decoration: none;
		color: black;
	}
	#scheduleList a:hover{
		font-weight:600;
	}
	
	#arrived-tb *, #departed-tb *{overflow:hidden; text-overflow: ellipsis;}
	.board-table th, #arrived-tb th, #departed-tb th, #tb-mail th{text-align:center;}
	
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
		
				<table class="board-table" id="notice-tb" style="table-layout:fixed;">
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
	 
				<table class="board-table" id="free-tb" style="display:none; table-layout:fixed;">
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
            	 	
					$(document).on("click", "#notice-tb>tbody>tr", function(){
            			location.href = 'detailForm.bo?no=' + $(this).children().eq(0).text(); // 자손들 중 첫번째 값
            		}) 
            		
            		$(document).on("click", "#free-tb>tbody>tr", function(){
            			location.href = 'detailAForm.bo?no=' + $(this).children().eq(0).text(); // 자손들 중 첫번째 값
            		}) 
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
	            							+   "<td style='display:none'>" + list[i].boardNo +"</td>"
	            							+	"<td style='width: 98%; text-overflow:ellipsis; overflow:hidden; white-space: nowrap;'>" + list[i].boardTitle + "</td>"
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
		            							+   "<td style='display:none'>" + b.boardNo +"</td>"
		            							+	"<td style='width: 98%; text-overflow:ellipsis; overflow:hidden; white-space: nowrap;'>" + b.boardTitle + "</td>"
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
						<col style="width:35%;">
						<col style="width:35%;">
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
						<col style="width:35%;">
						<col style="width:35%;">
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
											+ "<td>" + a.enrollDate + "<input type='hidden' id='aNum1' value=" + a.appNo + "></td>"
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
										+ "<td>" + b.enrollDate +"<input type='hidden' id='aNum2' value=" + b.appNo + "> </td>"
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
							
							if(result.list1.length > 0){
								$("#arrived-tb tbody").on("click", "tr", function(){
						            location.href = 'detailRec.ap?no=' + $(this).eq(0).children().find("#aNum1").val()+"&form="+ $(this).children().eq(1).text()+"&st=결재대기"; 
						        }); 
							}
							
							if(result.list2.length > 0){
								$("#departed-tb tbody").on("click", "tr", function(){
						            location.href = 'detailSPrg.ap?no=' + $(this).eq(0).children().find("#aNum2").val()+"&form="+ $(this).children().eq(1).text()+"&st=결재대기"; 
						        }); 
							}
							
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
		
				<table id="tb-mail">
					<colgroup>
						<!-- <col style="width:35%;"> -->
						<!-- <col sytle="width:50%;"> -->
						<!-- <col style="width:15%;"> -->
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
								<c:forEach var="m" begin="0" end="4" items="${ recMailList }">
									<c:if test="${ m.status == 'Y' }">
										<tr class="mailOne">
											<td style="width: 270px;">
												<div style="width: 80px; float: left;">
													${ m.empName }&nbsp;
												</div>
												<div style="width: 170px; float: left; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
													${ m.sendMailAdd }
												</div>
											</td>
											<td style="width: 390px">
												<div style="width: 360px; float: left; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
													${ m.mailTitle }
												</div>
											</td>
											<td style="width: 300pxs">
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
							const tr = this.cloneNode(true);
							const input = document.createElement("input");
							input.setAttribute("style", "display:none")
							input.setAttribute("name", "div");
							input.setAttribute("value", 1);
							table.append(tr);
							form.append(table);
							form.append(input);
							form.setAttribute("style", "display:none;");
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
				<p id="clock"></p>

		
				<br><br>
		
				<table class="commute-time" style="text-align:center;">
					<tr>
						<td class="commute-th">출근시각</td>
						<td class="commute-th">퇴근시각</td>
					</tr>
					<tr>
						<td id="in-time">
							<c:if test="${ not empty userCom.startTime }">
	                    		${ userCom.startTime }
	                    	</c:if>
                    	</td>
						<td id="out-time">
							<c:if test="${ not empty userCom.endTime }">
	                    		${ userCom.endTime }
	                    	</c:if>
						</td>
					</tr>
				</table>
				<br>
				<button class="commute-btn" id="in-btn" onclick="inTime();">출근하기</button>
				<button class="commute-btn" id="out-btn" onclick="outTime();">퇴근하기</button>
		
                <script>
	                $(function(){
	         			
	                	//출근시간 등록이 되어 있을 시 버튼 비활성화
	                	if($("#in-time").html().trim().length != 0){
	                		$("#in-btn").css("background-color", "rgb(93, 104, 83)").attr("disabled", true);
	                	} 
	                	
	                	//퇴근시간 등록이 되어 있을 시 버튼 비활성화
	                	if($("#out-time").html().trim().length != 0){
	                		$("#out-btn").css("background-color", "rgb(93, 104, 83)").attr("disabled", true);
	                	}
	                })
                </script>
				<script>
					let h = "";
					let m = "";
					let s = ""; 
		
					$(function(){
						updateClock();
					})
		
                	//현재 날짜 시간 출력
                    var Target = document.getElementById("clock");
                    function clock() {
                        var time = new Date();
            
                        var month = time.getMonth();
                        var date = time.getDate();
                        var day = time.getDay();
                        var week = ['일', '월', '화', '수', '목', '금', '토'];
            
                        var hours = time.getHours();
                        var minutes = time.getMinutes();
                        var seconds = time.getSeconds();
            
                        Target.innerText = 
                        	(month + 1)+"월 "+ date + "일 " + week[day] +"요일 " +
                        	(hours < 10 ? "0"+hours : hours )
                        	+ ":" +( minutes < 10 ? "0"+minutes : minutes )
                        	+ ":" +( seconds < 10 ? "0"+seconds : seconds );
                        
                    }
                    clock();
                    setInterval(clock, 1000); // 1초마다 실행
					
					let strTime = "";
					let endTime = "";
		
					//출근하기 버튼 클릭
                    function inTime(){
                    	const a = new Date(); 

                    	let h = a.getHours();
                    	let m = a.getMinutes(); 
                    	let s = a.getSeconds(); 
                    	
                    	h = h < 10 ? "0" + h : h;
						m = m < 10 ? "0" + m : m;
						s = s < 10 ? "0" + s : s;
                    	
                    	let inTime = h+":"+m+":"+s;
                    	
                    	$("#in-time").text(inTime);
    	                $("#in-btn").css("color", "gray").css("background-color", "rgb(93, 104, 83)").attr("disabled", true);
    	                
    	                var year = a.getFullYear();
    	                var month = a.getMonth()+1;  
                        var date = a.getDate();
                        
    	                month = month < 10 ? "0" + month : month;
    	                date = date < 10 ? "0" + date : date;
                        
                        var today = year + "/" + month + "/" + date;
                        
                        
    	                inTimeInsertAjax(today);
    	                
    	                
    	            }
                    
                    function inTimeInsertAjax(today){
                    	
                    	$.ajax({
    	                	url:"inTime.co",
    	                	data:{
    	                		startTime:$("#in-time").html().trim(),
    	                		empNo:${loginUser.empNo},
    	                		enrollDate:today
    	                		},
    	                	success:function(result){
    	                		if(result=="success"){
    	                			console.log(result);
    	                			swal({
    	                	            title:   '출근 확인', 
    	                	            text: "출근시간이 기록되었습니다", 
    	                	            icon: "success",
    	                	            button: "확인"
    	                	         });
    	                		}
    	                	},error:function(){
    	                		console.log("출근시간등록 ajax 통신실패");
    	                		swal({
	                	            title:   '출근 확인', 
	                	            text: "출근시간 기록에 실패했습니다", 
	                	            icon: "error",
	                	            button: "확인"
	                	         });
    	                	}
    	                })
                    }
                    //퇴근하기 버튼 클릭
    	            function outTime(){
    	
    	            	const a = new Date(); 

                    	let h = a.getHours();
                    	let m = a.getMinutes(); 
                    	let s = a.getSeconds(); 
                    	
                    	h = h < 10 ? "0" + h : h;
						m = m < 10 ? "0" + m : m;
						s = s < 10 ? "0" + s : s;
                    	
                    	let outTime = h+":"+m+":"+s;
    	               
    	                $("#out-time").text(outTime);
    	                $("#out-btn").css("color", "gray").css("background-color","rgb(85, 85, 85)").attr("disabled", true);
    	                
    	                var year = a.getFullYear();
    	                var month = a.getMonth()+1;  
                        var date = a.getDate();
                        
    	                month = month < 10 ? "0" + month : month;
    	                date = date < 10 ? "0" + date : date;
                        
                        var today = year + "/" + month + "/" + date;
                        
                        
    	                outTimeInsertAjax(today);
    	                workTimeInsertAjax(today);
    	
    	                
    	            }
                    
					function outTimeInsertAjax(today){
                    	
                    	$.ajax({
    	                	url:"outTime.co",
    	                	data:{
    	                		endTime:$("#out-time").html().trim(),
    	                		empNo:${loginUser.empNo},
    	                		enrollDate:today
    	                		},
    	                	success:function(result){
    	                		if(result=="success"){
    	                			console.log(result);
    	                			swal({
    	                	            title:   '퇴근 확인', 
    	                	            text: "퇴근시간이 기록되었습니다", 
    	                	            icon: "success",
    	                	            button: "확인"
    	                	         });
    	                		}
    	                	},error:function(){
    	                		console.log("퇴근시간등록 ajax 통신실패");
    	                		swal({
	                	            title:   '퇴근 확인', 
	                	            text: "퇴근시간이 기록에 실패했습니다", 
	                	            icon: "error",
	                	            button: "확인"
	                	         });
    	                	}
    	                })
                    }
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
										
										if(scList.length == 0){
											value+= "<tr>" 
												+ "<td colspan='1'>"
												+ "오늘의 일정이 없습니다."
												+ "</td>"
												+"</tr>";							
										}else{
										
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