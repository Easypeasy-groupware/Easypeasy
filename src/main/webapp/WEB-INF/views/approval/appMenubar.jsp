<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
    <style>
         /* 안가져감 */
     /* div{
        box-sizing:border-box; 
         border:1px solid red;
         }  */
       .area{width:1200px;}
       .menubar{
        float:left;
        box-sizing:border-box;
        width:200px;
        height:1000px;
        border-right: 2px solid rgb(185, 187, 221);
       }
       .app-menu{
        padding-left:0;
        list-style-type:none;
       }
       .app-menu-1>li{
        padding:5px;
        text-align:left;
        padding-left:30px;
       }
       .app-menu a{
        text-decoration:none;
        color:black;
       }
       #newApp-form>ul{list-style:none;}
       .selectForm{
        display: flex;
        align-items: center;
       }

       /* 새 결재진행 버튼 */
       .menu-title{margin:20px 0 20px 0; text-align:center; }
        #title>a{font-size:20px; font-weight:600; color:rgb(93, 109, 75);}
        #title>a:hover{color:rgb(58, 69, 47); text-decoration:none;}

        /*연락처추가버튼*/
        #newBtn{width:70%; height:35px; margin:auto; margin-bottom:15px; padding:5px 0 5px 0; background-color: rgb(142, 161, 122); border-radius:4px; text-align:center;
        color:white; text-decoration:none;}
        #newBtn:hover{background-color: rgb(93, 105, 81);}

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
        .appLine1, .appLine2{
        	padding-top: 30px;
        	margin: 10px;
        	width: 350px;
        	height: 600px;
        	overflow: auto;
        	padding-left:30px;
        	border: 1px solid gray;
        	border-radius: 10px;
        }
        
        .appLine1 span, .appLine2 span{
        	font-size:14px;
        }
        
        .appLine1::-webkit-scrollbar, , .appLine2::-webkit-scrollbar{
        width: 20px; 
        /*display: none;*/
    	}
    	.modal-body appLine{padding:20px;}
         	
        

      
    </style>
    
    <!-- 부트스트랩 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- flatpickr -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>  

    <!-- 써머노트 -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>  
