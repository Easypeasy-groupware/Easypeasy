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
    .outer{
        width: 1200px;
        margin: auto;
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
        float: left;
        margin-left:10px;
    }
    #calendar{
        float: left;
        width: 900px;
        
    }
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!--Popper JS --> 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!— fullcalendar css —>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!— fullcalendar 언어 설정관련 script —>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

    <div id="main">


        <div class="side"><jsp:include page="../commute/commuteSidebar.jsp"/></div>

        <div class="allContent">

            <div class="title"><b>근무현황 및 계획</b><hr></div>

            <div id='calendar'></div>

            <script>
                
            document.addEventListener('DOMContentLoaded', function() {
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                    headerToolbar : { // 헤더에 표시할 툴 바
                        start : 'prev next today',
                        center : 'title',
                        end : 'dayGridMonth,dayGridWeek,dayGridDay'
                    },
                    

                    titleFormat : function(date) {
                        return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
                    },
                    //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
                    selectable : true, // 달력 일자 드래그 설정가능
                    droppable : true,
                    editable : true,
                    nowIndicator: true, // 현재 시간 마크
                    locale: 'ko', // 한국어 설정
                    events: [
                        <c:forEach var="c" items="${ list }">
                       	{ 
                       	  start: '${ c.enrollDate }', 
                       	  end: '${ c.enrollDate }', 
                       	  title: '근무시간: ${ c.workTime }',
                       	  color: 'rgb(166, 184, 145)',
                       	  sortIdx: 2,
                       	  
                       	   },
                       </c:forEach>

                            <c:forEach var="c" items="${ list }">
                               	{ 
                               	  start: '${ c.enrollDate }', 
                               	  end: '${ c.enrollDate }', 
                               	  title: ' 퇴근: ${ c.endTime }',
                                  color: 'rgb(185, 187, 221)',
                                  sortIdx: 1,
                               	   },
                               	   
                             </c:forEach>
                             <c:forEach var="c" items="${ list }">
                            	{ 
                            	  start: '${ c.enrollDate }', 
                            	  end: '${ c.enrollDate }', 
                            	  title: '출근: ${ c.startTime }',
                            	  color: 'rgb(185, 187, 221)',
                            	  sortIdx: 0,
                            	   },
                            </c:forEach>

                        ],
                    eventOrder: 'sortIdx',
                });
                calendar.render();
            });
        </script>


        </div>

    </div>


    

</body>
</html>