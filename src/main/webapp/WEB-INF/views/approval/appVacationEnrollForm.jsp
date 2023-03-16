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
        .left-outer{width:100%; padding:30px;}  
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
        
		/* 말풍선 적절한 top 과 margin-left 로 위치조정 */
		.arrow_box {
		  display: none;
		  position: absolute;
		  width: 200px;
		  padding: 8px;
		  left: 660px;
		  -webkit-border-radius: 8px;
		  -moz-border-radius: 8px;
		  border-radius: 8px;
		  background: #33333374;
		  color: #fff;
		  font-size: 14px;
		}
		
		.arrow_box:after {
		  position: absolute;
		  bottom: 100%;
		  left: 50%;
		  width: 0;
		  height: 0;
		  margin-left: -10px;
		  border: solid transparent;
		  border-color: rgba(91, 91, 91, 0);
		  border-bottom-color:  #33333374;
		  border-width: 10px;
		  pointer-events: none;
		  content: ' ';
		}
		
		#useHalf:hover + p.arrow_box {
		  display: block;
		  cursor:pointer
		}        
        
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="appMenubar.jsp" />
    <div class="form-outer">
        <div class="left-outer">
            <div class="left-form1">
                <p><b style="font-size:30px;">휴가신청서</b></p>
            </div>
            <div class="left-form2">
                <a href=""  data-toggle="modal" data-target="#send-approval" style="padding:20px; color:rgb(71, 71, 71);">결재요청</a>|
                <a href="" style="padding:20px; color:rgb(71, 71, 71);">임시저장</a>|
                <a href="" style="padding:20px; color:rgb(71, 71, 71);">취소</a>|
                <a href="" style="padding:20px; color:rgb(71, 71, 71);"  data-toggle="modal" data-target="#app-line">결재선지정</a>
                <br><br>
            </div>
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
                                <input type="text" id="writer" value="" readonly> 
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
                                <label for="title">휴가종류</label>
                            </td>
                            <td style="width:600px;">
                                <select name="" id="">
                                    <option value="">일반휴가</option>
                                    <option value="">특별휴가</option>
                                    <option value="">병가</option>
                                    <option value="">경조사</option>
                                    <option value="">공가</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center">
                                <label for="content">기간 및 일시</label>
                            </td>    
                            <td>
                                <input type="text" class="dateSelect-start" name="vac-start" onchange="diffDate();" > ~ 
                                <input type="text" class="dateSelect-end" id="vac-end" name="vac-end"  onchange="diffDate();">
                                <span id="useHalf" style="cursor:pointer">반차사용</span>
                                <p class="arrow_box">클릭 시 반차 선택가능합니다.</p>
                            </td>                        
                        </tr>

                        <tr style=" display:none;" id="half-area">
                            <td style="text-align:center">
                                <label for="content">반차여부</label>
                            </td>
                            <td>
                                &nbsp;&nbsp;<input type="checkbox" id="vac-startHalf" onclick="halfCheck();"> 
                                <label for="vac-startHalf">시작일</label> 

                                
                                ( <input type="radio" name="start-half" id="start-half1" value="am" >  &nbsp; <label for="start-half1">오전</label>  &nbsp;
                                <input type="radio" name="start-half" id="start-half2" >  &nbsp; <label for="start-half2">오후</label> )
                                &nbsp;&nbsp;<input type="checkbox" id="vac-endHalf" onclick="halfCheck();">
                                <label for="vac-endHalf">종료일</label> 
                                ( <input type="radio" name="end-half" id="end-half1" >  &nbsp; <label for="end-half1">오전</label> &nbsp;
                                <input type="radio" name="end-half" id="end-half2" >  &nbsp; <label for="end-half2">오후</label> )
								
								
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center">
                                연차일수 
                            </td>
                            <td>
                                잔여연차 : <input type="text" style="width:50px;" readonly> 
                                신청연차 : <input type="number" id="vacUse" name="vacUse" style="width:50px;" readonly>
                            </td>
                        </tr>
                        <script>
                        
                	    // 회원정보흘 가져오는 ajax
                	    $(function(){
                	    	
                	    	$.ajax({
                	    		url:"enrollinfo.ap",
                	    		success:function(result){
                	    				    			
                	    			$("#writer").val(result.a.empName);
                	    			$("#dept").val(result.a.deptName);
                	    			$("#appChange").val(result.appChange);
                	    			
                	    		}, error:function(request, status, error){
                	    			console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
                					console.log("직성용 정보 불러오기 ajax 통신실패");
                	    		}
                	    	});
                	    	
                	    	

                            $("#useHalf").click(function(){
                                // $(this) : 클릭 이벤트가 발생된 div 요소를 가리킴
                                // $(this).next() : 클릭이벤트가 발생된 div요소 뒤에 있는 p 요소
                                //$(this).next().slideDown();
                                // $p : 제이쿼리 형식이라는 것을 보여주기 위해 $붙여줬음
                                const $p = $("#half-area"); // jQuery 방식으로 선택된 요소를 담기위해
								
                                if($("#half-area").css("display") == "none"){ // css는 스타일 속성값을 반환해주는 역할도 해줌

                                    $p.slideDown(); // 보여지게
                                    
                                }else{
                                    $p.slideUp(); // 사라지게
                                }
                                
                            })
                	    	
                	    	
                	    })
                           
                           document.getElementById("enrollDate").value = new Date().toISOString().substring(0, 10);

                              var dateSelector1 = document.querySelector('.dateSelect-start');
                                
                                dateSelector1.flatpickr();
                                dateSelector1.flatpickr({
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
            
                                var dateSelector2 = document.querySelector('.dateSelect-end');
                                dateSelector2.flatpickr();
                                dateSelector2.flatpickr({
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
                                maxDate:new Date().fp_incr(30) // 오늘날짜로부터 30일이내

                                });
                            

                            function diffDate(){
                                let date1 = new Date($(".dateSelect-start").flatpickr().input.value); 
                                        
                                        dateSelector1.flatpickr();
                                        dateSelector1.flatpickr({
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
                                        
                                        })

                                let date2 = new Date($(".dateSelect-end").flatpickr().input.value); 
                                       
                                        dateSelector2.flatpickr();
                                        dateSelector2.flatpickr({
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
                                        })                                       


                                        if(date1 > date2){
                                            alert("날짜를 다시 선택해주세요.");
                                            document.querySelector('.dateSelect-start').value="";
                                            document.querySelector('.dateSelect-end').value="";
                                            //console.log("count :" + count);
                                            
                                        }else{

                                            let diff1 = date1.getTime()/ (24 * 60 * 60 * 1000);
                                            let diff2 = date2.getTime()/ (24 * 60 * 60 * 1000);
                                            let temp = date1.getDay();
                                            //console.log(diff1, diff2, temp);

                                            let count = 0;
                                            for(var i = diff1 ; i <= diff2; i++){

                                                if(temp == 0 || temp == 6){
                                                    //i--;
                                                    //console.log("주말");
                                                }else{
                                                    //console.log(i);
                                                    //console.log(temp);
                                                    count++;
                                                    //console.log("평일");
                                                }
                                                if(temp == 6) {temp-=6;
                                                }else{ temp++};

                                            }

                                            $("#vacUse").val(count);

                                            // 기간 및 일시 신청연차 계산 확인
                                            // 신청연차가 1일 때 종료일을 비활성화
                                            if(diff1 == diff2){
                                                $("#vac-endHalf").attr("disabled", true);
                                                $("#end-half1").attr("disabled", true);
                                                $("#end-half2").attr("disabled", true);
                                            }

                                            
                                        } 
                                       
								//halfCheck();
                            }                            
                              
                            function halfCheck(){
                            	
                                diffDate();
	
                                    if($("#vac-startHalf").prop("checked")){
                                    	
                                    	$("#vacUse").val($("#vacUse").val() - 0.5) ;
                                    	$("input[type=radio][name=start-half]").prop('disabled', false);
                                    	
                                    	$("#vac-endHalf").prop("checked", false);
                                    	
                                        $("input[type=radio][name=end-half]").prop('disabled', true);
                                        $("#end-half1").prop("checked", false);
                                        $("#end-half2").prop("checked", false);
                                    	
                                    } else if($("#vac-endHalf").prop("checked")){
                                    	
                                    	$("#vacUse").val($("#vacUse").val() - 0.5) ;
                                    	$("input[type=radio][name=end-half]").prop('disabled', false);
                                    	
                                    	$("#vac-startHalf").prop("checked", false);
                                    	
                                    	$("input[type=radio][name=start-half]").prop('disabled', true);
                                        $("#start-half1").prop("checked", false);
                                        $("#start-half2").prop("checked", false);
                                        
                                    }
                                
                            }
                            

                    </script>                
                              
 
                        <tr>
                            <td rowspan="5" style="text-align:center">
                                <label for="content">휴가사유</label>
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
                            <td colspan="2">
                                1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다. <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;단, 최초 입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다. <br>
                                2. 경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출 <br>
                                3. 공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출
                            </td>
                        </tr>
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
		              
		                <div style=" padding:10px; font-size:20px;">
		                    <p><b> 참조자</b></p>
		               </div>
	              
		               <div class="app-comment" style="font-size:15px;">
		                   <img src="<c:out value='${loginUser.empProfile }' default='resources/profile_images/default_profile.png' />" width="30px;" alt=""> &nbsp;정형돈 과장
		                   <br>
		                     회사명 | 부서명
		                   <br>
		                    참조
		                   <br><br>
		
		                   <br>
		               </div>
		               <div class="app-comment" style="font-size:15px;">
		                <img src="<c:out value='${loginUser.empProfile }' default='resources/profile_images/default_profile.png' />" width="30px;" alt=""> &nbsp;정형돈 과장
		                <br>
		                    회사명 | 부서명
		                <br>
		                    참조
		                <br><br>
		
		                <br>
		              </div>		              
               </div>
               
               
               
            </div>
        </div>
 
    </div>

</body>
</html>