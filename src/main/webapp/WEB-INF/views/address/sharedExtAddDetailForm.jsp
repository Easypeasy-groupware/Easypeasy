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
    #main{position: absolute; top: 120px;}
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
        width:100%; height:100%;
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
    .wrap_btns{text-align:center;}
    .set-btn{border:0; border-radius: 5px; width:90px; height:30px; color:white;}
    #reset-btn{background:rgb(158, 158, 158); margin:0 5px 0 0;}
    #submit-btn{background:rgb(166, 184, 145);}

    /*그룹추가용 모달*/
    .modal-body, .modal-footer{text-align: center;}
    #modal-input{width:60%; height:40px; margin-top:10px; border:1px solid gray; border-radius:5px;}
    #modal-close-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(158, 158, 158); display:inline-block;}
    #modal-add-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(166, 184, 145); display:inline-block;}
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div id="main">
	
        <jsp:include page="addMenubar.jsp"/>
        
        <div class="content-outer">

            <div id="page-title"><span class="address-name">${ a.addName }</span>님의 연락처 정보</div>

            <br><br>

            <form action="updatePsAdd.ad" method="post">
                <input type="hidden" name="empNo" value="${ loginUser.empNo }">
                <input type="hidden" id="add-no" name="addNo" value="${ a.addNo }">
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
                        <td colspan="2">
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
                
                <div class="wrap_btns">
	                <c:if test="${loginUser.deptCode eq 'D1'}">
						<button type="button" class="set-btn" id="reset-btn">삭제</button>
					</c:if>
	                
	                <c:choose>
	                	<c:when test="${ a.empNo eq loginUser.empNo }">
	                		<button type="submit" class="set-btn" id="submit-btn">수정하기</button>
	                	</c:when>
	                	<c:otherwise>
	                	
	                		<c:if test="${ not empty list }">
	                		
	                			<c:forEach var="e" items="${ list }">
	                				<c:if test="${ e.empNo eq loginUser.empNo }">
	                					<button type="submit" class="set-btn" id="submit-btn">수정하기</button>
	                				</c:if>
	                			</c:forEach>
	                			
	                		</c:if>
	                		
	                	</c:otherwise>
	                </c:choose>
	                
                </div>
				

            </form>
        </div>
		
		<script>
			$(function(){
				$("#reset-btn").click(function(){
					let no = $("#add-no").val();
					location.href="deleteSharedOne.add?no=" + no;
				})
			})
		</script>
		
		
		
		</div>
    </div>
</body>
</html>