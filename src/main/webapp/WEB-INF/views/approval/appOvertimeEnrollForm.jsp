<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>

        .form-outer{ 
            width:1000px;
            margin:auto;
            float:left;
            box-sizing: border-box;
        }
        .form-outer>div{float:left;}
        .left-outer{width:100%;  padding:30px;} 
        .left-form3 table{float:left;}
        .left-form1, .left-form2 ,.left-form3,.left-form4,.left-form5,.left-form6{width:100%;}
        .speech-bubble {
            position: relative;
            background: #d1d2d2;
            border-radius: .4em;
        }

        .speech-bubble:after {
            content: '';
            position: absolute;
            top: 0;
            left: 50%;
            width: 0;
            height: 0;
            border: 20px solid transparent;
            border-bottom-color: #d1d2d2;
            border-top: 0;
            border-left: 0;
            margin-left: -10px;
            margin-top: -20px;
        } 
    </style>        
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="appMenubar.jsp" />
    <div class="form-outer">
        <div class="left-outer">
            <div class="left-form1">
                <p><b style="font-size:30px;">연장근무신청서</b></p>
            </div>
            <div class="left-form2"><a href=""  data-toggle="modal" data-target="#send-approval" style="padding:20px; color:rgb(71, 71, 71);">결재요청</a>|
                                    <a href="" style="padding:20px; color:rgb(71, 71, 71);">임시저장</a>|
                                    <a href="" style="padding:20px; color:rgb(71, 71, 71);">취소</a>|
                                    <a href="" style="padding:20px; color:rgb(71, 71, 71);"  data-toggle="modal" data-target="#app-line">결재선지정</a>
                                    <br><br></div>
            <div class="left-form3">

                <table class="draft" style="width:100px; text-align:center; font-size:12px; margin-right:10px;" border="1">
                    <tr>
                        <td rowspan="4" style="background:rgb(223, 221, 221);">신<br>청</td>
                        <td>직급</td>
                    </tr>
                    <tr>
                        <td>도장 <br>이름</td>
                    </tr>
                    <tr>
                        <td>날짜</td>
                    </tr>
                </table>
                
                <table class="draft" style="width:100px; text-align:center; font-size:12px;" border="1">
                    <tr>
                        <td rowspan="4" style="background:rgb(223, 221, 221);">승<br>인</td>
                        <td>직급</td>
                    </tr>
                    <tr>
                        <td>도장 <br>이름</td>
                    </tr>
                    <tr>
                        <td>날짜</td>
                    </tr>
                </table>
                <br><br><br><br>
                
            </div>
                <div class="left-form4">
                    <table class="table-bordered">
                        <tr>
                            <td width="100px;" style="text-align:center">
                                <label for="writer">기안자</label>
                            </td>
                            <td width="200px;">
                                <input type="text" value="" id="writer" readonly> 
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center">
                                <label for="dept">소속</label>
                            </td>
                            <td>
                                <input type="text" value="" id="dept" readonly> 
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center">
                                <label for="enrollDate">기안일</label>
                            </td>
                            <td style="text-align:center">
                                <input id="enrollDate" name="enrollDate" type="date" style="width:94%;" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center">
                                <label for="appNo">문서번호</label>
                            </td>
                            <td>
                                <input type="text" val="" id="appChange" name="appChange" readonly>
                            </td>
                        </tr>
                    </table>
                    <br>
                </div>
                <div class="left-form5">
                    <table class="table-bordered" >

                        <tr>
                            <td style="text-align:center; width:100px;">
                                <label for="title">신청현황</label>
                            </td>
                            <td style="width:700px;">
                                * * 자정 이후 근무시작인 경우 날짜를 다음날로 지정해주세요.
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center">
                                <label for="content">근무구분</label>
                            </td>    
                            <td>
                                &nbsp;&nbsp;<input type="radio" name="extra-sort"> 연장
                                &nbsp;&nbsp;<input type="radio" name="extra-sort"> 야간
                                &nbsp;&nbsp;<input type="radio" name="extra-sort"> 휴일
                            </td>                        
                        </tr>
                        <tr>
                            <td style="text-align:center">
                                <label for="content">근무일시</label>
                            </td>
                            <td>
                                &nbsp;&nbsp;
                                <input  class="dateSelect"  name="" id="" required >
                                <input type="number"  class="dateSelect-start"  name="overStartHour" id="overStartHour" required style="width:80px;" min="0" max="24"> ~ 
                                <input type="number" class="dateSelect-end" name="overEndHour" id="overEndHour" required style="width:80px;" min="0" max="24">
                                <button onclick="diffTime()">계산</button>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center"> 
                                <label for="content">근무시간</label>
                            </td>
                            <td id="overUseTime" name="overUseTime">
                                &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"  style="text-align:center">
                                * 주간 근무시간 - 근무일이 포함된 한 주 <br>

                                정상근무시간 + 연장근무 승인 요청에 대한 결재가 완료된 총 시간입니다. <br>
                                
                                근태관리에서 시간 수정이 가능하므로
                                
                                주간 근무시간은 상이해질 수 있습니다. <br>
                               </td>
                        </tr>
                        <tr>
                            <td rowspan="5" style="text-align:center">
                                <label for="content">신청사유</label>
                            </td>
                            <td rowspan="5" height="150px;">
                                <textarea class="form-control" name="" id="content" rows="10" style="resize:none;"></textarea>
                            </td>
                        </tr>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>

                        <tr>
                            <td style="text-align:center">
                                <label for="attachment">첨부파일</label>
                            </td>
                            <td>
                                <input type="file">
                            </td>
                        </tr>
                    </table>
                </div>
                <br>
                <script>
                
                // 회원정보흘 가져오는 ajax
                $(function(){
                	
                	$.ajax({
                		url:"enrollinfo.ap",
                		success:function(a){
                			
                			$("#writer").val(a.empName);
                			$("#dept").val(a.deptName);
                			$("#appChange").val(a.appChange);
                			
                		}, error:function(){
                			//console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
            				console.log("직성용 정보 불러오기 ajax 통신실패");
                		}
                	});
                	
                })
                    

                    function diffTime(){
                        const startTime = document.getElementById('overStartHour');
                        const endTime = document.getElementById('overEndHour');
                        const diff = endTime.value - startTime.value;

                        if(startTime.value > endTime.value || startTime.value == endTime.value){
                            alert("시작시간과 종료시간을 다시 확인해주세요.");
                            startTime.value = "";
                            endTime.value = "";
                            document.getElementById("overUseTime").value = "";
                            document.getElementById("overUseTime").innerHTML = "";
                        }else{
                            document.getElementById("overUseTime").value = diff;
                            document.getElementById("overUseTime").innerHTML = "총 " + diff + "시간";
                        }

                    }
                    

                    document.getElementById("enrollDate").value = new Date().toISOString().substring(0, 10);

                    var dateSelector = document.querySelector('.dateSelect');
                    dateSelector.flatpickr();
                    dateSelector.flatpickr({
                    local: 'ko',
                    disable: [
                    
                    // 주말 제외 (토, 일)
                    function(date) {
                    // return true to disable
                    return (date.getDay() === 0 || date.getDay() === 6);
                    }
                    ],
                    dateFormat: "Y-m-d",
                    minDate: "today",
                    maxDate:new Date().fp_incr(30)
                });

                </script>
            <div class="left-form6">
                <div style=" padding:10px; font-size:20px;">
                    <p><b> 결재선</b></p>
               </div>
              
               <div class="app-comment" style="font-size:15px;">
                   <img src="<c:out value='${loginUser.empProfile }' default='resources/profile_images/default_profile.png' />" width="30px;" alt=""> &nbsp;정형돈 과장
                   <br>
                     회사명 | 부서명
                   <br>
                    기안
                   <br><br>

                   <br>
               </div>
               <div class="app-comment" style="font-size:15px;">
                <img src="<c:out value='${loginUser.empProfile }' default='resources/profile_images/default_profile.png' />" width="30px;" alt=""> &nbsp;정형돈 과장
                <br>
                    회사명 | 부서명
                <br>
                    결재
                <br><br>

                <br>
            </div>
                </div>
            </div>
        </div>
 
    </div>
    <!-- 결재선 선택하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="app-line">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">결재선 지정</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body appLine">
                <div class="appLine1">
                    <b style="color:black">결재선</b>  | <b style="color:gray;">참조자</b> <br><br>
                    조직도 <br>
                    <input type="search" style="width:120px"><button class="btn btn-outline-secondary">검색</button> <br>

                    <ul class="empList">
                       <li id="appEmp1" class="appEmp">
                            <span>결재</span> 
                            <span>ddd1</span> 
                            <span>ddd1</span>
                            <input type="hidden" class="empNo" name="empNo" value="1">
                            <button class="btn btn-outline-secondary addbtn">+</button>
                       </li> 
                       <li id="appEmp2" class="appEmp"> 
                            <span>결재</span> 
                            <span>ddd2</span>
                            <span>ddd2</span>
                            <input type="hidden" class="empNo" name="empNo" value="2">
                            <button class="btn btn-outline-secondary addbtn">+</button>
                        </li> 
                        <li id="appEmp3" class="appEmp"> 
                            <span>결재</span> 
                            <span>ddd3</span>
                            <span>ddd3</span>
                            <input type="hidden" class="empNo" name="empNo" value="3">
                            <button class="btn btn-outline-secondary addbtn">+</button>
                        </li> 
                    </ul>

                </div>
                <div class="appLine2">
                    <form action="">
                        <h5>결재자 지정</h5>
                        <div class="appArea">
                            <ul>
                                <li>
                                    <span>기안</span>
                                    <span>정형돈</span>
                                    <span>부서명</span>
                                </li>                 
                            </ul>
                            <ul class="appList">

                            </ul>
                        </div>
                    </form>                    
                </div>
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer"  style="margin:auto;">
                <button type="submit" class="btn btn-light" data-dismiss="modal" data-toggle="modal" data-target="#ref-line">확인</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
            </div>
    
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
    </script>


    <!-- 참조 선택하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="ref-line">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">참조자 지정</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body appLine">
                <div class="appLine1">
                    <b style="color:gray">결재선</b>  | <b style="color:black;">참조자</b> <br><br>
                    조직도 <br>
                    <input type="search" style="width:120px"><button class="btn btn-outline-secondary">검색</button> <br>

                    <ul class="empList2">
                        <li id="repEmp1" class="repEmp">
                             <span>참조</span> 
                             <span>ddd1</span> 
                             <span>ddd1</span>
                             <input type="hidden" class="empNo" name="empNo" value="1">
                             <button class="btn btn-outline-secondary addbtn">+</button>
                        </li> 
                        <li id="repEmp2" class="repEmp"> 
                             <span>참조</span> 
                             <span>ddd2</span>
                             <span>ddd2</span>
                             <input type="hidden" class="empNo" name="empNo" value="2">
                             <button class="btn btn-outline-secondary addbtn">+</button>
                         </li> 
                         <li id="repEmp3" class="repEmp"> 
                             <span>참조</span> 
                             <span>ddd3</span>
                             <span>ddd3</span>
                             <input type="hidden" class="empNo" name="empNo" value="3">
                             <button class="btn btn-outline-secondary addbtn">+</button>
                         </li> 
                     </ul>

                </div>
                <div class="appLine2">
                    <form action="">
                        <h5>참조자 지정</h5>
                        <div class="repArea">
                            <ul>
                                <li>
                                    <span>기안</span>
                                    <span>정형돈</span>
                                    <span>부서명</span>
                                </li>                 
                            </ul>
                            <ul class="repList">

                            </ul>
                        </div>
                    </form>                   
                </div>

            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer"  style="margin:auto;">
                <button type="submit" class="btn btn-light" data-toggle="modal" data-target="#ref-line">확인</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>

    
    <script>

        // 조직도에서 참조 직원 요소 추가하는 구문
        var repE = document.querySelectorAll(".empList2 .addbtn");

        for (var i = 0; i < repE.length; i++) {
            repE[i].addEventListener("click", click3);
        }
 
        function click3(){

            let emp = $(this).parents("li");
            
                emp.clone(true).appendTo(".repList"); 
                $(".repList button").text('-');
                $(this).attr("disabled", true);
                delRep();            
        }
            
        function delRep(){

            // 추가된 참조 직원을 다시 삭제하는 구문
            var repD = document.querySelectorAll(".repList .addbtn");
            for (var i = 0; i < repD.length; i++) {
                repD[i].addEventListener("click", click4);
            }

            function click4(){

                let rev = $(this).parents("li");
                rev.remove(); 

                // 선택했던 추가버튼 다시 활성화 시키기
                const cList = document.querySelectorAll(".empList2 input");

                for(var i = 0; i < cList.length; i++){

                    if($(this).siblings("input").val() == cList[i].value){

                        cList[i].nextElementSibling.removeAttribute("disabled");
                    }
                }

            }

        }
        
    </script>

    
    <!-- 결재요청시 기안의견 작성하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="send-approval">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">결재요청</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                    <form action="">
                        <table class="table-borderless" style="width:100%; height:150px;">
                            
                                <tr>
                                    <td>결재문서명</td>
                                    <td>연장근무신청서</td>
                                </tr>
                                <tr>
                                    <td>기안의견</td>
                                    <td>
                                        <textarea name="" id="" cols="30" rows="3" style="resize:none"></textarea>
                                    </td>
                                </tr>
                            
                        </table>
                    </form>        
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer" style="margin:auto;">
                <button type="submit" class="btn btn-light">결재요청</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>
</body>
</html>