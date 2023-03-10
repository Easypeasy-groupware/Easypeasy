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
    
    .outer{
        width: 1200px;
        height: 1000px;
        margin: auto;
    }
    
    #content{
        border-left: 1px solid lightgray;
        width: 1000px;
        float: left;
        box-sizing: border-box;
    }

    #sidebar{
        width: 200px;
        float: left;
        padding-left: 10px;
        padding-top: 10px;
    }
    #sidebar a{
        color: black;
        text-decoration: none;
    }

    #title h5{
        padding-left: 25px;
        padding-top: 10px;
        display: inline-block;
    }
    #title>select{
        width: 110px;
        height: 28px;
        margin-left: 720px;
        display: inline-block;
    }

    #content-1>h5{
        margin-left: 25px;
        padding-top: 20px;
    }
    #content-1>table{
        width: 950px;
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
        <div id="title">
            <span>
                <h5>자산 예약 현황</h5>
            </span>
            <select class="form-control btn-sm" name="" id="">
                <option value="">회의실</option>
                <option value="">빔프로젝터</option>
            </select>
        </div>
        <br>
        <div id="calendar" style="height: 200px;">
            
        </div>

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
                <form action="예약등록" method="post">
                    <!-- Modal Body -->
                    <div style="margin: 20px;">
                        <table id="modal">
                            <tr style="height: 45px;">
                                <td style="width: 80px;">예약일</td>
                                <td>
                                    <input type="text" id="sDate" size="11" name="">
                                    <span>
                                        <select class="sel" name="" id="sel1">
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
                                            <option value="24:00">24:00</option>
                                        </select>
                                    </span>
                                    <span>~</span>
                                    <input type="text" id="eDate" size="11" name="">
                                    <span>
                                        <select class="sel" name="" id="sel2">
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
                                            <option value="24:00">24:00</option>
                                        </select>
                                    </span>
                                    &nbsp;
                                    <div class="custom-control custom-checkbox" style="display: inline-block;">
                                        <input type="checkbox" class="custom-control-input" name="" id="allDay" onclick="allDayShowHidden();">
                                        <label class="custom-control-label" for="allDay">종일</label>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 45px;">
                            <td>목적</td>
                            <td colspan="6"><input type="text" name="" size="60" placeholder=" 목적을 입력해주세요" required></td> 
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
        var arr = ["gg", "dd"];
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
                    { id: 'a', title: 'A회의실(20명)'},
                    { id: 'b', title: 'B회의실(15명)'},
                    { id: 'c', title: 'C회의실(6명)'}
                ],
                /*
                dateClick: function(info) { // 클릭

                    // 클릭한 날짜
                    const dStart = info.dateStr;
                    //console.log(dStart); // Date 타입으로 반환되는걸 확인

                    // 선택한 시간
                    var selectDate = new Date(dStart); // 문자열로 변환하기 위한 작업
                    var selectYear = selectDate.getFullYear();
                    var selectMonth = ('0' + (selectDate.getMonth() + 1)).slice(-2);
                    var selectDay = ('0' + selectDate.getDate()).slice(-2);
                    var selectHour = ('0' + selectDate.getHours()).slice(-2);
                    var selectMinites = ('0' + selectDate.getMinutes()).slice(-2);
                    // 30분 더하는거 계산하기위해 따로 변수에 저장
                    var selectHour2 = (selectDate.getHours()+1);
                    var selectMinites2 = (selectDate.getMinutes()+30);

                    //var dayStr = year + '-' + month  + '-' + day + " " + hour + ":" + minites;
                    //console.log(dayStr);
                    // 문자열 반환
                    const yymmddSelect = selectYear + "-" + selectMonth + "-" + selectDay;
                    const hhmmSelect = selectHour + ":" + selectMinites;

                    // 지금 시간
                    var date = new Date();
                    var Hour = ('0' + date.getHours()).slice(-2);
                    var Minites = ('0' + date.getMinutes()).slice(-2);
                    // 문자열 반환
                    const hhmmToday = Hour + ":" + Minites;

                    //console.log(selectHhmm);
                    //console.log(thhmm);

                    if(hhmmSelect < hhmmToday){
                        alert("예약 불가능한 시간");
                    }else{
                        $("#myModal").modal("show");

                        // 선택한 시간에서 30분 더해서 기본적으로 sel2에 보여줄거임
                        // 조건문으로 조건마다 다르게 들어갈 시간
                        const hhmmEnd1 = selectHour + ":" + selectMinites2; // 분이 30분이 아니라 00분일 경우
                        const hhmmEnd2 = (selectHour2 < 10 ? "0" + selectHour2 : selectHour2) + ":" + "00"; // 분이 30분일 경우

                        console.log(hhmmEnd1);
                        console.log(hhmmEnd2);
                       

                        // option태그의 value값이 선택된 시간과 같은 경우 selected(선택)되도록!
                        $("#sel1").val(hhmmSelect).prop("selected", true);

                        if(selectMinites == 30){
                            $("#sel2").val(hhmmEnd2).prop("selected", true);  
                        }else{
                            $("#sel2").val(hhmmEnd1).prop("selected", true);
                        }

                        $("#sDate").datepicker("setDate", yymmddSelect);
                        $("#eDate").datepicker("setDate", yymmddSelect);
                        
                    }
                },
                */
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
                    //console.log(hhmmStart);
                    //console.log(tHhmm);

                    if(yymmddStart > tDate) { // 오늘 날짜 이후 선택시
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
                slotMaxTime: "24:00:00", // 최대시간 (23시까지만 화면에 보여짐)
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