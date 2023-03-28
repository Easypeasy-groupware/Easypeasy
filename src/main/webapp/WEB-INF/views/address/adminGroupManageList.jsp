<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
	#main{position: absolute; top: 120px;}
    .address-content-outer{width:1000px; margin-left:200px; padding-top:20px;}
    .address-content-outer *{box-sizing: border-box;}
    #address-group{font-size:20px; font-weight:600; color:rgb(93, 109, 75);}

	.groupNames{
		display:inline-block;
		height:70px; 
		width:300px; 
		border:2px dashed gray; 
		border-radius:5px; 
		margin:0 0 15px 30px; 
		padding-left:15px;
		padding-top:0;
		
	}
    .groupNames img{width:15px;}
    .groupNames img:hover{cursor:pointer;}
    
    .each-group{display:inline-block; width:150px;}
    .input-name{
    	display:inline-block; 
    	width:120px; 
    	border:0; 
    	border-bottom:1px solid black; 
    	margin-right:10px;
    	font-size:13px;
    }
    .submit-name{display:inline-block; width:30px; }
    .manage-btns{width:30px;  margin-left:80px; display:inline-block; padding-top:5px;}
    .group-rename{width:30px; pading:10px;}
    .group-delete{width:30px; pading:10px;}
    
    .group-rename:hover{cursor: pointer;}
    input{padding-left:5px;}
    
    /*스크롤*/
	#psLike::-webkit-scrollbar, #pbLike::-webkit-scrollbar{width:5px;}
	#psLike::-webkit-scrollbar-thumb, #pbLike::-webkit-scrollbar-thumb{background-color:rgb(166, 184, 145); border-radius:5px;}
	#psLike::-webkit-scrollbar-track, #pbLike::-webkit-scrollbar-track{background-color:white;}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

    <div id="main">

		<jsp:include page="addMenubar.jsp"/>
		
		<div class="address-content-outer">

			<p id="address-group">관리자 공유주소록 그룹 관리</p>

			<br>
			<br>
			
			
			<c:forEach var="g" items="${gList}">
				<span class="groupNames">
					<span class="each-group">
						${ g.groupName }
					</span>
					<input type="text" name="groupName" class="input-name" style="display:none;">
					<input type="hidden" class="groupNo" name="groupNo" value="${ g.groupNo }">
					<img src="resources/common_images/save-icon.png"  class="submit-name" style="display:none;">
					<span class="manage-btns">
						<img src="resources/common_images/group-edit.png"  class="group-rename" >
						<img src="resources/common_images/group-delete.png" class="group-delete">
					</span>
				</span>
			</c:forEach>
			
			<script>
				$(function(){
					$(".group-rename").click(function(){
						let text = $(this).parent().siblings(".each-group").text().trim();
						$(this).parent().siblings(".each-group").hide();
						$(this).parent().siblings(".input-name").val(text).show();
						$(this).parent().siblings(".submit-name").show();
					})
					
					$(".address-content-outer").on("click", ".submit-name", function(){
						let name = $(this).siblings(".input-name");
						let val = $(this).siblings(".input-name").val();
						let no = $(this).siblings(".groupNo");
						let search = $(this);
						let group = $(this).siblings(".each-group");
						
						$.ajax({
							url:"updateSharedGroup.add",
							data:{
								groupName : name.val(),
								groupNo : no.val()
							},
							success:function(result){
								/*
								if(result>0){
									name.hide();
									no.hide();
									search.hide();
									group.text(val).show();
								}
								*/
								location.reload();
							},
							error:function(){
		    					console.log("공용주소록그룹 수정 실패");
		    				}
						});
					})
					
					$(".address-content-outer").on("click", ".group-delete", function(){
						let no = $(this).parent().siblings(".groupNo").val();
						$.ajax({
							url:"adminDel.add",
							data:no,
							success:function(msg){
								
								location.reload();
							},
							error:function(){
		    					console.log("공용주소록그룹 삭제 실패");
		    				}
							
						});
						
					})
					
				})
			</script>

			


		</div>
	</div>


</body>
</html>