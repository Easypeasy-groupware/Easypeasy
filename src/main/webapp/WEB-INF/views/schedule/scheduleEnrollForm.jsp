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
        padding-left: 25px;
        padding-top: 15px;
        float: left;
    }

    #enroll{
        width: 95%;
        margin: auto;
    }
    #enroll input{
        border: 1px solid lightgray;
        border-radius: 5px;
    }
    #enroll textarea{
        border: 1px solid lightgray;
        border-radius: 5px;
    }
    #enroll button[type=reset]{
        border: 1px solid lightgray;
    }

    .sel{
        height: 28px;
        border: 1px solid lightgray;
        border-radius: 5px;
    }

    #sel3{
        width: 130px;
        height: 35px;
        margin-top: 15px;
    }
    
    
    
    /* 참석자 선택 모달 */
    /* 모달 창 가운데로 정렬*/
    .modal.modal-center {
    	/* text-align: center; */
    }

    @media screen and (min-width: 768px) { 
	    .modal.modal-center:before {
	        display: inline-block;
	        vertical-align: middle;
	        content: " ";
	        height: 30%;
	    }
    } 

    .modal-dialog.modal-center {
	    display: inline-block;
	    text-align: left;
	    vertical-align: middle; 
    }
    .moal{z-index:10000;
    	/* z-index: 2147483647; */
    }
    
    .selectForm>div{width:50%; float:left;}
        .appLine>div{float:left;}
        .appLine1, .appLine2{width:50%;}
        .appLine1 *,.appLine2 *{list-style:none;}
        .app-comment{padding:10px;}  
        
     /* 문서목록 스타일 */        
     .list-1{width:100%; height:60px;}
     .list-1{
         text-align:right;
         width:100%; 
         padding:15px;
         margin-right: 10px; 
         font-size:13px;
        
     }
     .list1-1{height:40px;}
     #paging{text-align: center; display: inline-block; padding-left :0;}
     #paging li {text-align: center; float: left; list-style:none; border-radius:10px; margin:2px; background-color: rgb(234, 234, 234);}
     #paging li a {display: block; font-size: 12px; color: black; padding: 5px 10px; box-sizing: border-box; text-decoration-line:none;}
     #paging li.on {background:rgb(166, 184, 145);}
     #paging li.on a { color: white;}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

    <jsp:include page="sidebar.jsp"/>

	<div id="content">
        <div id="con-title">
            <span>
                <h5>일정 등록</h5>
            </span>
        </div>
        <br><br>
        <hr>
        <div id="content-1">
            <form action="" method="post">
                <table id="enroll">
                    <thead>
                        <tr style="height: 45px;">
                            <td colspan="3">
                                <input type="text" name="" size="82" placeholder=" 추가할 일정을 입력하세요" required>
                            </td>
                        </tr>
                        <tr style="height: 45px;">
                            <td colspan="3">
                                <input type="text" id="sDate" size="11" name="">
                                <span>
                                    <select class="sel" name="" id="sel1">
                                        <option value="">00:00</option>
                                        <option value="">00:30</option>
                                        <option value="">01:00</option>
                                        <option value="">01:30</option>
                                        <option value="">02:00</option>
                                        <option value="">02:30</option>
                                        <option value="">03:00</option>
                                        <option value="">03:30</option>
                                        <option value="">04:00</option>
                                        <option value="">04:30</option>
                                        <option value="">05:00</option>
                                        <option value="">05:30</option>
                                        <option value="">06:00</option>
                                        <option value="">06:30</option>
                                        <option value="">07:00</option>
                                        <option value="">07:30</option>
                                        <option value="">08:00</option>
                                        <option value="">08:30</option>
                                        <option value="">09:00</option>
                                        <option value="">09:30</option>
                                        <option value="">10:00</option>
                                        <option value="">10:30</option>
                                        <option value="">11:00</option>
                                        <option value="">11:30</option>
                                        <option value="">12:00</option>
                                        <option value="">12:30</option>
                                        <option value="">13:00</option>
                                        <option value="">13:30</option>
                                        <option value="">14:00</option>
                                        <option value="">14:30</option>
                                        <option value="">15:00</option>
                                        <option value="">15:30</option>
                                        <option value="">16:00</option>
                                        <option value="">16:30</option>
                                        <option value="">17:00</option>
                                        <option value="">17:30</option>
                                        <option value="">18:00</option>
                                        <option value="">18:30</option>
                                        <option value="">19:00</option>
                                        <option value="">19:30</option>
                                        <option value="">20:00</option>
                                        <option value="">20:30</option>
                                        <option value="">21:00</option>
                                        <option value="">21:30</option>
                                        <option value="">22:00</option>
                                        <option value="">22:30</option>
                                        <option value="">23:00</option>
                                        <option value="">23:30</option>
                                    </select>
                                </span>
                                <span>~</span>
                                <input type="text" id="eDate" size="11" name="">
                                <span>
                                    <select class="sel" name="" id="sel2">
                                        <option value="">00:00</option>
                                        <option value="">00:30</option>
                                        <option value="">01:00</option>
                                        <option value="">01:30</option>
                                        <option value="">02:00</option>
                                        <option value="">02:30</option>
                                        <option value="">03:00</option>
                                        <option value="">03:30</option>
                                        <option value="">04:00</option>
                                        <option value="">04:30</option>
                                        <option value="">05:00</option>
                                        <option value="">05:30</option>
                                        <option value="">06:00</option>
                                        <option value="">06:30</option>
                                        <option value="">07:00</option>
                                        <option value="">07:30</option>
                                        <option value="">08:00</option>
                                        <option value="">08:30</option>
                                        <option value="">09:00</option>
                                        <option value="">09:30</option>
                                        <option value="">10:00</option>
                                        <option value="">10:30</option>
                                        <option value="">11:00</option>
                                        <option value="">11:30</option>
                                        <option value="">12:00</option>
                                        <option value="">12:30</option>
                                        <option value="">13:00</option>
                                        <option value="">13:30</option>
                                        <option value="">14:00</option>
                                        <option value="">14:30</option>
                                        <option value="">15:00</option>
                                        <option value="">15:30</option>
                                        <option value="">16:00</option>
                                        <option value="">16:30</option>
                                        <option value="">17:00</option>
                                        <option value="">17:30</option>
                                        <option value="">18:00</option>
                                        <option value="">18:30</option>
                                        <option value="">19:00</option>
                                        <option value="">19:30</option>
                                        <option value="">20:00</option>
                                        <option value="">20:30</option>
                                        <option value="">21:00</option>
                                        <option value="">21:30</option>
                                        <option value="">22:00</option>
                                        <option value="">22:30</option>
                                        <option value="">23:00</option>
                                        <option value="">23:30</option>
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
                        <tr style="height: 45px;">
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
                        <tr style="height: 45px;">
                            <th>참석자</th>
                            <td width="150">
                            	<span style="background: rgb(238, 238, 238); border-radius: 15px; padding: 2px 10px 2px 10px;">${ loginUser.empName } ${ loginUser.jobName }</span>
                            	<span class="app-body"></span>
                            </td>
                            <td class="attendee-click">
                                <a style="color: gray; cursor: pointer;" data-toggle="modal" data-target="#attendee-add">+ 참석자 선택</a>
                            </td>
                        </tr>
                        <tr>
		                    <td></td>
		                    <td colspan="2" id="empList-td">
		                        <div class="empBox" style="width:100%; display:none;">
		                            <div class="empBox-mini emp-mini1">
		                            	<div style="background-color:white; width:100%; height:10px; top:0; position:sticky;"></div>
		                                <input type="text" id="search-emp">
		                                <br><br>
		                                <table class="list-show">	
		                                	<tbody id="show-tbd">
		                                	</tbody>
		                                </table>
		                            </div>
		                            <div class="empBox-mini emp-mini2"></div>
		                        </div>
		                    </td>
		                </tr>
                    </tbody>
                    <tfoot>
                        <tr style="height: 55px;">
                            <th>장소</th>
                            <td colspan="2">
                                <input type="text" name="" size="70" placeholder=" 장소를 입력하세요" required>
                            </td>
                        </tr>
                        <tr style="height: 50px;">
                            <th style="vertical-align: top; padding-top: 10px;">내용</th>
                            <td colspan="2" style="padding-top: 15px; padding-bottom: 20px;">
                                <textarea name="" cols="69" rows="5" style="resize: none;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <button class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">확인</button>&nbsp;&nbsp;
                                <button type="reset" class="btn btn-sm btn-light">취소</button>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </form>
        </div>
    </div>

    <!-- 달력 -->
    <script>
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

            $("#sDate").datepicker("setDate", "today");
            $("#eDate").datepicker("setDate", "today");

           
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
    
 
 
 
    <!-- 결재선 선택하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="attendee-add">
        <div class="modal-dialog">
	        <div class="modal-content">
	    
	            <!-- Modal Header -->
	            <div class="modal-header">
	            <h4 class="modal-title">참석자 선택</h4>
	            <button type="button" class="close" data-dismiss="modal">&times;</button>
	            </div>
	    
	            <!-- Modal body -->
	            <div class="modal-body appLine">
	                <div class="appLine1">
	                <c:forEach var="d" items="${deptList}" begin="0" end="5" varStatus="dept">
	                	<div>
                            <b class="${ d.deptCode }">${ d.deptName }</b>
                            <span><img src="resources/common_images/list-down.png" style="width:15px;" class="dropdown-key exlist-key${ dept.index }"></span>
                        </div>
	                    <ul class="empList">
	                    	<c:forEach var="e" items="${list}">
	                    		<c:if test="${ e.deptName eq d.deptName }">
			                       <li id="appEmp${ e.empNo }" class="appEmp">
			                            <span class="indiv-job">${e.jobName}</span> <span class="indiv-name">${ e.empName }</span>
			                            <input type="hidden" name="empNo" value="${e.empNo}">
			                            <button class="btn btn-outline-secondary addbtn">+</button>
			                       </li>
	                       		</c:if>
	                       	</c:forEach>
	                    </ul>
	                </c:forEach>
	                </div>
	                <div class="appLine2">
	                    <form action="">
	                        <h5>참석자</h5>
	                        <div class="appArea">
	                            <ul class="appList">
	
	                            </ul>
	                        </div>
	                    </form>                    
	                </div>
	            </div>
	    
	            <!-- Modal footer -->
	            <div style="margin:auto;">
	                <button type="button" onclick="copyApp();" class="btn btn-light" data-dismiss="modal" data-toggle="modal" data-target="#ref-line">확인</button>
	                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
	            </div>
	    		<br>
	        </div>
        </div>
    </div>

    <script>

        // 조직도에서 결재선 직원 요소 추가하는 구문
        var appE = document.querySelectorAll(".empList .addbtn");

        for (var i = 0; i < appE.length; i++) {
            appE[i].addEventListener("click", click1);
        }
 
        function click1(){

            let emp = $(this).parents("li");
            
                emp.clone(true).appendTo(".appList"); 
               
                $(".appList button").text('-');
                $(this).attr("disabled", true);
                delApp();            
        }
            
        function delApp(){

            // 추가된 결재선 직원을 다시 삭제하는 구문
            var appD = document.querySelectorAll(".appList .addbtn");
            for (var i = 0; i < appD.length; i++) {
                appD[i].addEventListener("click", click2);
            }

            function click2(){

                let del = $(this).parents("li");
                del.remove(); 

                // 선택했던 추가버튼 다시 활성화 시키기
                const bList = document.querySelectorAll(".empList input");

                for(var i = 0; i < bList.length; i++){

                    if($(this).siblings("input").val() == bList[i].value){

                        bList[i].nextElementSibling.removeAttribute("disabled");
                    }
                }

            }

        }
        

        
		function copyApp(){
        	

        	const arr1 = $(".appList .appEmp").children("input");
        	const arr2 = $(".appList .appEmp").children("span").text();
        	
        	console.log($(".appList .appEmp").children("input"));
        	
        	const arrSlice = arr2.slice();
        	console.log(arrSlice);
        	
        	let val = "";
        	for(var i = 0; i < arr1.length; i++){
        		
        		val+= "<span style='background: rgb(238, 238, 238); border-radius: 15px; padding: 2px 10px 2px 10px; margin-right: 10px;'>"
        			+ 
        			+ "</span>";
        	}
        	$(".app-body").html(val);
        	
        	console.log($(".appList .appEmp").children("span").text();
        }
    </script>

</body>
</html>