</head>
<body>
    <div class="wrap-1" align="center">
        <div class="area" >
            <div class="menubar">
               
                <ul class="app-menu">
                    <li id="title" class="menu-title" style="text-align:center;"><a href="main.ap"> 전자결재</a></li>
                    <li style="text-align:center;" class="menu-title"><button type="button"  class="btn btn-outline-secondary" id="newBtn"  data-toggle="modal" data-target="#newApp">새 결재 진행</button></li>
                    <br>
                    <div class="app-menu-1">
                    <li><a href="recWlist.ap">결재 대기문서</a></li>
                    <li><a href="refWlist.ap">참조 대기문서</a></li>
                    <br>
                    <li><b>개인</b></li>
                    <li><a href="sendList.ap">기안문서함</a></li>
                    <li><a href="tempList.ap">임시저장함</a></li>
                    <li><a href="recList.ap">결재문서함</a></li>
                    <li><a href="refList.ap">참조문서함</a></li>
                    <br>
                    <li><b>부서</b></li>
                    <li><a href="dSendList.ap">기안완료함</a></li>
                    <li><a href="dRefList.ap">부서참조함</a></li>
                    </div>
                    <br><br>
                </ul>
            </div>
        </div>
    </div>
        <!-- 새 결재 양식 선택하는 모달 -->
        <!-- The Modal -->
        <div class="modal modal-center fade" id="newApp">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">결재 양식 선택</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body selectForm">
                    <div>
                        <form action="enrollForm.ap" type="Get" id="newApp-form">
                            <br>
                            <ul>
                                <li>
                                    <input type="radio" name="formCode" id="draft" value="1">
                                    <label for="draft">업무기안</label>   
                                </li>
                                <li>
                                    <input type="radio" name="formCode" id="propersal" value="2">
                                    <label for="propersal">일반품의서</label>  
                                </li>
                                <li>
                                    <input type="radio" name="formCode" id="vacation" value="3">
                                    <label for="vacation">휴가신청서</label>  
                                </li>
                                <li>
                                    <input type="radio" name="formCode" id="overtime" value="4">  
                                    <label for="overtime">연장근무신청서</label>
                                </li>
                            </ul>
                      
                    </div>
                    <div>
                        보안등급 &nbsp;  :  &nbsp; 
                        <span id="grade"></span>
                        <br><br>
                        보존연한 &nbsp;  :  &nbsp; 
                        <span id="preser"></span>
                    </div>
                </div>

		                <!-- Modal footer -->
		                <div class="modal-footer" style="margin:auto; ">
		                    <button type="submit"  class="btn btn-light">확인</button>
		                    <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
		                </div>
		          </form>
            </div>
            </div>
        </div>
    
    <script>
        $(document).ready(function(){
            $("input[name='formCode']").change(function(){
                if($("input[name='formCode']:checked").val()==1 || $("input[name='formCode']:checked").val()==2){
                    $("#grade").text('A');
                    $("#preser").text('5년');
                }else{
                    $("#grade").text('B');
                    $("#preser").text('3년');
                }
            });
        });
    </script>
    
    
    <!-- 결재선 선택하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="app-line">
        <div class="modal-dialog modal-lg">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title"></h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body appLine">
            
            		<h3>결재선 지정</h3><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <b style="color:black; font-size:20px;">결재선</b>  | <b style="color:gray; font-size:20px;">참조자</b> <br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    조직도 <br>
                                
                <div class="appLine1">


					<c:forEach var="d" items="${deptList}" begin="0" end="6" varStatus="dept">
						<div>
							<b class="${ d.deptCode }">${ d.deptName }</b>
							<span><img src="resources/common_images/list-down.png" style="width:15px;" class="dropdown-key" id="cList-key${ dept.index }"></span>
						</div>
						<ul class="empList" id="cList-in${ dept.index }" style="display: none;"> <!-- 사원리스트 -->
							<c:forEach var="e" items="${list}">
								<c:if test="${ e.deptName eq d.deptName }">
								<li id="appEmp${ e.empNo }" class="appEmp">
										<span class="indiv-profile">
											<img src="<c:out value='${e.empProfile }' default='resources/profile_images/default_profile.png' />" width="20px;" alt="">
										</span>
										<span class="indiv-name">${ e.empName }</span>
										<span class="indiv-job">${e.jobName}</span> 
										<span class="indiv-dept">${e.deptName }</span>
										<input type="hidden" name="empNo" value="${e.empNo}">
										<button class="btn btn-outline-light text-dark addbtn">+</button>
								</li>
								</c:if>
							</c:forEach>
						</ul>
						<br>
					</c:forEach>

                </div>
                <div class="appLine2">
                    
                        <div class="appArea">

                            <ul class="appList">

                            </ul>
                            
                        </div>
                
                </div>
                
                
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer"  style="margin:auto;">
                <button type="button" onclick="copyApp();" class="btn btn-light" data-dismiss="modal" data-toggle="modal" data-target="#ref-line">확인</button>
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
        
    	$(function(){
    		
    		$("#cList-key0").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#cList-in0").slideDown();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in0").slideUp();
    			}
    		})
    		$("#cList-key1").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#cList-in1").slideDown();
    				
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in1").slideUp();
    			}
    		})
    		$("#cList-key2").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");
    				$("#cList-in2").slideDown();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in2").slideUp();
    			}
    		})
    		$("#cList-key3").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#cList-in3").slideDown();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in3").slideUp();
    			}
    		})
    		$("#cList-key4").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#cList-in4").slideDown();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in4").slideUp();
    			}
    		})
    		$("#cList-key5").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#cList-in5").slideDown();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in5").slideUp();
    			}
    		})
    		$("#cList-key6").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");
    				$("#cList-in6").slideDown();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in6").slideUp();
    			}
    		})
    		
    		
    	})
    </script>


    <!-- 참조 선택하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="ref-line">
        <div class="modal-dialog modal-lg">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title"></h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body appLine">
            		<h3>결재선 지정</h3><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <b style="color:gray; font-size:20px;">결재선</b>  | <b style="color:black; font-size:20px;">참조자</b> <br><br>                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    조직도 <br>
                <div class="appLine1">


					<c:forEach var="b" items="${deptList}" begin="0" end="6" varStatus="dept">
						<div>
							<b class="${ b.deptCode }">${ b.deptName }</b>
							<span><img src="resources/common_images/list-down.png" style="width:15px;" class="dropdown-key" id="rList-key${ dept.index }"></span>
						</div>
						<ul class="empList2" id="rList-in${ dept.index }" style="display: none;"> <!-- 사원리스트 -->
							<c:forEach var="f" items="${list}">
								<c:if test="${ b.deptName eq f.deptName }">
								<li id="refEmp${ f.empNo }" class="refEmp">
								
										<span class="indiv-profile">
											<img src="<c:out value='${f.empProfile }' default='resources/profile_images/default_profile.png' />" width="20px;" alt="">
										</span>
										<span class="indiv-name">${ f.empName }</span>
										<span class="indiv-job">${f.jobName}</span> 
										<span class="indiv-dept">${f.deptName}</span> 
										<input type="hidden" name="empNo" value="${f.empNo}">
										<button class="btn btn-outline-light text-dark addbtn">+</button>
								</li>
								</c:if>
							</c:forEach>
						</ul>
						<br>
					</c:forEach>

                </div>
                <div class="appLine2">
                   
                        <div class="repArea">

                            <ul class="repList">

                            </ul>
                        </div>
                                      
                </div>

            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer"  style="margin:auto;">
                <button type="button" onclick="copyRef();" class="btn btn-light" data-toggle="modal" data-target="#ref-line">확인</button>
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
        
        function copyApp(){
        	
        	const arr1 = $(".appList .appEmp").children("input");
        	let val = "";
        	
        	for(var i = 0; i < arr1.length; i++){
        		
        		val+= "<div>"
        			+ "<img src='<c:out value='${loginUser.empProfile }' default='resources/profile_images/default_profile.png' />' width='30px;'>"
        			+ "<br><br>"
        		  	+ "<input type='hidden' name='recEmpNo' value='"+ arr1[i].value +"'>" + arr1[i].value
        		  	+ "<br> 결재 <br><br><br>";
        	}
        	$(".app-body").html(val);
        	//console.log($(".appList .appEmp").children("span").text());
        }
        
        function copyRef(){
        	
        	const arr2 = $(".repList .refEmp").children("input");
        	let val = "";
        	
        	for(var i = 0; i < arr2.length; i++){
        		
        		val+= "<div>"
        			+ "<img src='<c:out value='${loginUser.empProfile }' default='resources/profile_images/default_profile.png' />' width='30px;'>"
        			+ "<br><br>"
        			+ "<input type='hidden' name='recEmpNo' value='"+ arr2[i].value +"'>" + arr2[i].value
        		  	+ "<br> 결재 <br><br><br>";
        	}
        	$(".rep-body").html(val);
        }
        
    	$(function(){
    		
    		$("#rList-key0").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#rList-in0").slideDown();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#rList-in0").slideUp();
    			}
    		})
    		$("#rList-key1").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#rList-in1").slideDown();
    				
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#rList-in1").slideUp();
    			}
    		})
    		$("#rList-key2").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");
    				$("#rList-in2").slideDown();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#rList-in2").slideUp();
    			}
    		})
    		$("#rList-key3").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#rList-in3").slideDown();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#rList-in3").slideUp();
    			}
    		})
    		$("#rList-key4").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#rList-in4").slideDown();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#rList-in4").slideUp();
    			}
    		})
    		$("#rList-key5").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#rList-in5").slideDown();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#rList-in5").slideUp();
    			}
    		})
    		$("#rList-key6").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");
    				$("#rList-in6").slideDown();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#rList-in6").slideUp();
    			}
    		})
    		
    		
    	})
        
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
    

            <form action="" >
            <!-- Modal body -->
	            <div class="modal-body">
                    <table class="table-borderless" style="width:100%; height:150px;">
                        
                            <tr>
                                <td>결재문서명</td>
                                <td>결재문서제목</td>
                            </tr>
                            <tr>
                                <td>기안의견</td>
                                <td>
                                    <textarea name="writerComment" id="writerComment" cols="30" rows="3" style="resize:none"></textarea>
                                </td>
                            </tr>
                    </table>
	                           
	            </div>
	    
	            <!-- Modal footer -->
	            <div class="modal-footer" style="margin:auto;">
	                <button type="button" id="insertBtn" onclick="insertApp();" class="btn btn-light">결재요청</button>
	                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
	            </div>
		   </form> 
        </div>
        </div>
    </div>


</body>
</html>
