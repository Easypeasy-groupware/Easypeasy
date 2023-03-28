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

	#content{
        width: 1000px;
        float: left;
    }

    #con-title h5{
    	color:rgb(93, 109, 75);
        padding-left: 20px;
        padding-top: 15px;
        display: inline-block;
    }
   
    input{
        border: 1px solid lightgray;
        border-radius: 5px;
    }
    
    #content-1 select{
        border: 1px solid lightgray;
        border-radius: 5px;
    }
    
    .footer{
    	text-align: center;
    }
    
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div id="main">

        <jsp:include page="sidebar.jsp"/>

        <div id="content">
            <div id="con-title">
                <span>
                    <h5>${ r.resourceName }</h5>
                </span>
            </div>
            <form action="reservationUpdate.re" method="post">
                    
                <input type="hidden" name="reNo" value="${ r.reNo }">
                
                <div style="margin: 20px;">
                    <table id="content-1">
                        <tr style="height: 45px;">
                            <td style="width: 80px;">예약일</td>
                            <td>
                                <input type="text" id="sDate" size="11" value="${ r.startDate }" name="startDate">
                                <span>
                                    <select class="sel" name="startTime" id="sel1">
                                        <option value="08:00">08:00</option>
                                        <option value="08:30">08:30</option>
                                        <option value="09:00">09:00</option>
                                        <option value="09:30">09:30</option>
                                        <option value="10:00">10:00</option>
                                        <option value="10:30">10:30</option>
                                        <option value="11:00">11:00</option>
                                        <option value="11:30">11:30</option>
                                        <option value="12:00">12:00</option>
                                        <option value="12:30">12:30</option>
                                        <option value="13:00">13:00</option>
                                        <option value="13:30">13:30</option>
                                        <option value="14:00">14:00</option>
                                        <option value="14:30">14:30</option>
                                        <option value="15:00">15:00</option>
                                        <option value="15:30">15:30</option>
                                        <option value="16:00">16:00</option>
                                        <option value="16:30">16:30</option>
                                        <option value="17:00">17:00</option>
                                        <option value="17:30">17:30</option>
                                        <option value="18:00">18:00</option>
                                        <option value="18:30">18:30</option>
                                        <option value="19:00">19:00</option>
                                        <option value="19:30">19:30</option>
                                        <option value="20:00">20:00</option>
                                        <option value="20:30">20:30</option>
                                        <option value="21:00">21:00</option>
                                        <option value="21:30">21:30</option>
                                        <option value="22:00">22:00</option>
                                        <option value="22:30">22:30</option>
                                        <option value="23:00">23:00</option>
                                    </select>
                                </span>
                                <span>~</span>
                                <input type="text" id="eDate" size="11" value="${ r.endDate }" name="endDate">
                                <span>
                                    <select class="sel" name="endTime" id="sel2">
                                        <option value="08:00">08:00</option>
                                        <option value="08:30">08:30</option>
                                        <option value="09:00">09:00</option>
                                        <option value="09:30">09:30</option>
                                        <option value="10:00">10:00</option>
                                        <option value="10:30">10:30</option>
                                        <option value="11:00">11:00</option>
                                        <option value="11:30">11:30</option>
                                        <option value="12:00">12:00</option>
                                        <option value="12:30">12:30</option>
                                        <option value="13:00">13:00</option>
                                        <option value="13:30">13:30</option>
                                        <option value="14:00">14:00</option>
                                        <option value="14:30">14:30</option>
                                        <option value="15:00">15:00</option>
                                        <option value="15:30">15:30</option>
                                        <option value="16:00">16:00</option>
                                        <option value="16:30">16:30</option>
                                        <option value="17:00">17:00</option>
                                        <option value="17:30">17:30</option>
                                        <option value="18:00">18:00</option>
                                        <option value="18:30">18:30</option>
                                        <option value="19:00">19:00</option>
                                        <option value="19:30">19:30</option>
                                        <option value="20:00">20:00</option>
                                        <option value="20:30">20:30</option>
                                        <option value="21:00">21:00</option>
                                        <option value="21:30">21:30</option>
                                        <option value="22:00">22:00</option>
                                        <option value="22:30">22:30</option>
                                        <option value="23:00">23:00</option>
                                    </select>
                                </span>
                                &nbsp;
                                <div class="custom-control custom-checkbox" style="display: inline-block;">
                                    <input type="checkbox" class="custom-control-input" name="allDay" value="N" id="allDay" onclick="allDayShowHidden();">
                                    <label class="custom-control-label" for="allDay">종일</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>예약자</td>
                            <td colspan="6"><input type="text" name="reWriter" size="11" value="${ r.reWriter }" disabled></td> 
                        </tr>
                        <tr style="height: 45px;">
                            <td>목적</td>
                            <td colspan="6"><input type="text" name="rePurpose" size="60" value="${ r.rePurpose }" required></td> 
                        </tr>
                    </table>
                </div>
                <hr>
                <br>
                <div class="footer">
                    <a href="" id="list" class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">목록으로 돌아가기</a>&nbsp;
                    <button type="submit" id="updateBtn" class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">예약 수정하기</button>&nbsp;
                    <a href="reservationDel.re?no=${ r.reNo }" class="btn btn-sm btn-light" id="deleteBtn" style="background: white;" data-dismiss="modal">예약 취소하기</a>
                </div>
            </form>
        </div>
    </div>
    
    <script>
    	var category = "<c:out value='${ r.categoryName }'/>";
    
    	if(category == "회의실"){
    		$("#list").attr("href", "mettingRoomTimeGrid.re?mno=${ r.resourceNo }");	
    	}else if(category == "빔프로젝터"){
    		$("#list").attr("href", "beamProjectorTimeGrid.re?bno=${ r.resourceNo }");
    	}
    </script>
    
    <script>
	 	// datepicker
	    $(function(){
	        $("#sDate, #eDate").datepicker({
	            dateFormat: "yy-mm-dd",
	            showOtherMonths: true,
	            showMonthAfterYear: true,
	            changeYear: true,
	            changeMonth: true,
	            buttonImageOnly: true,
	            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	            dayNamesMin: ['일','월','화','수','목','금','토'],
	            dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
	            minDate: "D"
	        })
	
	        
	        //$("#sDate").datepicker("setDate", 2023-03-11);
	        //$("#eDate").datepicker("setDate", "${r.endDate}");
	
	        
	        $("#sDate").datepicker();
	        $("#sDate").datepicker("option", "maxDate", $("#eDate").val());
	        $("#sDate").datepicker("option", "onClose", function (selectedDate) {
	            $("#eDate").datepicker("option", "minDate", selectedDate);
	        });
	        
	        $("#eDate").datepicker();
	        $("#eDate").datepicker("option", "minDate", $("#sDate").val());
	        $("#eDate").datepicker("option", "onClose", function (selectedDate) {
	            $("#sDate").datepicker("option", "maxDate", selectedDate);
	        });
	
	    })
	
	 	// 종일 체크시 시간 선택 숨기기
        function allDayShowHidden(){
            if($("input:checkbox[id='allDay']").is(":checked") == true) {
                $(".sel").attr("hidden", true);
                $("#sel1").val("08:00"); // 시간 값 8시부터
                $("#sel2").val("23:00"); // 23시까지
                $("input[name=allDay]").val("Y");
            } else {
            	//console.log($("input:checkbox[id='allDay']").prop("checked", false));
                $(".sel").attr("hidden", false);
            } 
        }
	 	
	 	// 시간 DB에 저장된 값으로 선택돼 있도록
	    $("#sel1").val("${ r.startTime }").prop("selected", true);
    	$("#sel2").val("${ r.endTime }").prop("selected", true);
	 	
    	
    	// DB에 담긴 값이 allDay Y면 기본값으로 종일 선택시키고 시간 선택 숨기기
    	var allDay = "<c:out value='${ r.allDay }'/>";
    	
    	if(allDay == "Y"){
    		$("#allDay").prop("checked", true);
    		$(".sel").attr("hidden", true);
    	}
    	
    	var writer = "<c:out value='${ r.reWriter }'/>";
    	var loginUser = "<c:out value='${ loginUser.empName }'/>";
    	
    	if(writer != loginUser){
    		$("#updateBtn").prop("disabled", true);
    		$("#updateBtn").css("background", "lightgray");
    	}
    	
    	if(writer != loginUser){
    		$("#deleteBtn").css("pointer-events", "none");
			$("#deleteBtn").css("cursor", "default");
			$("#deleteBtn").css("background", "rgb(235, 235, 235)");
			$("#deleteBtn").css("color", "white");
    	}
    	
    </script>

</body>
</html>