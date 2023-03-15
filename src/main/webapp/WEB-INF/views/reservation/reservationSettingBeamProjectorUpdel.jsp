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
        padding-left: 10px;
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
                <h5>자산 수정/삭제</h5>
            </span>
        </div>
        <br>
        <form action="beamProjectorUp.re" method="post">
        <input type="hidden" name="resourceNo" value=${ bno }>
            <div id="content-1">
                <table>
                    <tr>
                        <td width="70">자산명</td>
                        <td>
                            <input type="text" name="resourceName" value="${ bname }" size="100" required>
                        </td>
                    </tr>
                </table>
                <br>
                <div align="center">
                    <button class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">확인</button>&nbsp;&nbsp;
                    <input type="reset" class="btn btn-sm btn-light" style="background: white;" value="취소">&nbsp;&nbsp;
                    <a href="beamProjectorDel.re?bno=${ bno }" class="btn btn-sm" style="border: 1px solid lightgray; background: white;">삭제</a>
                </div>
            </div>
        </form>
    </div>

</body>
</html>