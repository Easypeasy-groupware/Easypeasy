<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
<style>
    .content-outer{width:1000px; padding-left:10px;  padding-top:20px;}
    .content-outer *{box-sizing: border-box;}
    #page-title{color:rgb(96, 96, 96); font-size:18px; font-weight:600; text-align:center; margin:30px 0 0 0;}
   	.address-name{color:rgb(166, 184, 145);}

    /*테이블*/
    .input-table{
        margin-left:400px;
        border-collapse: separate; border-spacing:0px 10px; /*셀간격*/
    }
    .input-table td{height:30px;}
    .tb-input{
        width:100%; height:100%;
        border:1px solid gray; border-radius:5px;
        padding-left:10px;
    }

    .td-select{
        width:98%; height:100%;
        border:1px solid gray; border-radius:5px;
        padding-left:10px;
    }
    #add-btn{
        width:100%; height:100%;
        border:0; border-radius:5px; 
        color:white; background:rgb(166, 184, 145);
    }
    .td-textarea{border:1px solid gray; border-radius:5px;}

    /*버튼*/
    .set-btn{border:0; border-radius: 5px; width:90px; height:30px; color:white;}
    #reset-btn{background:rgb(158, 158, 158); margin:0 5px 0 350px;}
    #submit-btn{background:rgb(166, 184, 145);}

    /*그룹추가용 모달*/
    .modal-body, .modal-footer{text-align: center;}
    #modal-input{width:60%; height:40px; margin-top:10px; border:1px solid gray; border-radius:5px;}
    #modal-close-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(158, 158, 158); display:inline-block;}
    #modal-add-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(166, 184, 145); display:inline-block;}
</style>
</head>
<body>
	
	<jsp:include page="addMenubar.jsp"/>
	
    <div class="content-outer">

        <div id="page-title"><span class="address-name">${ a.addName }</span>님의 연락처 정보</div>

        <br><br>

        <form action="updatePsAdd.ad" method="post">
        	<input type="hidden" name="empNo" value="${ loginUser.empNo }">
        	<input type="hidden" name="addNo" value="${ a.addNo }">
            <table class="input-table">
                <colgroup>
                    <col style="width:100px;">
                    <col style="width:300px;">
                    <col style="width:100px;">
                </colgroup>
                <tr>
                    <td>이름</td>
                    <td colspan="2">
                        <input type="text" class="tb-input" value="${ a.addName }" name="addName" required>
                    </td>
                </tr>
                <tr>
                    <td>회사</td>
                    <td colspan="2">
                        <input type="text" class="tb-input" value="${ a.addEmp }"  name="addEmp">
                    </td>
                </tr>
                <tr>
                    <td>부서</td>
                    <td colspan="2">
                        <input type="text" class="tb-input" value="${ a.addDept }" name="addDept">
                    </td>
                </tr>
                <tr>
                    <td>직위</td>
                    <td colspan="2">
                        <input type="text" class="tb-input" value="${ a.addJob }" name="addJob">
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td colspan="2">
                        <input type="email" class="tb-input" value="${ a.email }" name="email">
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td colspan="2">
                        <input type="text" class="tb-input" value="${ a.phone }" name="phone">
                    </td>
                </tr>
                <tr>
                    <td>그룹</td>
                    <td>
                        <select class="td-select" name="groupNo" >
                        	<option>선택안함</option>
                        	<c:forEach var="p" items="${ pList }">
			        			<option value="${ p.groupNo }"> ${ p.groupName } </option>
				        	</c:forEach>
                        </select>
                    </td>
                    <script>
                    	$(function(){
                    		$(".td-select").val("${a.groupNo}").prop("selected", true);
                    	})
                    </script>
                    <td>
                        <button type="button" id="add-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">새그룹</button>
                    </td>
                </tr>
                <tr>
                    <td>회사전화</td>
                    <td colspan="2">
                        <input type="text" class="tb-input" name="empPhone" value="${ a.phone }" >
                    </td>
                </tr>
                <tr>
                    <td>회사주소</td>
                    <td colspan="2">
                        <input type="text" class="tb-input" name="empAddress" value="${ a.empAddress }" >
                    </td>
                </tr>
                <tr>
                    <td>메모</td>
                    <td colspan="2">
                        <textarea class="td-textarea" rows="4" style="resize:none; width:100%" name="memo">${ a.memo }</textarea>
                    </td>
                </tr>
            </table>

            <br>

            <button type="button" class="set-btn" id="reset-btn">삭제</button>
            <button type="submit" class="set-btn" id="submit-btn">수정하기</button>

        </form>
    </div>

    <!--새로운 그룹 추가용 모달-->
    <div class="modal fade" id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <p class="modal-title" style="font-weight:600">새 그룹 추가</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                    <div class="modal-body">
                        <input type="text" id="modal-input" class="group-input" name="groupName">
                        <br><br>
                        <button type="button" data-bs-dismiss="modal" id="modal-close-btn">닫기</button>
                        <button type="button" id="modal-add-btn" onclick="addGroup();">추가</button>
                    </div>


            </div>
          </div>
    </div>
    <script>    	
    	function addGroup(){ /* 그룹 추가용 ajax */
    		if($(".group-input").val().trim().length > 0) {
    			
    			$.ajax({
    				url:"insertPsGroup.add",
    				data:{
    					empNo:${loginUser.empNo},
    					groupName:$(".group-input").val()
    				},
    				success:function(result){
    					if(result == "success") {
    						console.log(result);
    						$(".group-input").val("");
    						swal({
            		            title: "그룹 추가", 
            		            text: "새로운 그룹이 추가되었습니다", 
            		            icon: "success",
            		            button: "확인",
            		         });
    						selectGroupList();
    					}else{
    						$(".group-input").val("");
        					console.log(result);
        					swal({
            		            title: "그룹 추가", 
            		            text: "이미 중복된 그룹명이 있습니다", 
            		            icon: "error",
            		            button: "확인",
            		         });
    					}
    						
    				},error:function(){
    					console.log("개인주소록 그룹 추가용 ajax 통신 실패");
    				}
    				
    			});
    		}else {
    			 swal({
    		            title: "그룹 추가", 
    		            text: "그룹명을 입력 해주세요", 
    		            icon: "error",
    		            button: "확인",
    		         });

    		}
    	}
    	
    	function selectGroupList(){
    		$.ajax({
    			url:"listPsGroup.add",
    			data:{empNo:${loginUser.empNo}},
    			success:function(list){
    				console.log(list);
    				let value="<option>선택안함</option>";
    				for(let i=0; i<list.length; i++){
    					value += "<option name='groupNo' value='" + list[i].groupNo + "'>"
    					         	+ list[i].groupName
    					        + "</option>";
    				}
    				$(".td-select").html(value);
    			},error:function(){
    				console.log("개인주소록 그룹 조회용 ajax 통신 실패");	
    			}
    		});
    	}
    </script>

</body>
</html>