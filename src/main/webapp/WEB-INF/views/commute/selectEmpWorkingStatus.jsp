<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
    .img{
        width: 100px;
        height: 100px;
        
        margin: 40px;
        border: 1px solid gray;
        float: left;
        border-radius: 150px;
    }
    .name{
        margin-top: 80px;
        float: left;
        font-weight: bold;
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

	    


        <div class="side"><jsp:include page="../commute/HRsidebar.jsp"/></div>

        <div class="allContent">

            <div class="title"><b>근무시간 확인/수정</b><hr></div>
            
            <div class="profile">
                <img  class="img" id="profileImg" src="<c:out value='${ clickEmp.empProfile }' default='resources/profile_images/default_profile.png' />" >
               
                
            </div>
            <div class="name">${ clickEmp.empName }님</div>

            <div id='calendar'></div>
            
            <!-- 근무시간 수정 모달 -->
            <div class="modal fade" id="updateTimeForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
       			 aria-hidden="true">
        	<div class="modal-dialog modal-lg" role="document">
            
            <div class="modal-dialog">
              <div class="modal-content">
          
                <div class="modal-header">
                  <h4 class="modal-title">근무시간 수정</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body" align="center">
                  <form action="updateTime.HR" method="post">
                     <input type="hidden" name="empNo" value="${ clickEmp.empNo }">
                     <table>
                        <tr>
                           <td>출근시간 : </td>
                           <td><input type="text" name="startTime" required></td>
                        </tr>
                        <tr>
                           <td>퇴근시간 : </td>
                           <td><input type="text" name="endTime" required></td>
                        </tr>
                     </table>
                     <br>
                     <button type="submit" class="btn btn-sm btn-secondary" >수정</button>
                     <button type="reset" class="btn btn-sm btn-secondary">취소</button>
                  </form>

                </div>
          
              </div>
            </div>
         
          </div>
          </div>

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
                               	  title: ' 퇴근: ${ c.endTime }',
                               	  
                               	   },
                               </c:forEach>
                               	<c:forEach var="c" items="${ list }">
                            	{ 
                            	  start: '${ c.enrollDate }', 
                            	  end: '${ c.enrollDate }', 
                            	  title: '출근: ${ c.startTime }',
                            	  
                            	   },
                            </c:forEach>
                        ],
                    eventClick: function(info){
                    	$("#updateTimeForm").modal("show");
                    },
                    
                    select: function(info){
                        // 클릭한 날짜
                        const start = info.startStr;
                        const end = info.endStr;

                        var startDay = new Date(start); // 문자열로 변환하기 위한 작업
                        var sYear = startDay.getFullYear();
                        var sMonth = ('0' + (startDay.getMonth() + 1)).slice(-2);
                        var sDay = ('0' + startDay.getDate()).slice(-2);
                        console.log("오늘 날짜" + startDay);
                    }
                    
                });
                calendar.render();
            });
            
      
        </script>
        
        


        </div>

	

</body>
</html>