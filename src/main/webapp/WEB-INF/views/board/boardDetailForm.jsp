<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 전체 wrapper */
    .wrapper { width: 1200px; margin: 0 auto; position: absolute; top: 120px}
    body {font-family: Arial, sans-serif; margin: 0; padding: 0;}

    /* 게시판 스타일 */
    .board {width: 1000px;float: right;}
    .container {margin: 20px auto; width: 900px; padding: 20px;}
    .replyContent{margin: 20px auto; width: 900px; padding: 10px;}
	h4 {padding-left: 25px; padding-top: 15px; float: left		!important;}
	table {border-collapse: collapse; width: 100%;}
	tr {text-align: center;}
	th, td {text-align: center; padding: 8px; border-bottom: 1px solid #ccc;}
	th {background-color: #ddd;}
	.views {text-align: center;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
	
		<jsp:include page="../board/boardSidebar.jsp" />
       
        <div class="board">
        
        	 <h4><b style="color:rgb(93, 109, 75);">전체 공지사항</b></h4> <br><br><br><br>
        	 
        	 
    
		    <div class="container" style="width:1000px">
		    	
		            <button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='enrollForm.bo';"> 새글쓰기</button>
		            
		            <c:if test="${ loginUser.empNo eq b.boardWriter }">
			            <a class="btn btn-primary btn-sm" onclick="postFormSubmit(1);">수정하기</a>
		                <a class="btn btn-danger btn-sm" onclick="postFormSubmit(2);">삭제하기</a>
		                
		                <form action="" method="post" id="postForm"> 
				         	<input type="hidden" name="no" value="${b.boardNo}">
				         	<input type="hidden" name="filePath" value="${ b.changeName }">
				        </form>
			        
			            <script>
				            function postFormSubmit(num){
				                if(num == 1){ 
				                	$("#postForm").attr("action", "updateForm.bo").submit();
				                }else{ 
				                	$("#postForm").attr("action", "delete.bo").submit();
				                }
				        	}
				        </script>
		            </c:if>
		            
		            <button type="button" class="btn btn-outline-secondary btn-sm" style="float:right" onclick="location.href='list.bo';">목록으로</button> 
		            <br><br>
		             
		            <table id="contentArea" align="center" class="table" border="1px, solid">
		                <tr>
		                    <th width="500" colspan="3">${b.boardTitle}</th>
		                </tr>
		                <tr>
		                    <td>
		                        조회수 : ${b.boardCount }
		                    </td>
		                    <td>
		                        작성자 : ${b.empName}
		                    </td>
		                    <td>
		                        등록일 : ${b.createDate}
		                    </td>
		                </tr>
		                <tr>
		                   <td colspan="3">
                              <c:choose>
			                    <c:when test="${ not empty b.originName }">
			                        <a href="${ b.changeName }" download="${ b.originName }">${ b.originName }</a>
			                    </c:when>
			                    <c:otherwise>
			                        	첨부파일이 없습니다.
			                    </c:otherwise>
		                      </c:choose>
		                      
		                    </td>
		                </tr>
		                <tr>
		                    <td colspan="4">
		                        <p style="height:400px">
		                        	${b.boardContent}
		                        </p>
		                    </td>
		                </tr>
		            </table>
		      
		    </div>
		
		    <div class="replyContent" style="width:1000px" >
		        <table id="replyArea" class="table" align="center" border="1px, solid">
		            <thead>
		                <tr>
		                    <td colspan="4">댓글 (<span id="rcount">3</span>) </td> 
		                </tr>
			            <tr>
			                <th colspan="3">
			                     <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
			                 </th>
			                  <th style="vertical-align: middle"><button class="btn btn-secondary"  onclick="addReply();">등록하기</button></th>
			            </tr>
		            </thead>
		            <tbody>
		            
		                
		            </tbody>
		        </table>
		    </div>
        	<script>
        	$(function(){
        		selectReplyList();
        	})
        	
			function updateReply(replyNo, replyContent) { // 댓글 수정용 ajax
			    $.ajax({
			        url: "rupdate.bo",
			        data: { replyNo: replyNo, replyContent: replyContent, boardNo: '${b.boardNo}' },
			        success: function(result) {
			            if (result == "success") {
			                selectReplyList();
			            }
			        },
			        error: function() {
			            console.log("댓글 수정용 ajax 통신 실패");
			        }
			    });
			    
			    let inputHtml = "<input type='text' id='updateInput_" + replyNo + "' value='" + replyContent + "'/>";
			    $("#replyContent_" + replyNo).html(inputHtml);
			}
			
			function updateReplyContent(replyNo) { // 댓글 수정 ajax 함수
			    let newContent = $("#updateInput_" + replyNo).val();
			    updateReply(replyNo, newContent);
			}
        	
			
			
        	function deleteReply(replyNo) { // 댓글 삭제용 ajax
			    $.ajax({
			        url: "rdelete.bo",
			        data: { replyNo: replyNo },
			        success: function(result) {
			            if (result == "success") {
			                selectReplyList();
			            }
			        },
			        error: function() {
			            console.log("댓글 삭제용 ajax 통신 실패");
			        }
			    });
			}
        	
        	function addReply(){ // 댓글 작성용 ajax
        		
        		if($("#content").val().trim().length > 0){ 
        			
        			$.ajax({
        				url:"rinsert.bo",
        				data:{
        					replyContent:$("#content").val(),
        					replyWriter:'${loginUser.empNo}',
        					boardNo:'${b.boardNo}'
        				},success:function(result){
        					if(result == "success"){
        						$("#content").val("");
        						selectReplyList();
        					}
        				},error:function(){
        					console.log("댓글 작성용 ajax 통신 실패");
        				}
        			})
        			
        			
        		}else{
        			alertify.alert("댓글 작성 후 등록 요청해주세요");
        		}
        			
        	}
        	
        	function selectReplyList(){ //  조회용 ajax
        		$.ajax({
        			url:"rlist.bo",
        			data:{no:${b.boardNo}},
        			success:function(list){
        				console.log(list);
        				
        				let value = "";
        				for(let i=0; i<list.length; i++){
        					value += "<tr>"
        							+	"<td>" + list[i].replyWriter + "</td>"
        							+	"<td>" + list[i].replyContent + "</td>"
        							+	"<td>" + list[i].createDate + "</td>"
        							+  "<td>" + "<a onclick='deleteReply(" + list[i].replyNo + ")'>" + "삭제" + "</a>" 
        				/* 			+ "|"
        							+  "<a onclick='updateReply(" + list[i].replyNo + ",\"" + list[i].replyContent + "\")'>" +"수정"+"</a>"     */
        							+ "</td>"
        							+"</tr>";
        				}
        				
        				$("#replyArea tbody").html(value);
        				$("#rcount").text(list.length);
        				
        			},error:function(){
        				console.log("댓글리스트 조회용 ajax 통신 실패");
        			}
        		})
        	}
		    </script>
        </div>
	</div>
	
		
	
</body>
</html>