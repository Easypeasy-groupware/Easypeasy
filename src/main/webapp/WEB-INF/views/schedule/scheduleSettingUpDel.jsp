<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #main{  
        position: absolute; top: 120px;
    }
    
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

    <div id="main">

        <jsp:include page="sidebar.jsp"/>

        <div id="content">
            <div id="con-title">
                <span>
                    <h5>캘린더 수정/삭제</h5>
                </span>
            </div>
            <br>
            <form action="update.cal" method="post">
            <input type="hidden" name="calNo" value="${ c.calNo }">
                <div id="content-1">
                    <table>
                        <tr height="50px">
                            <td width="100">캘린더명</td>
                            <td>
                                <input type="text" name="calTitle" value="${ c.calTitle }" size="100">
                            </td>
                        </tr>
                        <tr height="50px">
                            <td>캘린더 색상</td>
                            <td>
                                <input type="color" name="calColor" value="${ c.calColor }">
                            </td>
                        </tr>
                    </table>
                    <br>
                    <div align="center">
                        <a href="setting.sc" class="btn btn-sm" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">목록으로 돌아가기</a>&nbsp;&nbsp;
                        <button class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">캘린더 수정하기</button>&nbsp;&nbsp;
                        <a href="delete.cal?no=${ c.calNo }" class="btn btn-sm" id="deleteBtn" style="border: 1px solid lightgray; background: white;">캘린더 삭제하기</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <script>
	    var calDefault = "<c:out value='${ c.calDefault }'/>";
		
		if(calDefault == "Y"){
			$("#deleteBtn").css("pointer-events", "none");
			$("#deleteBtn").css("cursor", "default");
			$("#deleteBtn").css("background", "rgb(235, 235, 235)");
			$("#deleteBtn").css("color", "white");
		}
    </script>

</body>
</html>