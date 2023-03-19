<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content{
        border-left: 1px solid lightgray;
        width: 1000px;
        float: left;
        box-sizing: border-box;
    }

    #con-title h5{
    	color:rgb(93, 109, 75);
        padding-left: 10px;
        padding-top: 12px;
        float: left		!important;
    }
    .input-group{
        margin-left: 750px;
        width: 250px	!important;
        height: 30px;
        padding-top: 10px;
    }
    
    button[type=submit]{
    	border: none;
    	background: rgb(214, 223, 204);
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

    #modal select[id="sel3"]{
        width: 140px;
        height: 35px;
        margin-top: 15px;
    }

    
    
    /* 풀캘린더 */
    /* 요일 */
    .fc-col-header-cell-cushion {
        color: gray;
    }
    #fc-dom-1 {
	    color: gray;
	}
    .fc-col-header-cell-cushion:hover {
        text-decoration: none;
        color: gray;
    }
    /*일자*/
    .fc-daygrid-day-number{
        color: gray;
        font-size:1em;
    }
    /*more버튼*/ 
    .fc-daygrid-more-link.fc-more-link{
        color: #000;
    }
    /*일정시간*/
    .fc-daygrid-event > .fc-event-time{
        color:#000;
    }
    /*시간제목*/
    .fc-daygrid-dot-event > .fc-event-title{
        color:#000 !important;
    }
    /*month/week/day*/
    .fc-button-active{
        border-color: rgb(214, 223, 204)       !important;
        background-color: rgb(214, 223, 204) 	!important;
        color: white 				            !important;
        font-weight: bold 			             !important;
    }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

    <jsp:include page="sidebar.jsp"/>

	<div id="content">
        <div id="con-title">
            <span>
                <h5>일정 목록</h5>
            </span>
            <form action="">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="검색어를 입력해주세요" required>
                    <div class="input-group-append">
                        <button class="btn btn-secondary" type="submit">검색</button>
                    </div>
                </div>
            </form>
        </div>
        <br>
        <div id="calendar" style="padding-left: 10px; width: 1000px;">
        
        </div>
    </div>


    <!-- 일정 등록 모달 -->
    <!-- myModal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">일정 등록</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button> 
                </div>
                <form action="일정등록" method="post">
                    <!-- Modal Body -->
                    <div style="margin: 20px;">
                        <table id="modal">
                            <thead>
                                <tr height="55">
                                    <th width="85">일정명</th>
                                    <td colspan="2">
                                        <input type="text" name="" size="80" placeholder=" 추가할 일정을 입력하세요" required>
                                    </td>
                                </tr>
                                <tr height="55">
                                    <th>일시</th>
                                    <td colspan="2">
                                        <input type="text" id="sDate" size="10" name="" value="">
                                        <span>
                                            <select class="sel" name="" id="sel1">
                                                <option value="00:00">00:00</option>
                                                <option value="00:30">00:30</option>
                                                <option value="01:00">01:00</option>
                                                <option value="01:30">01:30</option>
                                                <option value="02:00">02:00</option>
                                                <option value="02:30">02:30</option>
                                                <option value="03:00">03:00</option>
                                                <option value="03:30">03:30</option>
                                                <option value="04:00">04:00</option>
                                                <option value="04:30">04:30</option>
                                                <option value="05:00">05:00</option>
                                                <option value="05:30">05:30</option>
                                                <option value="06:00">06:00</option>
                                                <option value="06:30">06:30</option>
                                                <option value="07:00">07:00</option>
                                                <option value="07:30">07:30</option>
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
                                                <option value="23:30">23:30</option>
                                            </select>
                                        </span>
                                        <span>~</span>
                                        <input type="text" id="eDate" size="11" name="" value="">
                                        <span>
                                            <select class="sel" name="" id="sel2">
                                                <option value="00:00">00:00</option>
                                                <option value="00:30">00:30</option>
                                                <option value="01:00">01:00</option>
                                                <option value="01:30">01:30</option>
                                                <option value="02:00">02:00</option>
                                                <option value="02:30">02:30</option>
                                                <option value="03:00">03:00</option>
                                                <option value="03:30">03:30</option>
                                                <option value="04:00">04:00</option>
                                                <option value="04:30">04:30</option>
                                                <option value="05:00">05:00</option>
                                                <option value="05:30">05:30</option>
                                                <option value="06:00">06:00</option>
                                                <option value="06:30">06:30</option>
                                                <option value="07:00">07:00</option>
                                                <option value="07:30">07:30</option>
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
                                                <option value="23:30">23:30</option>
                                            </select>
                                        </span>
                                        &nbsp;
                                        <div class="custom-control custom-checkbox" style="display: inline-block;">
                                            <input type="checkbox" class="custom-control-input" name="allDay" value="" id="allDay" onclick="allDayShowHidden();">
                                            <label class="custom-control-label" for="allDay">종일</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr height="55">
                                    <th>전사일정</th>
                                    <td colspan="2">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" name="company" id="company" onclick="showHidden();">
                                            <label class="custom-control-label" for="company">전사일정</label>
                                        </div>
                                    </td>
                                </tr>
                            </thead>
                            <tbody class="body">
                                <tr height="55">
                                    <th>내 캘린더</th>
                                    <td colspan="2">
                                        <select class="custom-select mb-3" name="calNo" id="sel3">
                                        	<c:forEach var="c" items="${ myCalList }">
                                        		<c:choose>
                                        			<c:when test="${ c.calDefault eq 'Y' }">
                                        				<option value="${ c.calTitle }">(기본) ${ c.calTitle }</option>
                                        			</c:when>
                                        			<c:otherwise>
                                        				<option value="${ c.calTitle }">${ c.calTitle }</option>
                                        			</c:otherwise>
                                        		</c:choose>
                                       		</c:forEach>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr height="55">
                                    <th>장소</th>
                                    <td colspan="2">
                                        <input type="text" name="" size="80" placeholder=" 장소를 입력하세요" required>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <br>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <a href="" class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">일정상세 입력</a>&nbsp;
                        <button type="submit" class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">확인</button>&nbsp;
                        <button type="button" id="close" class="btn btn-sm btn-light" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    
    <script>
    	
    	$(".close").click(function(){
    		$("#myModal").modal("hide");
    	})
    	$("#close").click(function(){
    		$("#myModal").modal("hide");
    	})
    	
        // FullCalendar
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                headerToolbar : { // 헤더에 표시할 툴 바
                    start : 'prev,next today',
                    center : 'title',
                    end : 'dayGridMonth,dayGridWeek,dayGridDay'
                },
                /*
                dateClick: function(info) {
                    $("#myModal").modal("show");
                    const dStart = info.dateStr;
                    $("#sDate").datepicker("setDate", dStart);
                    $("#eDate").datepicker("setDate", dStart);
                },
                */
                select: function(info) {
                    $("#myModal").modal("show");
                    /*alert('selected ' + info.startStr + ' to ' + info.endStr);*/
                    const start = info.startStr;
                    const end = info.endStr;
                    // 끝나는 날짜가 +1로 나와서 -1해줘야함
                    // 그래서 String타입을 Date타입으로 변경해서 -1 해줌
                    // -1 해주니까 한 자리수 날짜일 경우 01이 아닌 1이라고 떠서 삼항연산자로 한 자리수 일때만 "0" 붙임
                    
                    var endDay = new Date(end);
                    var year = endDay.getFullYear();
                    var month = ('0' + (endDay.getMonth() + 1)).slice(-2);
                    var day = ('0' + endDay.getDate()).slice(-2) -1;

                    var endDayStr = year + '-' + month  + '-' + (day < 10 ? "0" + day : day);

                    //console.log(start);
                    //console.log(endDayStr);
                    $("#sDate").datepicker("setDate", start);
                    $("#eDate").datepicker("setDate", endDayStr);

                    // 지금 시간
                    var date = new Date();
                    var Hour = ('0' + date.getHours()).slice(-2);
                    var Minites = ('0' + date.getMinutes()).slice(-2);

                    console.log(Hour);
                    console.log(Minites);

                    if(Minites >= 30) { // 지금 시간이 30분 이상이면
                        $("#sel1").val(Hour + ":" + "30").prop("selected", true);
                        $("#sel2").val(Hour + ":" + "30").prop("selected", true);
                    }else{ // 30분 미만이라면
                        $("#sel1").val(Hour + ":" + "00").prop("selected", true);
                        $("#sel2").val(Hour + ":" + "00").prop("selected", true);
                    }
                },
                /*
                eventDrop: function(info) {
                    $("#myModal").modal("show"); //이벤트 드래그드랍 시 모달 호출
                },
                */
                //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
                selectable : true, // 달력 일자 드래그 설정가능
                droppable : true,
                editable : true,
                nowIndicator: true, // 현재 시간 마크
                eventLimit: true, // 달력상에 셀 크기보다 많은 이벤트가 등록되어 있는 경우 'more' 표기
                locale: 'ko', // 한국어 설정
                events: [
                    {
                        title: 'ㅎㅇㅎㅇ',
                        start: '2023-03-05 14:20',
                        end: '2023-03-05 15:20'
                    }
                ]
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
                //minDate: "D" // 일정에서는 minDate속성 필요없음!!
            });

            /*
            $("#sDate").datepicker("setDate", "today");
            $("#eDate").datepicker("setDate", "+7");
            */

            
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
                $("#sel1").val("00:00"); // 시간 값 00:00시부터
                $("#sel2").val("23:30"); // 23:30시까지
                $("input[name=allDay]").val("Y");
            } else {
            	//console.log($("input:checkbox[id='allDay']").prop("checked", false));
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