<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1200px;
        margin: auto;
    }

    .title{
        width: 1200px;
        height: 100px;
        box-sizing: none;
        float: left;
        font-size: 30px;
        
    }
	.innerOuter{
		margin-left: 150px;
	}
    .img{
        width: 300px;
        height: 300px;
        margin: 80px;
        border: 1px solid gray;
        float: left;
        border-radius: 150px;
    }
    .img-area{
    	float:left;
    }
    .content{
        font-size: 15px;
        width: 800px;
        border-top: 1px solid lightgray;
        border-collapse: collapse;
        margin: 0 auto;
    }
    .update-btn{
        margin-top: 230px;
        border: none;
        width: 200px;
        height: 30px;
        font-size: 15px;
        font-weight: bold;
        
    }
    .save-btn{
        border: none;
        width: 90px;
        height: 30px;
        font-size: 15px;
        font-weight: bold;
        background-color: rgb(214, 223, 204);
        margin-left: 800px;
    }
    #pwdBtn{
    	border: none;
        width: 110px;
        height: 30px;
        font-size: 15px;
        font-weight: bold;
        background-color: rgb(185, 187, 221);
    }
    .updateForm{
        float: left;
    }
   th, td {
    border-bottom: 1px solid lightgray;
    padding: 10px;
   }
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!--Popper JS --> 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

	<div class="outer">
        
        
        <div class="title"><b>마이페이지</b><hr></div>
		
		<div class="innerOuter">
        <div class="box">
            <button class="update-btn" onclick="$('#profileImgFile').click();">프로필 사진 변경하기</button>
        <div class="img-area">
            <img  class="img" id="profileImg" src="<c:out value='${ loginUser.empProfile }' default='resources/profile_images/default_profile.png' />" >
                <input type="file" id="profileImgFile" style="display:none;">
        </div>
        
        <script>
            	$(function(){
            		$("#profileImgFile").change(function(){
            			//* 비동기식으로 첨부파일 업로드
            			//새로운 파일이 선택되는 순간 곧바로 ajax요청으로 첨부파일 넘겨서 => 서버 업로드 => db에도 update
            			
            			let formData = new FormData();  //가상의 form요소
            			
            			let uploadFile = this.files[0];  //현재선택된 파일 객체
            			//console.log(uploadFile);
            			
            			formData.append("uploadFile", uploadFile);
            			formData.append("empId", '${loginUser.empId}'); //el구문을 사용할때 문자열로 써야하기 때문에 ''꼭 붙여서 사용하기
            			formData.append("originalFile", '${loginUser.empProfile}'); //기존의 프로필이미지 경로
            			
            			$.ajax({
            				url:"uploadProfile.me",
            				data:formData, //파일객체가 담겨있는 form
            				processData:false, 
            				contentType:false,
            				type:"POST",
            				success:function(){
            					location.reload();
            				},
            				error:function(){
            					
            				}
            				
            			})
            		})
            	})
            </script>

        <div class="updateForm">
		<form action="update.mp" method="post">
					<input type="hidden" name="empId" value="${ loginUser.empId }">
					<input type="hidden" name="empNo" value="${ loginUser.empNo }">
					
                    <label for="empName">이름 :</label>
                    <input type="text" class="form-control" id="empName" name="empName" value="${ loginUser.empName }" readonly><br>
                    
                    <label for="company">회사 :</label>
                    <input type="text" class="form-control" id="company" name="company" value="EASYPEASY" readonly><br>
                    
                    <label for="deptCode"> &nbsp; 부서 :</label>
                    <input type="text" class="form-control" id="deptCode" name="deptCode" readonly><br>
                    
                    <label for="jobCode"> &nbsp; 직급 :</label>
                    <input type="text" class="form-control" id="jobCode" name="jobCode" readonly><br>
                    
                    <label for="email"> &nbsp; 이메일 :</label>
                    <input type="email" class="form-control" id="email" name="email" value="${ loginUser.email }" readonly><br>
                    
                    <label for="phone"> &nbsp; 휴대전화 :</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="${ loginUser.phone }"><br>

                    <label for="hireDate"> &nbsp; 입사일 :</label>
                    <input type="text" class="form-control" id="hireDate" name="hireDate" value="${ loginUser.hireDate }" readonly><br>

                    <label for="address"> &nbsp; 주소 :</label>
                    <input type="text" class="form-control" id="address" name="address" value="${ loginUser.address }"><br>
                    
                    <script>
                    	$(function(){
                    		if("${loginUser.deptCode}" == "D1"){
                    			$("#deptCode").val('인사관리팀');
                    		}
                    		if("${loginUser.deptCode}" == "D2"){
                    			$("#deptCode").val('경영지원팀');
                    		}
                    		if("${loginUser.deptCode}" == "D3"){
                    			$("#deptCode").val('영업1팀');
                    		}
                    		if("${loginUser.deptCode}" == "D4"){
                    			$("#deptCode").val('영업2팀');
                    		}
                    		if("${loginUser.deptCode}" == "D5"){
                    			$("#deptCode").val('영업3팀');
                    		}
                    		if("${loginUser.deptCode}" == "D6"){
                    			$("#deptCode").val('마케팅팀');
                    		}
                    	})
                    	
                    	$(function(){
                    		if("${loginUser.jobCode}" == "J1"){
                    			$("#jobCode").val('사원');
                    		}
                    		if("${loginUser.jobCode}" == "J2"){
                    			$("#jobCode").val('대리');
                    		}
                    		if("${loginUser.jobCode}" == "J3"){
                    			$("#jobCode").val('과장');
                    		}
                    		if("${loginUser.jobCode}" == "J4"){
                    			$("#jobCode").val('부장');
                    		}
                    		if("${loginUser.jobCode}" == "J5"){
                    			$("#jobCode").val('상무');
                    		}
                    		if("${loginUser.jobCode}" == "J6"){
                    			$("#jobCode").val('대표');
                    		}
                    	})
                    </script>
        <br>
        <button class="save-btn" type="submit">저장하기</button>
        <button id="pwdBtn" type="button" data-toggle="modal" data-target="#updatePwdForm">비밀번호변경</button>
        </form>
        <br><br><br><br><br>
        
        
        <!-- 비밀번호 변경용 Modal -->
		   <div class="modal" id="updatePwdForm">
		     <div class="modal-dialog">
		       <div class="modal-content">
		   
		         <div class="modal-header">
		           <h4 class="modal-title">비밀번호 변경</h4>
		           <button type="button" class="close" data-dismiss="modal">&times;</button>
		         </div>
		   
		         <div class="modal-body" align="center">
		           <form action="updatePwd.ep" method="post">
		              <input type="hidden" name="userId" value="${ loginUser.empId }">
		              <table>
		                 <tr>
		                    <td>현재 비밀번호</td>
		                    <td><input type="password" name="empPwd" required></td>
		                 </tr>
		                 <tr>
		                    <td>변경할 비밀번호</td>
		                    <td><input type="password" name="updatePwd" required></td>
		                 </tr>
		              </table>
		              <br>
		              <button type="submit" class="btn btn-sm btn-secondary" >비밀번호 변경</button>
		           </form>
		         </div>
		   
		       </div>
		     </div>
		   </div>
    </div>
    </div>
    </div>
    
    
    

</body>
</html>