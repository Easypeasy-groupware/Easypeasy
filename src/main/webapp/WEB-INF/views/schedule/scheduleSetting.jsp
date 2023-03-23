<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        box-sizing: border-box;
    }
    
    #content{
        border-left: 1px solid lightgray;
        width: 1000px;
        float: left;
        box-sizing: border-box;
    }

    #con-title h5{
    	color:rgb(93, 109, 75);
        padding-left: 25px;
        padding-top: 15px;
    }
    #con-title input{
        border: 1px solid lightgray;
        border-radius: 5px;
    }

    #add{
        display: inline-block;
        margin-left: 25px;
        margin-top: 10px;
    }
    #add div{
        display: inline-block;
        margin-left: 10px;
    }
    #add button{
        border: 1px solid lightgray;
        background: rgb(214, 223, 204);
        color: white;
        margin-left: 5px;
    }

    #del{
        display: inline-block;
        padding-left: 15px;
    }

    .table{
        text-align: center;
    }



	#update_calendar_view {
	    width: 300px;
	    height: 280px;
	    padding-top: 15px;
	    position: absolute;
	    top: 450px;
	    left: 950px;
	    border-radius: 10px;
	    border: 1px solid rgb(185, 187, 221);
	    background: white;
	    z-index: 10;
	    display: none;
	}
	
	.upDel_calendar{
		cursor: pointer;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

    <jsp:include page="sidebar.jsp"/>

	<div id="content">
        <div id="con-title">
            <span>
                <h5>내 캘린더 관리</h5>
            </span>
            <br>
            <div id="add">
                <div>
                    <button class="btn btn-sm btn-light" style="margin: 0 -20px -5px -10px;">캘린더 추가</button>
                </div>
            </div>
        </div>
        <br>
        <table class="table table-hover table-sm setting-list">
            <thead>
                <tr>
                    <th>캘린더</th>
                    <th>기본 캘린더</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="c" items="${ myCalList }">
            		<c:choose>
               			<c:when test="${ c.calDefault eq 'Y' }">
               				<tr>
			                    <td class="upDel_calendar">(기본) ${ c.calTitle }</td>
			                    <input type="hidden" value="${ c.calNo }">
			                    <td>
			                        <div class="custom-control custom-radio">
		                                <input type="radio" class="custom-control-input" id="Y" name="default" value="">
		                                <label class="custom-control-label" for="Y"></label>
		                            </div>
			                    </td>
			                </tr>
               			</c:when>
               			<c:otherwise>
               				<tr>
			                    <td class="upDel_calendar">${ c.calTitle }</td>
			                    <input type="hidden" value="${ c.calNo }">
			                    <td>
			                        <div class="custom-control custom-radio">
		                                <input type="radio" class="custom-control-input" id="customRadio${ c.calNo }" name="default" value="">
		                                <label class="custom-control-label" for="customRadio${ c.calNo }"></label>
		                            </div>
			                    </td>
			                </tr>
               			</c:otherwise>
               		</c:choose>
            	</c:forEach>
            </tbody>
        </table>
    </div>
    
    
    
    <script>
    
    	$(document).on("click", ".setting-list>tbody>tr>.upDel_calendar", function(){
				
			location.href = 'settingUpdel.cal?no=' + $(this).next().val();
			
		})
    

        // 체크 박스
        function allChecked(target){
    		if($(target).is(":checked")){
    			$(".check").prop("checked", true);
    		}else{
    			$(".check").prop("checked", false);
    		}
    	}
    	
    	
    	/*
    	function checkClicked(){
    		//체크박스 전체개수
    		var allCount = $("input:checkbox[name=check]").length;
    		
    		//체크된 체크박스 전체개수
    		var checkedCount = $("input:checkbox[name=check]:checked").length;
    		
    		//체크박스 전체개수와 체크된 체크박스 전체개수가 같으면 체크박스 전체 체크
    		if(allCount == checkedCount){
    			$(".allCheck").prop("checked", true);
    		}else{ //같지않으면 전체 체크박스 해제
    			$(".allCheck").prop("checked", false);
    		}
    		
    	}
    	*/
    	
    	$("#Y").prop("checked", true);
    </script>

</body>
</html>