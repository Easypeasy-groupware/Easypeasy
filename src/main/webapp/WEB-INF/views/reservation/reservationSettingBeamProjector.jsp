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
    
    #main{  
        position: absolute; top: 120px;
    }
    
    #content{
        width: 1000px;
        float: left;
    }

	.dropdown{
		margin-top: 10px;
		float: right;
	}
	.dropdown button{
		background: rgb(214, 223, 204);
		color: white;
		border: none;
	}
	.btn:not(:disabled):not(.disabled) {
    	cursor: pointer;
    	background: rgb(214, 223, 204);
		color: white;
	}
	
   
    #con-title h5{
    	color:rgb(93, 109, 75);
        padding-left: 10px;
        padding-top: 12px;
        display: inline-block;
    }

    #content-1>h5{
        margin-left: 25px;
        padding-top: 20px;
    }
    #content-1>table{
        width: 980px;
        text-align: center;
    }
    #add{
        margin-left: 10px;
        margin-bottom: 15px;
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
                    <h5>자산 관리</h5>
                </span>
                <div class="dropdown">
                    <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown">
                        회의실/빔프로젝터
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="settingMettingRoomView.re">회의실</a>
                        <a class="dropdown-item" href="settingBeamProjectorView.re">빔프로젝터</a>
                    </div>
                </div>
            </div>
            <br>
            <div id="content-1">
                <a id="add" href="resourceAddBeamProjectorView.re" class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">자산 추가</a>
                <table align="center" class="table table-hover table-sm">
                    <thead>
                        <tr>
                            <th>항목</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="rb" items="${ beList }">
                            <tr>
                                <td>${ rb.resourceName }</td>
                                <td>
                                    <button onclick="location.href='upDelBeamProjector.re?bno=${ rb.resourceNo }&bname=${ rb.resourceName }'" style="border: none; background: none;"><i class="fas fa-cog"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>