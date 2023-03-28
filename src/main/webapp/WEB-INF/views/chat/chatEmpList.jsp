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
<!--Bootstrap 5.3.0-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
<style>
    * {padding: 0; margin: 0; box-sizing: border-box;}
	a {text-decoration: none;}
	
	/*채팅방 헤더*/
	.chat-header{margin:10px; height:50px;}
	.chat-title{float:left; height:50px; line-height:50px; padding-left:10px; font-weight:600; width:90%;}
	.chat-title:hover{cursor:pointer;}
	.room-manage{float:left; height:50px; line-height:50px;}
	.room-manage span:hover{cursor:pointer; font-size:18px;}
	
	/*채팅방 리스트*/
	.list-area{height:480px; overflow-y:auto;}
	.list-area::-webkit-scrollbar{width:5px;}
	.list-area::-webkit-scrollbar-thumb{background-color:rgb(92, 95, 197); border-radius:10px;}
	.list-area::-webkit-scrollbar-track{background-color:white;}
	
	.indiv-list{
		height:70px; 
		padding:10px;
		padding-left:20px;
		border-top:1px solid lightgray;
	}
	.indiv-list:hover{background-color:lightgray;}
	
	.indiv-list div{float:left;}
	.img-area{height:100%; width:70px;}
	.img-area img{height:100%; border-radius:50%;}
	.room-info{height:100%; line-height:55px;}
	.room-info span{display:inline-block;}
	.emp-name{font-weight:600; font-size:14px;}
	.dept-name, .job-name{font-size:13px;}
	.work-status{font-size:10px;}
	
	/*검색*/
	.search-area{line-height:40px; background-color:white; text-align:center; display:none;}
	#searchEmp{border:0; padding:10px; border-bottom:1px solid black; width:80%; height:40px; margin-left:5px;}
	.search-area img:hover{cursor:pointer;}
	.search-area img{width:20px;}
