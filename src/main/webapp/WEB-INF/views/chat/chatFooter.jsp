<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {padding: 0; margin: 0; box-sizing: border-box;}
	a {text-decoration: none;}
	
	.chat-footer{
		position:fixed; 
		bottom:0; 
		padding:10px;
		width:100%;  
		height:50px; 
		background-color:rgb(233, 233, 237);
	}
	.chat-footer div{float:left; width:50%; text-align:center;}
	.chat-footer img{height:30px; line-height:50px;}
	
</style>
</head>
<body>
	<div class="chat-footer">
		<div>
			<a href="javascript:empListPop('empList.ch', 'popup');">
				<img src="resources/common_images/group.png">
			</a>
		</div>
		<div>
			<a href="javascript:roomListPop('chatList.ch', 'popup');">
				<img src="resources/common_images/meeting.png">
			</a>
		</div>
		
	</div>
	
	<script>
		function empListPop(url, name){
			var options = 'top=500, left=1400, width=400, height=600, status=no, menubar=no, toolbar=no, titlebar=no, resizable=no, scrollbars=yes';
			window.open(url, name, options);
		}
		
		function roomListPop(url, name){	
			
			var options = 'top=500, left=1400, width=400, height=600, status=no, menubar=no, toolbar=no, titlebar=no, resizable=no, scrollbars=yes';
			window.open(url, name, options);
		}
	</script>

</body>
</html>