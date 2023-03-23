<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content{
        border-left: 1px solid lightgray;
        width: 1000px;
        float: left;
    }

    #con-title h5{
    	color:rgb(93, 109, 75);
        padding-left: 20px;
        padding-top: 15px;
        display: inline-block;
    }
   
    #content-1{
        padding-left: 25px;
    }
    #content-1>table{
        width: 100%;
    }
    #content-1 input{
        border: 1px solid lightgray;
        border-radius: 5px;
    }
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <jsp:include page="sidebar.jsp"/>

	<div id="content">
        <div id="con-title">
            <span>
                <h5>캘린더 추가</h5>
            </span>
        </div>
        <br>
        <form action="insertBtn.cal" method="post">
        <input type="hidden" name="empNo" value="${loginUser.empNo}">
            <div id="content-1">
                <table>
                    <tr height="50px">
                        <td width="100">캘린더명</td>
                        <td>
                            <input type="text" name="calTitle" size="100" required>
                        </td>
                    </tr>
                    <tr height="50px">
                    	<td>캘린더 색상</td>
                    	<td>
                    		<input type="color" name="calColor" required>
                    	</td>
                    </tr>
                </table>
                <br>
                <div align="center">
                    <a href="setting.sc" class="btn btn-sm" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">목록으로 돌아가기</a>&nbsp;&nbsp;
                    <button class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">캘린더 추가하기</button>
                </div>
            </div>
        </form>
    </div>
    
    

</body>
</html>