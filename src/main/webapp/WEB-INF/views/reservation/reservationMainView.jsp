<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
        box-sizing: border-box;
    }
    
    #content{
        width: 1000px;
        float: left;
        box-sizing: border-box;
    }

    #con-title h5{
    	color:rgb(93, 109, 75);
        padding-left: 10px;
        padding-top: 12px;
        display: inline-block;
    }
    #con-title>select{
        width: 110px;
        height: 30px;
        margin-left: 755px;
        display: inline-block;
    }

	#content-1{
		width: 990px;
		padding-left: 10px;
	}
    #content-1>h5{
    	color:rgb(93, 109, 75);
        margin-left: 5px;
        padding-top: 20px;
    }
    #content-1>table{
        width: 980px;
        text-align: center;
    }

    #modal select{
        width: 110px;
    }
    #modal input{
        border: 1px solid lightgray;
        border-radius: 5px;
    }

    .sel{
        height: 30px;
        border: 1px solid lightgray;
        border-radius: 5px;
    }

	.dropdown{
		margin-top: 10px;
		float: right;
	}
	.dropdown button{
		background: rgb(214, 223, 204);
		color: white;
		border: none;
	}
	.btn:not(:disabled):not(.disabled) {
    	cursor: pointer;
    	background: rgb(214, 223, 204);
		color: white;
	}


    /* 풀캘린더 */
    /* 전체적인 크기 */
    #calendar{
        height: 250px;
    }
    /* 달력제목 */
    #fc-dom-1{
        color: gray;
    }
    /*일자*/
    .fc-timeline-slot-cushion{
        color: gray;
        font-size:1em;
    }
    /*일정시간*/
    .fc-daygrid-event > .fc-event-time{
        color:#000;
    }
    /*시간제목*/
    .fc-daygrid-dot-event > .fc-event-title{
        color:#000 !important;
    }
    
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <jsp:include page="sidebar.jsp"/>
    
    <div id="content">
        <div id="con-title">
            <span>
                <h5>자산 예약 현황</h5>
            </span>
            <div class="dropdown">
			  	<button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown">
			    	회의실/빔프로젝터
			  	</button>
			  	<div class="dropdown-menu">
				    <a class="dropdown-item" href="main.re">회의실</a>
				    <a class="dropdown-item" href="beamProjectorMain.re">빔프로젝터</a>
			  	</div>
			</div>
        </div>
        <br>
        <div id="calendar" style="padding-left: 10px; width: 990px; height: 200px;">
            
        </div>
		<br>

        <div id="content-1">
            <h5>
                <span>내 예약/대여 현황</span>
            </h5>
            <table align="center" class="table table-hover table-sm">
                <thead>
                    <tr>
                        <th>자산</th>
                        <th>이름</th>
                        <th>예약시간</th>
                        <th>취소</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>빔프로젝터</td>
                        <td>1번 프로젝터</td>
                        <td>2023-02-27 13:00 ~ 2023-02-27 15:00</td>
                        <td>
                            <button onclick="" class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">취소</button>
                        </td>
                    </tr>
                    <tr>
                        <td>회의실</td>
                        <td>1번 회의실</td>
                        <td>2023-02-27 13:00 ~ 2023-02-27 15:00</td>
                        <td>
                            <button onclick="" class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">취소</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>


    <!-- myModal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">예약</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button> 
                </div>
                <br>
                <form action="insertReservationMeMain.re" method="post">
                
                <input type="hidden" name="resourceNo">
                
                <input type="hidden" name="reWriter" value="${ loginUser.empNo }">
                    <!-- Modal Body -->
                    <div style="margin: 20px;">
                        <table id="modal">
                            <tr style="height: 45px;">
                                <td style="width: 80px;">예약일</td>
                                <td>
                                    <input type="text" id="sDate" size="11" name="startDate">
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
                                    <input type="text" id="eDate" size="11" name="endDate">
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
                            <tr style="height: 45px;">
                            <td>목적</td>
                            <td colspan="6"><input type="text" name="rePurpose" size="60" placeholder=" 목적을 입력해주세요" required></td> 
                            </tr>
                        </table>
                    </div>
                    <br>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">확인</button>&nbsp;
                        <button type="button" class="btn btn-sm btn-light" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

	
    <!-- 타임라인 프리미엄 -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.4/index.global.min.js'></script>
    <script>
        // FullCalendar
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
                initialView: 'resourceTimeline', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                resourceAreaWidth: '20%', // 회의실 가로길이
                headerToolbar : { // 헤더에 표시할 툴 바
                    start : 'prev,next today',
                    center : 'title',
                    end : ''
                },
                resourceAreaColumns: [
                    {
                        field: 'title',
                        headerContent: '회의실'
                    },
                ],
                resources: [
                	<c:forEach var="rm" items="${ meList }">
                		{ id: '${ rm.resourceNo }', title: '${ rm.resourceName }'},
                    </c:forEach>
                ],
                select: function(info) { // 클릭&드래그
                    // 클릭한 날짜
                    const start = info.startStr;
                    const end = info.endStr;

                    var startDay = new Date(start); // 문자열로 변환하기 위한 작업
                    var sYear = startDay.getFullYear();
                    var sMonth = ('0' + (startDay.getMonth() + 1)).slice(-2);
                    var sDay = ('0' + startDay.getDate()).slice(-2);
                    var sHour = ('0' + startDay.getHours()).slice(-2);
                    var sMinites = ('0' + startDay.getMinutes()).slice(-2);

                    // 첫번째 선택된 날짜 문자열 반환
                    const yymmddStart = sYear + '-' + sMonth  + '-' + sDay;
                    const hhmmStart = sHour + ":" + sMinites;

                    var endDay = new Date(end); // 문자열로 변환하기 위한 작업
                    var eYear = endDay.getFullYear();
                    var eMonth = ('0' + (endDay.getMonth() + 1)).slice(-2);
                    var eDay = ('0' + endDay.getDate()).slice(-2);
                    var eHour = ('0' + endDay.getHours()).slice(-2);
                    var eMinites = ('0' + endDay.getMinutes()).slice(-2);

                    // 두번째 선택된 날짜 문자열 반환
                    const yymmddEnd = eYear + '-' + eMonth + '-' + eDay;
                    const hhmmEnd = eHour + ":" + eMinites;
               

                    // 오늘 날짜
                    var date = new Date();
                    var year = date.getFullYear();
                    var month = ('0' + (date.getMonth() + 1)).slice(-2);
                    var day = ('0' + date.getDate()).slice(-2);
                    var Hour = ('0' + date.getHours()).slice(-2);
                    var Minites = ('0' + date.getMinutes()).slice(-2);
                    // 문자열 반환
                    const tDate = year + '-' + month  + '-' + day;
                    const tHhmm = Hour + ":" + Minites;

                    //console.log("체크날짜" + yymmddStart);
                    //console.log("오늘 날짜" + tDate);
                    console.log(hhmmStart);
                    //console.log(tHhmm);
                    console.log(hhmmEnd);

                    if(yymmddStart > tDate) { // 오늘 날짜 이후 선택시
                    	
                    	$("input[name=resourceNo]").val(info.resource.id); // info.resource.id : 해당 이벤트 아이디 반환해줌
                    	//console.log($("input[name=resourceNo]").val());
                		$("#myModal").modal("show");
                		
                        // option태그의 value값이 선택된 시간과 같은 경우 selected(선택)되도록!
                        $("#sel1").val(hhmmStart).prop("selected", true);
                        $("#sel2").val(hhmmEnd).prop("selected", true);

                        $("#sDate").datepicker("setDate", yymmddStart);
                        $("#eDate").datepicker("setDate", yymmddEnd);
                    }else if(yymmddStart < tDate) { // 오늘 날짜 이전 선택시
                    	alert("예약 불가능한 날짜");
                    }else if(hhmmStart < tHhmm) { // 오늘 날짜에서 지나간 시간 선택시
                        alert("예약 불가능한 시간");
                    }else{
                        
                    	$("input[name=resourceNo]").val(info.resource.id); // info.resource.id : 해당 이벤트 아이디 반환해줌
                    	//console.log($("input[name=resourceNo]").val());
                		$("#myModal").modal("show");

                        // option태그의 value값이 선택된 시간과 같은 경우 selected(선택)되도록!
                        $("#sel1").val(hhmmStart).prop("selected", true);
                        $("#sel2").val(hhmmEnd).prop("selected", true);

                        $("#sDate").datepicker("setDate", yymmddStart);
                        $("#eDate").datepicker("setDate", yymmddEnd);
                    }
                    /*
                    $("#myModal").modal("show");
                    alert('selected ' + info.startStr + ' to ' + info.endStr); // Date 타입으로 반환되는걸 확인
                    const start = info.startStr;
                    const end = info.endStr;
                 
                    var endDay = new Date(end);
                    var year = endDay.getFullYear();
                    var month = ('0' + (endDay.getMonth() + 1)).slice(-2);
                    var day = ('0' + endDay.getDate()).slice(-2) -1;

                    var endDayStr = year + '-' + month  + '-' + (day < 10 ? "0" + day : day);

                    //console.log(start);
                    //console.log(endDayStr);
                    $("#sDate").datepicker("setDate", start);
                    $("#eDate").datepicker("setDate", endDayStr);
                    */
                },
                //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
                allDaySlot: false, // allDay 여부 (default : true)
                slotMinTime: "08:00:00", // 최소시간
                slotMaxTime: "23:00:00", // 최대시간 (23시까지만 화면에 보여짐)
                selectable : true, // 달력 일자 드래그 설정가능
                droppable : true,
                editable : true,
                nowIndicator: true, // 현재 시간 마크
                eventLimit: true, // 달력상에 셀 크기보다 많은 이벤트가 등록되어 있는 경우 'more' 표기
                locale: 'ko' // 한국어 설정
            });
            calendar.render();
        });


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

            //$("#sDate").datepicker("setDate", "today");
            //$("#eDate").datepicker("setDate", "+7");

            
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
            } else {
                $(".sel").attr("hidden", false);
            }
        }

        // 전사일정 체크 확인
        function showHidden(){
            if($("input:checkbox[id='company']").is(":checked") == true) {
                $(".body").attr("hidden", true);    
            } else {
                $(".body").attr("hidden", false);
            }
        }
    </script>
    
        
</body>
</html>