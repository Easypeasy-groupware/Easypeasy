<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        /* div{border :1px solid red;} */
        .form-outer{ 
            width:1000px;
            margin:auto;
            float:left;
            box-sizing: border-box;
        }
        .form-outer>div{float:left;}
        .left-outer{width:80%;padding:30px;} 
        .right-outer{width:20%;padding:15px;}  
        .left-form1{height:5%;}
        .left-form2{height:2%;}
        .left-form3{height:15%;}
        .left-form4{height:3%;}
        .left-form5{height:50%;}
        .left-form6{height:25%;}
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
        .draft{height:106px;}
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="appMenubar.jsp" />
    <div class="form-outer">
        <div class="left-outer" style=" border-right:1px solid gray;">
                <div class="left-form1">
                    <p><b style="font-size:30px;">휴가신청서</b></p>
                </div>
                <div class="left-form2">
                <c:choose>
                    <c:when test="${loginUser.empNo eq ap.writerNo && ap.tstatus eq '진행중' }" >
                        <span style="padding:20px; color:rgb(71, 71, 71);" onclick="postFormSubmit(2);">문서삭제</span> |
                        <span style="padding:20px; color:rgb(71, 71, 71);" onclick="postFormSubmit(1);">기안수정</span>
                        <br><br>
                    </c:when> 
                    <c:when test="${loginUser.empNo eq ap.writerNo &&  ap.tstatus != '진행중' }" >
                        <span style="padding:20px; color:rgb(71, 71, 71);" onclick="postFormSubmit(2);">문서삭제</span> |
                        <span style="padding:20px; color:rgb(71, 71, 71);" onclick="postFormSubmit(1);">재기안</span>
                        <br><br>
                    </c:when>                       
                    <c:when test="${ap.st eq '참조대기' || ap.st eq '참조전체'}" >
                       
                    </c:when>  
                    <c:when test="${loginUser.empNo != ap.writerNo &&  ap.tstatus != '진행중' }" >

                        <br>
                    </c:when>
                    <c:when test="${loginUser.empNo != ap.writerNo && ap.tstatus eq '진행중'}">
                    	<c:forEach var="c" items="${list1}">
                    		<c:choose>
	                    		<c:when test="${c.recEmpNo eq loginUser.empNo && c.appStatus != '미결재' }">
	                    			<br>
	                    		</c:when>
	                    		<c:when test="${c.recEmpNo eq loginUser.empNo && c.appStatus eq '미결재' }">
			                        <a href="" style="padding:20px; color:rgb(71, 71, 71);" data-toggle="modal" data-target="#approval">결재</a> |  
			                        <a href="" style="padding:20px; color:rgb(71, 71, 71);" data-toggle="modal" data-target="#companion">반려</a> |
			                        <span style="padding:20px; color:rgb(71, 71, 71);" onclick="postFormSubmit(1);">문서수정</span>              			
	                    		</c:when>
	                    		<c:otherwise>
	                    			<br>
	                    		</c:otherwise>
                    		</c:choose>
                    	</c:forEach>                    	
                    </c:when>                               
                    <c:otherwise>

                        <br><br>
                    </c:otherwise>    
                        
                </c:choose>
                
                
                <!-- 몰래 수정하거나 삭제하기  -->
				<form action method="POST" id="postForm">
					<input type="hidden" name="no" value="${ap.appNo }">
					<c:forEach var="o" items="${list3 }">
						<input type="hidden" name="filePath" value="${o.changeName }">
							<!-- 첨부파일까지 삭제하기 위해 -->
					</c:forEach>	
				</form>
				
			</div>
		
            
            <div class="left-form3" >

                <table class="draft" style="width:100px; text-align:center; font-size:12px; margin-right:10px;" border="1">
                    <tr>
                        <td rowspan="4" style="background:rgb(223, 221, 221);">신<br>청</td>
                        <td>
                           ${ap.jobCode == 'J1'?'사원':
                             ap.jobCode == 'J2'?'대리':
                             ap.jobCode == 'J3'?'과장':
                             ap.jobCode == 'J4'?'부장':
                             ap.jobCode == 'J5'?'상무':
                             ap.jobCode == 'J6'?'대표':''}
                        </td>
                    </tr>
                    <tr>
                        <td>
	                        <img src="resources/common_images/approval.png" width="45px" /> 
	                        <br>
	                        ${ap.empName }
                        </td>
                    </tr>
                    <tr>
                        <td>${ap.enrollDate }</td>
                    </tr>
                </table>
                
               
                	<c:choose>
                		<c:when test="${empty list1 }">
			                <table class="draft" style="width:100px; text-align:center; font-size:12px; margin-right:10px;" border="1">
			                    <tr>
			                        <td rowspan="4" style="background:rgb(223, 221, 221);">승<br>인</td>
			                        <td>
			                           ${ap.jobCode == 'J1'?'사원':
			                             ap.jobCode == 'J2'?'대리':
			                             ap.jobCode == 'J3'?'과장':
			                             ap.jobCode == 'J4'?'부장':
			                             ap.jobCode == 'J5'?'상무':
			                             ap.jobCode == 'J6'?'대표':''}
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>
				                        <img src="resources/common_images/approval.png" width="45px" /> 
				                        <br>
				                        ${ap.empName }
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>${ap.enrollDate }</td>
			                    </tr>
			               </table>
                		</c:when>
                		<c:otherwise> 
                			<c:forEach var="i" items="${list1 }">
		                		<table class="draft" style="width:100px; text-align:center; font-size:12px;" border="1">
				                    <tr>
				                        <td rowspan="4" style="background:rgb(223, 221, 221);">승<br>인</td>
				                        <td>
				                           ${i.jobCode == 'J1'?'사원':
				                             i.jobCode == 'J2'?'대리':
				                             i.jobCode == 'J3'?'과장':
				                             i.jobCode == 'J4'?'부장':
				                             i.jobCode == 'J5'?'상무':
				                             i.jobCode == 'J6'?'대표':''}
				                        </td>
				                    </tr>
				                    <tr>
				                        <td>
				                        	<c:choose>
				                        		<c:when test="${i.appStatus eq '결재' }">
				                        			<img src="resources/common_images/approval.png" width="45px" />  
				                        		</c:when>
				                        		<c:otherwise>
				                        			<br>${i.appStatus }
				                        		</c:otherwise>
				                        	</c:choose>
				                        	<br>
				                        	${i.empName }
			                        	</td>
				                    </tr>
				                    <tr>
				                        <td>${i.updateDate }</td>
				                    </tr> 
				               </table>
			               </c:forEach>
		                 </c:otherwise>   
                    </c:choose>
                </table>
                <br><br><br><br>
                
            </div>
            <div class="left-form4">
                <br><br><br><br>
                <table class="table-bordered">
                    <tr>
                        <td width="100px;" style="text-align:center">기안자</td>
                        <td width="200px;">${ap.empName }</td>
                    </tr>
                    <tr>
                        <td style="text-align:center">소속</td>
                        <td>${ap.deptName }</td>
                    </tr>
                    <tr>
                        <td style="text-align:center">기안일</td>
                        <td>${ap.enrollDate }</td>
                    </tr>
                    <tr>
                        <td style="text-align:center">문서번호</td>
                        <td>${ap.appChange }</td>
                    </tr>
                </table>
                <br>
            </div>
            <div class="left-form5">
                <table class="table-bordered" >
                    <tr>
                        <td width="100px;" style="text-align:center">휴가종류</td>
                        <td width="700px;">${vf.vacKind }</td>
                    </tr>
                    <tr>
                        <td style="text-align:center">기간 및 일시</td>
                        <td>
                        	<span>${vf.vacStart } ~ ${vf.vacEnd }</span> &nbsp; , <span>${vf.vacUse } 일 사용</span> 
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:center">반차여부</td>
                        <td>
                        	<c:choose>
                        		<c:when test="${vf.halfStatus eq 'BOTH' }">
                        			${vf.halfDay }
                        		</c:when>
                        		<c:otherwise>
		                           ${vf.halfStatus == 'AM'?'오전':
		                             vf.halfStatus == 'PM'?'오후':
		                             vf.halfStatus == 'N'?'해당없음':''}
		                             &nbsp;
		                           ${vf.halfDay }   
	                             </c:otherwise>
				            </c:choose>            
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="5" style="text-align:center">휴가사유</td>
                        <td rowspan="5" height="150px;">${ap.content }</td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        
                    </tr>
                    <tr>
                       
                    </tr>
                    <tr>
                      
                    </tr>
                    <tr>
                        <td colspan="2">
                            1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다. <br>
                            &nbsp;&nbsp;&nbsp;&nbsp;단, 최초 입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다. <br>
                            2. 경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출 <br>
                            3. 공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:center">첨부파일</td>
                        <td>
                        	<c:choose>
                        		<c:when test="${empty list3 }">
                        			첨부파일이 없습니다.
                        		</c:when>
                        		<c:otherwise>
                        			<c:forEach var="t" items="${list3 }">
                        				<a href="${t.changeName }" download="${t.originName }">${t.originName }</a>
                        			</c:forEach>
                        		</c:otherwise>
                        	</c:choose>
                        </td>
                    </tr>
                </table>
            </div>
            <br>
            
            <div class="left-form6" id="replyArea">
            	<table  id="repTable" class="table-borderless" style="border:1px;" style="width:100%;">
                    <thead>
                        <tr height="100px;">
                            <th colspan="2">
                                <textarea class="form-control" name="" placeholder="내용을 입력해주세요" id="content" cols="55" rows="2" style="resize:none; width:640px;"></textarea>
                            </th>
                            <th style="vertical-align: middle" ><button class="btn btn-secondary" onclick="addReply();" style="width:100%; height:100%;">댓글작성</button></th>
                        </tr>
                        <tr>
                            <td colspan="3">댓글 (<span id="rcount"></span>) </td> 
                         </tr>                        
                    </thead>
                    <tbody>

                    </tbody>
                </table>
               
            </div>
            
        </div>
        
        <div class="right-outer" style="padding-left:20px;">
            <br>
            <div style="text-align:center; padding:20px; font-size:20px;">
                 <p><b> 결재선</b></p>
            </div>
           
            <div class="app-comment" style="font-size:15px;">
                <img src="<c:out value='${ loginUser.empProfile }' default='resources/common_images/businessman.png' />" id="profile-img" width="30px">
                 &nbsp;
                 ${ap.empName }
                 &nbsp;
                 ${ap.jobCode == 'J1'?'사원':
                   ap.jobCode == 'J2'?'대리':
                   ap.jobCode == 'J3'?'과장':
                   ap.jobCode == 'J4'?'부장':
                   ap.jobCode == 'J5'?'상무':
                   ap.jobCode == 'J6'?'대표':''}
                <br><br>
                이지피지 | ${ap.deptName }
                <br>
                
                기안 | ${ap.enrollDate }
                <br><br>
                <hgroup class="speech-bubble">
                    <br>
                    &nbsp;&nbsp;${ap.writerComment }
                    <br><br>
                </hgroup>
                <br>
            </div>
			<c:choose>
				<c:when test="${empty list1 }" >
		            <div class="app-comment" style="font-size:15px;">
		                <img src="<c:out value='${ loginUser.empProfile }' default='resources/common_images/businessman.png' />" id="profile-img" width="30px">
		                 &nbsp;
		                 ${ap.empName }
		                 &nbsp;
		                 ${ap.jobCode == 'J1'?'사원':
		                   ap.jobCode == 'J2'?'대리':
		                   ap.jobCode == 'J3'?'과장':
		                   ap.jobCode == 'J4'?'부장':
		                   ap.jobCode == 'J5'?'상무':
		                   ap.jobCode == 'J6'?'대표':''}
		                <br><br>
		                이지피지 | ${ap.deptName }
		                <br>
		                
		                결재 | ${ap.enrollDate }
		                <br><br>
		                <hgroup class="speech-bubble">
		                    <br>
		                    &nbsp;&nbsp;${ap.writerComment }
		                    <br><br>
		                </hgroup>
		                <br>
		            </div>				
				</c:when>
				<c:otherwise>
					<c:forEach var="j" items="${list1 }">
			            <div class="app-comment" style="font-size:15px;">
			                <img src="<c:out value='${ j.empProfile }' default='resources/common_images/businessman.png' />" width="30px;" alt="">
			                &nbsp;
			                ${j.empName }
			                &nbsp;
                           ${j.jobCode == 'J1'?'사원':
                             j.jobCode == 'J2'?'대리':
                             j.jobCode == 'J3'?'과장':
                             j.jobCode == 'J4'?'부장':
                             j.jobCode == 'J5'?'상무':
                             j.jobCode == 'J6'?'대표':''}
			                <br><br>
			                이지피지 | ${j.deptName }
			                <br>
			                 ${j.appStatus}  | ${j.updateDate }
			                <br><br>
			                 <c:choose>
			                 	<c:when test="${not empty j.appComment }">
					                <hgroup class="speech-bubble">
					                    <br>
					                    &nbsp;&nbsp;
						                    	${j.appComment }
					                    <br><br>
					                </hgroup>
				                </c:when>
			                </c:choose>
			                <br>
			            </div>
		            </c:forEach>
	            </c:otherwise>
            </c:choose>
            
        </div>
    </div>
    
        <script>

			function postFormSubmit(num){
				if(num == 1){ // 수정하기 클릭 시
					
					$("#postForm").attr("action", "updateForm.ap").submit();
				
				}else{ // 삭제하기 클릭시
					
	        		var con = confirm("해당문서를 삭제하시겠습니까?");
	        		console.log(con);
	        		if(con){
	        			$("#postForm").prop("action", "delete.ap");
	        			$("#postForm").submit();
	        		}							
					
				}
			}
        
		
	    	$(function(){
	    		selectReplyList();
	    		
	    	})
	    	
	    	function addReply(){ //댓글작성용 ajax
	    		
	    		if($("#content").val().trim().length > 0){ //유효한 댓글 작성시 => insert ajax요청
	    			
	    			$.ajax({
	    				url:"rinsert.ap",
	    				data:{
	    					replyContent:$("#content").val(),
	    					replyWriter:'${loginUser.empNo}', 
	    					appNo:'${ap.appNo}'
	    				}, success:function(result){
	    					
	    					if(result == "success"){
	    						$("#content").val("");
	    						selectReplyList();
	    					}
	    					
	    				}, error: function(request, status, error ){
	    					console.log("댓글 작성용 ajax 통신실패");
	    					alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);

	    				}
	    			});
	    			
	    		}else{
	    			alertify.alert("댓글 작성 후 등록 요청해주세요.");
	    		}
	    		
	    		
	    	}
	    
	    	function selectReplyList(){ // 해당 게시글에 딸린 댓글리스트 조회용 ajax
	    		$.ajax({
	    			url:"rlist.ap",
	    			data:{no:'${ap.appNo}'},
	    			success:function(list){
	    					    				
	    				let value="";
	    				if(list.length == 0){
	    					value += "<tr style='height:200px;'><td colspan='3'>댓글이 존재하지 않습니다.</td></tr>";
	    				}else{
		    				for(let i =0; i<list.length; i++){
		    					value += "<tr style='height:150px;'>"
		    					  		+ "<td colspan='3'>" + list[i].writerName +
		    					  			(
		    					  					list[i].jobCode == 'J1'?'사원':
	    					  						list[i].jobCode == 'J2'?'대리':
	   					  							list[i].jobCode == 'J3'?'과장':
					  								list[i].jobCode == 'J4'?'부장':
				  									list[i].jobCode == 'J5'?'상무':
			  										list[i].jobCode == 'J6'?'대표':'' 
		    	                             ) 
		    	                          + "|" +  list[i].deptName + "|" + list[i].enrollDate    
		    					  		+ "<br><br>"
		    					  	    + list[i].content;
			    					  		if(${loginUser.empNo} == list[i].writerNo){
			    					  			value +="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick='deleteReply("+ list[i].replyNo +");' href=''>삭제</a>";
			    					  		}
			    				  value += "</tr>";
		    				}
	    				}
	    				
	    				$("#replyArea tbody").html(value);
	    				$("#rcount").text(list.length);
	    				
	    				
	    			}, error:function(request, status, error){
	    				console.log("댓글리스트 조회용 ajax 통신실패");
    					alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);

	    			}
	    		});
	    		
	    	}
	    	
	    	function deleteReply(a){
	    		
	    		var con = confirm("댓글을 삭제하시겠습니까?");
	    		
	    		if(con){
		    		$.ajax({
		    			url:"rdelete.ap",
		    			data : {no:a},
		    			success:function(result){
		    				
	    					if(result == "success"){
	    						alert("성공적으로 삭제되었습니다.");
	    						selectReplyList();
	    					}		    				
		    				
		    			}, error:function(){
	    					console.log("댓글 작성용 ajax 통신실패");
	    					alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
		    				
		    			}
		    		});
	    		}
	    	}
	    	
	    	
   	</script>

    <!-- 결재하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="approval">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">결재하기</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                    <form id="app_Area1" action="updateco.ap" method="POST">
                        <table class="table-borderless" style="width:100%; height:150px;">
                            
                                <tr>
                                    <td>결재문서명</td>
                                    <td>결재문서제목</td>
                                </tr>
                                <tr>
                                    <td>결재의견</td>
                                    <td>
                                        <textarea name="appComment" id="appComment1" cols="30" rows="3" style="resize:none"></textarea>
										<input type="hidden" name="appStatus" value="결재">
                                        <input type="hidden" name="appNo" value="${ap.appNo }">
                                </tr>
                            
                        </table>
                    </form>        
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer" style="margin:auto;">
                <button type="button" class="btn btn-light" onclick="sendAppComment(1);">승인</button>
                <button type="button" class="btn btn-light" onclick="delComment(1);" data-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>

    <!-- 반려하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="companion">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">반려하기</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                    <form id="app_Area2" action="updateco.ap" method="POST">
                        <table class="table-borderless" style="width:100%; height:150px;">
                            
                                <tr>
                                    <td>결재문서명</td>
                                    <td>결재문서제목</td>
                                </tr>
                                <tr>
                                    <td>반려의견</td>
                                    <td>
                                        <textarea name="appComment" id="appComment2" cols="30" rows="3" style="resize:none"></textarea>
                                        <input type="hidden" name="appStatus" value="반려">
                                        <input type="hidden" name="appNo" value="${ap.appNo }">
                                    </td>
                                </tr>
                            
                        </table>
                    </form>        
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer" style="margin:auto;">
                <button type="button" class="btn btn-light" onclick="sendAppComment(2);">반려</button>
                <button type="button" class="btn btn-light" onclick="delComment(2);" data-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>
    
    <script>
    	function sendAppComment(n){
    		
    		if(n == 1){ // 결재일 때
    			 
    			if($("#appComment1").val().trim().length>0){
    				$("#app_Area1").submit();
    			}else{
    				swal("내용 작성 후 결재해주세요.");
    			}
    		
    			
    		}else{ // 반려일 때
    			
    			if($("#appComment2").val().trim().length>0){
    				$("#app_Area2").submit();
    			}else{
    				swal("내용 작성 후 반려해주세요.");
    			}
    			
    		}
    		
    	}
    	
    	function delComment(m){
    		
    		if(m == 1){
    			$("#appComment1").text("");
    		}else{
    			$("#appComment2").text("");
    		}
    		
    	}
    	
    	
    </script>
</body>
</html>