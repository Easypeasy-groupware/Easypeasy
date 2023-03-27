<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #main{  
        position: absolute; top: 120px;
    }
    .side{
        width: 200px;
        height: 900px;
        box-sizing: none;
        float: left;
    }
    .title{
        width: 980px;
        height: 100px;
        box-sizing: none;
        float: left;
        font-size: 30px;
        
    }
    .allContent{
        width: 990px;
        height: 900px;
        box-sizing: none;
        float: left;
        margin-left:10px;
        
    }
    .content1{
        width: 490px;
        height: 390px;
        box-sizing: none;
        float: left;
    }
    .content2{
        width: 490px;
        height: 390px;
        box-sizing: none;
        float: left;
    }
    .content3{
        width: 490px;
        height: 390px;
        box-sizing: none;
        float: left;
        
    }
    .content4{
        width: 490px;
        height: 390px;
        box-sizing: none;
        float: left;
    }
    .name{
        font-size: 25px;
        margin-top: 10px;
        margin-left: 10px;
        font-weight: bold;
    }
    #commute{
        border: 1px solid gray;
        width: 400px;
        height: 300px;
        font-size: 15px;
        text-align: center;
        margin: 0 auto;
        border-radius: 10px;
    }
    .vac{
        border: 1px solid gray;
        width: 400px;
        height: 100px;
        text-align: center;
        font-size: 15px;
        margin: 0 auto;
        border-radius: 10px;
    }

    .in-button{
        width: 100px;
        height: 30px;
        border: none;
    }
    .out-button{
        width: 100px;
        height: 30px;
        border: none;
    }
    .button{
        width: 100px;
        height: 30px;
        border: none;
    }
    .btn-status{
    	width: 150px;
        height: 50px;
        border: none;
        margin-left: 30px;
    }
    .start{
        float: left;
        margin: 20px;
        margin-left: 30px;
        font-size: 15px;
        text-align: center;
    }
    .end{
        float: left;
        margin: 20px;
        font-size: 15px;
        text-align: center;
    }
    .bbb{
        margin-left: 40px;
    }
    #clock{
        margin-left:10px;
        font-size: 35px;
    }
    .status{
        width: 80px;
        height: 25px;
        background-color: lightgray;
        text-align: center;
        font-weight: bold;
        margin-left: 300px;

    }
    .inTime{
    	height: 20px;
    	font-size: 15px;
    }
    .outTime{
    	height: 20px;
    	font-size: 15px;
    }
    .tg  {border-collapse:collapse;border-color:#ccc;border-spacing:0;width: 400px; height: 150px; margin: 0 auto;}
    .tg td{background-color:#fff;border-color:#ccc;border-style:solid;border-width:0px;color:#333;
           font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
    .tg th{background-color:#f0f0f0;border-color:#ccc;border-style:solid;border-width:0px;color:#333;
             font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
    .tg .tg-0lax{text-align:center;vertical-align:top}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!--Popper JS --> 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	

    <div id="main">


        <div class="side"><jsp:include page="../commute/commuteSidebar.jsp"/></div>
        <div class="allContent">
            <div class="title"><b>나의 근무 정보</b><hr></div>
            
            

            <div class="content1">
                <div class="name" style="float: left;">근무체크</div><br><br>
			
			<c:choose>
				<c:when test="${ not empty loginUser.status && empty c.endTime && not empty c.startTime }">
	                <div class="status">
	                
	                	<c:choose>
	                		<c:when test="${ loginUser.status eq 'ME' }">회의중</c:when>
	                		<c:when test="${ loginUser.status eq 'OU' }">외출중</c:when>
	                		<c:when test="${ loginUser.status eq 'OW' }">외근중</c:when>
	                		<c:otherwise>근무중</c:otherwise>
	                	</c:choose>
	                
	                </div><br>
	             </c:when>
	             <c:otherwise><br><br></c:otherwise>
             </c:choose>

                <h1 id="clock" style="color:black;">clock</h1>

                <div class="start">출근시각 <br>
                <img src="resources/common_images/startTime.png" style="width:80px;">
                    <div class="inTime">
                     
                    <c:if test="${ not empty c.startTime }">
                    	${ c.startTime }
                    </c:if>
                    </div>
                    <br><button class="in-button" onclick="inTime();" style="background-color: rgb(214, 223, 204); width: 150px; height: 40px;">출근하기</button>
                </div>
                <script>
	                $(function(){
	         			
	                	//출근시간 등록이 되어 있을 시 버튼 비활성화
	                	if($(".inTime").html().trim().length != 0){
	                		$(".in-button").css("background-color", "rgb(93, 104, 83)").attr("disabled", true);
	                	} 
	                	
	                	//퇴근시간 등록이 되어 있을 시 버튼 비활성화
	                	if($(".outTime").html().trim().length != 0){
	                		$(".out-button").css("background-color", "rgb(93, 104, 83)").attr("disabled", true);
	                	}
	                })
                </script>

                <div class="end">퇴근시각 <br>
                <img src="resources/common_images/endTime.png" style="width:80px;">
                    <div class="outTime">
                    <c:if test="${ not empty c.endTime }">
                    	${ c.endTime }
                    </c:if>
                    </div>
                    <br><button class="out-button" onclick="outTime();" style="width: 150px; height: 40px;">퇴근하기</button>
                </div>
                
    
                <script>
                
	                let h = "";
		            let m = "";
		            let s = "";
	            
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
                        	(month + 1)+"월 "+ date + "일 " + week[day] +"요일" +
                        	(hours < 10 ? "0"+hours : hours )
                        	+ ":" +( minutes < 10 ? "0"+minutes : minutes )
                        	+ ":" +( seconds < 10 ? "0"+seconds : seconds );
                        
                    }
                    clock();
                    setInterval(clock, 1000); // 1초마다 실행
                    
                    
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
                    	
                    	$(".inTime").text(inTime);
    	                $(".in-button").css("color", "gray").css("background-color", "rgb(93, 104, 83)").attr("disabled", true);
    	                
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
    	                		startTime:$(".inTime").html().trim(),
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
    	               
    	                $(".outTime").text(outTime);
    	                $(".out-button").css("color", "gray").css("background-color","rgb(85, 85, 85)").attr("disabled", true);
    	                
    	                var year = a.getFullYear();
    	                var month = a.getMonth()+1;  
                        var date = a.getDate();
                        
    	                month = month < 10 ? "0" + month : month;
    	                date = date < 10 ? "0" + date : date;
                        
                        var today = year + "/" + month + "/" + date;
                        
                        
    	                outTimeInsertAjax(today);
    	
    	                
    	            }
                    
					function outTimeInsertAjax(today){
                    	
                    	$.ajax({
    	                	url:"outTime.co",
    	                	data:{
    	                		endTime:$(".outTime").html().trim(),
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
            <div class="content2">
                <div class="name">근무현황</div><br>
                <div class="bbb">
                <button class="btn-status" onclick="status(1);" id="WO" value="WO">근무</button>
                <button class="btn-status" onclick="status(2);" id="ME" value="ME">회의</button><br><br><br>
                <button class="btn-status" onclick="status(3);" id="OW" value="OW">외근</button>
                <button class="btn-status" onclick="status(4);" id="OU" value="OU">외출</button>
                </div> <br>
                

             
            </div>
            
            <script>
            	let a = "";
            	

                function status(num){
                    if(${ c.endTime == null }) {
                        if(num==1){
                        a = $("#WO").val();
                        
                    }else if(num==2){
                        a = $("#ME").val();
                    }else if(num==3){
                        a = $("#OW").val();
                    }else{
                        a = $("#OU").val();
                    }
                    
                    
                    updateStatus(a);
                    }
                    

                    
                    
                }
            	
            	function updateStatus(a){
            		$.ajax({
            			url:"updateStatus",
            			data:{
            				empNo:${loginUser.empNo},
            				status:a
            			},
            			success:function(result){
	                		if(result=="success"){
	                			console.log(result);
	                			swal({
	                	            title:   '근무상태 등록', 
	                	            text: "근무상태가 등록되었습니다.", 
	                	            icon: "success",
	                	            button: "확인"
	                	            
	                	         });
                                 
                                let recode = document.querySelector(".recode");
                                let text = document.createElement("div");
                                let time = new Date();
                                let h = time.getHours();
                                let m = time.getMinutes(); 
                                let s = time.getSeconds();
                                let insertTime = h+":"+m+":"+s; 

                                if( a == 'OU' ) {
                                    text.innerText = "-- " + insertTime + " 외출"
                                }else if( a == 'ME' ) {
                                    text.innerText = "-- " + insertTime + " 회의"
                                }else if( a== 'OW' ) {
                                    text.innerText = "-- " + insertTime + " 외근"
                                }else{
                                    text.innerText = "-- " + insertTime + " 근무"
                                }

                                recode.append(text);
	                		}
	                	},error:function(){
	                		console.log("퇴근시간등록 ajax 통신실패");
	                		swal({
                	            title:   '근무상태 등록', 
                	            text: "근무상태 등록에 실패했습니다.", 
                	            icon: "error",
                	            button: "확인"
                	         });
	                	}
            		})
            	}
            </script>
            
            <div class="content3">
                <div class="name">근태현황</div><br>
                <table  id="commute">
                    <tr>
                        <td>지각</td>
                        <td>${ tr }회</td>
                    </tr>
                    <tr>
                        <td>조기퇴근</td>
                        <td>${ countLe }회</td>
                    </tr>
                    <tr>
                        <td>결근</td>
                        <td>${ ab }회</td>
                    </tr>
                    <tr>
                        <td>퇴근미체크</td>
                        <td>${ end }회</td>
                    </tr>
                </table>
            </div>
            <div class="content4">
                <div class="name" style="float: left; width: 330px;">휴가현황</div><br>
                <a href="enrollForm.ap?formCode=3"><button class="button" style="float: left; background-color: rgb(214, 223, 204); ">휴가신청</button></a><br><br><br>
                <table class="vac">
                    <tr>
                        <td>잔여휴가</td>
                        <td>14일</td>
                    </tr>
                </table><br>
                <table class="tg">
                    <thead>
                      <tr>
                        <th class="tg-0lax">휴가기간</th>
                        <th class="tg-0lax">휴가일수</th>
                      </tr>
                    </thead>
                    
                    <tbody>
                    <c:forEach var="list2" items="${ list2 }">
                      <tr>
                        
                		<td class="tg-0lax">${ list2.vacStart }~${ list2.vacEnd }</td>
                		<td class="tg-0lax">${ list2.vacUse }일</td>
                	
                      </tr>
                      </c:forEach>
                    </tbody>
                    </table>
            </div>
        </div>
    
    </div>

</body>
</html>