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
	th, td {text-align: center; padding: 8px; border-bottom: 1px solid #ccc; }
	th {background-color: #ddd;}
	.views {text-align: center;}
	#replyArea td { resize:none; vertical-align: middle;}
	.reply_content{min-height: 25px; max-height: 200px;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
	
		<jsp:include page="../board/boardSidebar.jsp" />
       
        <div class="board">
        
        	 <h4><b style="color:rgb(93, 109, 75);">자유게시판</b></h4> <br><br><br><br><input type="hidden" name="no" value="${b.boardCno}">
    
		    <div class="container" style="width:1000px">
		    	
		            <button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='enrollAForm.bo';"> 새글쓰기</button>
		            
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
				                	$("#postForm").attr("action", "updateAForm.bo").submit();
				                }else{ 
				                	$("#postForm").attr("action", "deleteA.bo").submit();
				                }
				        	}
				        </script>
		            </c:if>
		            
		            <button type="button" class="btn btn-outline-secondary btn-sm" style="float:right" onclick="location.href='free.bo';">목록으로</button> 
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
		                        작성자 : <input type="hidden" name="boardWriter" value="${b.boardWriter}"> 익명
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
		                        <textarea style="height:400px; width:100%; border:none; text-align:left; resize:none;" readonly>
		                        	${b.boardContent}
		                        </textarea>
		                    </td>
		                </tr>
		            </table>
		      
		    </div>
		
		    <div class="replyContent" style="width:1000px;" >
		        <table id="replyArea" class="table" style="align:center; boder:1px solid; width:990px;">
		            <thead>
		                <tr>
		                    <td colspan="5">댓글 (<span id="rcount"></span>) </td> 
		                </tr>
			            <tr>
			                <th colspan="3">
			                  <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:800px;"></textarea>
			                </th>
			                <th style="vertical-align: middle; width:100px;">
			                  	<button class="btn btn-secondary"style="width:100px; height:60px;" onclick="addReply();">등록하기</button>
			                </th>
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
			        data: { replyNo: replyNo, replyContent: replyContent },
			        success: function(result) {
			            if (result == "success") {
			                selectReplyList();
			            }
			        },
			        error: function() {
			            console.log("댓글 수정용 ajax 통신 실패");
			        }
			    });
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
        							+  "<td style='display:none'>" + list[i].replyWriter +"</td>"
        							+	"<td style='width:110px;'>" + "익명" + "</td>"
        							+	"<td style='width:800px;'><div class='reply_content'>" + list[i].replyContent + "</div></td>"
        							+	"<td style='width:200px;'>" + list[i].createDate + "</td>";
        							if(list[i].replyWriter == ${loginUser.empNo}){
        								value +=  "<td>" + "<a onclick='deleteReply(" + list[i].replyNo + ")'>" + "삭제" + "</a>";
        							}else{
        								value +=  "<td>";
        							}
        							
        						/* 	+ "|"
        							+  "<a onclick='updateReply(" + list[i].replyNo + ",\"" + list[i].replyContent + "\")'>" +"수정"+"</a>"    */
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