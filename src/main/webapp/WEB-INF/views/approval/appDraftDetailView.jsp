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
        .left-outer{width:80%; padding:30px;} 
        .right-outer{width:20%; padding:15px;}   
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
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="appMenubar.jsp" />
    <div class="form-outer">
        <div class="left-outer" style=" border-right:1px solid gray;">
            <div class="left-form1">
                <p><b style="font-size:30px;"> 업무기안</b></p>
            </div>
            <div class="left-form2">
                <c:choose>
                    <c:when test="${loginUser.empNo eq ap.empNo }" >
                        <p style="padding:20px; color:rgb(71, 71, 71);">문서삭제</p> |
                        <p style="padding:20px; color:rgb(71, 71, 71);">기안수정</p>
                        <br><br>
                    </c:when>    
                                    <!-- 결재자일때 보일버튼 -->
                    <otherwise>
                        <a href="" style="padding:20px; color:rgb(71, 71, 71);" data-toggle="modal" data-target="#approval">결재</a> |  
                        <a href="" style="padding:20px; color:rgb(71, 71, 71);" data-toggle="modal" data-target="#companion">반려</a> |
                        <a href="" style="padding:20px; color:rgb(71, 71, 71);">문서수정</a>
                        <br><br>
                    </otherwise>    
                        
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

            <div class="left-form3">

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
                        <td width="100px;" style="text-align:center">협조부서</td>
                        <td width="700px;"></td>
                    </tr>
                    <tr>
                        <td style="text-align:center">제목</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td rowspan="5" style="text-align:center">내용</td>
                        <td rowspan="5" height="150px;">내용</td>
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
	    					appNo:${ap.appNo}
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
	    			data:{no:${ap.appNo}},
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
	    				
	    				
	    			}, error:function(){
	    				console.log("댓글리스트 조회용 ajax 통신실패");
	    			}
	    		})
	    		
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
                    <form action="">
                        <table class="table-borderless" style="width:100%; height:150px;">
                            
                                <tr>
                                    <td>결재문서명</td>
                                    <td>결재문서제목</td>
                                </tr>
                                <tr>
                                    <td>결재의견</td>
                                    <td>
                                        <textarea name="" id="" cols="30" rows="3" style="resize:none"></textarea>
                                    </td>
                                </tr>
                            
                        </table>
                    </form>        
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer" style="margin:auto;">
                <button type="submit" class="btn btn-light">승인</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
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
                    <form action="">
                        <table class="table-borderless" style="width:100%; height:150px;">
                            
                                <tr>
                                    <td>결재문서명</td>
                                    <td>결재문서제목</td>
                                </tr>
                                <tr>
                                    <td>반려의견</td>
                                    <td>
                                        <textarea name="" id="" cols="30" rows="3" style="resize:none"></textarea>
                                    </td>
                                </tr>
                            
                        </table>
                    </form>        
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer" style="margin:auto;">
                <button type="submit" class="btn btn-light">반려</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>
</body>
</html>