</style>
</head>
<body>
    <div class="chat">
        <div class="chat-header">
        	<div class="chat-title">
        		EASY PEASY
        	</div>
        	<div class="room-manage">
        		<span id="room-search">🔍</span>
        	</div>
        	
        	<div class="search-area">
        	
       		<input type="text" id="searchEmp" name="empNo">
       		<a href="#"><img src="resources/common_images/search-icon.png" id="search-icn"></a>
        	
        	</div>
        </div>
        <script>
        	$(".chat-title").click(function(){
        		if($(".search-area").css("display")!="none"){
        			$(".chat-header").css("height", "50px");
         			$(".list-area").css("height", "480px");
             		$(".search-area").hide();
        		}
        		$(".list-area").stop().animate({"scrollTop":0}, 100, "swing");
        	})
        </script>
        <script> 		
         	$("#room-search").click(function(){
         		if($(".search-area").css("display")=="none"){
         			$(".chat-header").css("height", "90px");
         			$(".list-area").css("height", "430px");
             		$(".search-area").show();	
         		}else {
         			$(".chat-header").css("height", "50px");
         			$(".list-area").css("height", "480px");
             		$(".search-area").hide();
         		}
        	})
        </script>
        
		<div class="list-area">
			
				
			<c:forEach var="e" items="${ list }">
				<c:if test="${ loginUser.empNo ne e.empNo }">
				
					<div class="indiv-list">
						<input type="hidden" name="empNo" value="${e.empNo}">
						<div class="img-area">
							<img src="<c:out value='${e.empProfile}' default='resources/chat-images/rockstar.png'/>">
						</div>
						<div class="room-info">
							<span class="dept-name">${e.deptName}</span>
							<span class="emp-name">${e.empName }</span>
							<span class="job-name">${e.jobName }</span>
							<c:choose>
								<c:when test="${ e.status eq 'WO' }">
									<span class="badge work-status rounded-pill text-bg-success">근무중</span>
								</c:when>
								<c:when test="${ e.status eq 'ME' }">
									<span class="badge work-status rounded-pill text-bg-secondary">회의중</span>
								</c:when>
								<c:otherwise>
									<span class="badge work-status rounded-pill text-bg-light">부재중</span>
								</c:otherwise>
							
							</c:choose>
						</div>
					</div>
				</c:if>		
			</c:forEach>

		</div><!-- list-area끝 -->
		<script>				
			$("#searchEmp").keyup(function(){
				let keyword = $("#searchEmp").val();
				$.ajax({
					url:"searchEmp.ch",
					data:{
						empNo:${loginUser.empNo},
						empName:keyword
					},
					success:function(list){
						let value="";
						for(let i=0; i<list.length; i++){
							value += '<div class="indiv-list">'
										+ '<input type="hidden" name="empNo" value="'+ list[i].empNo +'">'
										+ '<div class="img-area">';
										if(list[i].empProfile == null){
											value += '<img src="resources/chat-images/rockstar.png">';
										}else{
											value += '<img src="'+ list[i].empProfile +'">';
										}
											
								value += '</div>'
										+ '<div class="room-info">'
											+ '<span class="dept-name">'+ list[i].deptName +'</span>'
											+ '<span class="emp-name">'+ list[i].empName +'</span>'
											+ '<span class="job-name">'+ list[i].jobName +'</span>';
										if(list[i].status == 'WO'){
											value += ' <span class="badge work-status rounded-pill text-bg-success">근무중</span>';
										}else if(list[i].status == 'ME'){
											value += ' <span class="badge work-status rounded-pill text-bg-secondary">회의중</span>';
										}else{
											value += ' <span class="badge work-status rounded-pill text-bg-light">부재중</span>';
										}
											
									value += '</div>'
									+ '</div>';	
						}
						$(".list-area").html(value);
						
					}
				})
			})
			$("#search-icn").click(function(){
				let keyword = $("#searchEmp").val();
				$.ajax({
					url:"searchEmp.ch",
					data:{
						empNo:${loginUser.empNo},
						empName:keyword
					},
					success:function(list){
						let value="";
						for(let i=0; i<list.length; i++){
							value += '<div class="indiv-list">'
										+ '<input type="hidden" name="empNo" value="'+ list[i].empNo +'">'
										+ '<div class="img-area">';
										if(list[i].empProfile == null){
											value += '<img src="resources/chat-images/rockstar.png">';
										}else{
											value += '<img src="'+ list[i].empProfile +'">';
										}
											
								value += '</div>'
										+ '<div class="room-info">'
											+ '<span class="dept-name">'+ list[i].deptName +'</span>'
											+ '<span class="emp-name">'+ list[i].empName +'</span>'
											+ '<span class="job-name">'+ list[i].jobName +'</span>';
										if(list[i].status == 'WO'){
											value += ' <span class="badge work-status rounded-pill text-bg-success">근무중</span>';
										}else if(list[i].status == 'ME'){
											value += ' <span class="badge work-status rounded-pill text-bg-secondary">회의중</span>';
										}else{
											value += ' <span class="badge work-status rounded-pill text-bg-light">부재중</span>';
										}
											
									value += '</div>'
									+ '</div>';	
						}
						$(".list-area").html(value);
						
					}
				})
			})
		</script>
	
		<script>
			$(function(){
				let count = 0;
				$(".list-area").on("click", ".indiv-list", function(){
					$(".indiv-list").each(function(){
						$(this).click(function(){

							count++;
							let no = $(this).children("input").val();
							
							var wName = "room" + no; // 새창의이름

							var options = 'top=500, left=1400, width=400, height=600, status=no, menubar=no, toolbar=no, titlebar=no, resizable=no, location=no, scrollbars=no';
							var url = "chatRoom.ch?no=" + no;
							window.open(url, wName, options);
						})
					})
				})
				
				
			})
		</script>
		
    </div>
    <jsp:include page="chatFooter.jsp"/>
    
</body>
</html>