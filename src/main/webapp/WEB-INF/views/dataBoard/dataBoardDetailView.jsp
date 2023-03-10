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
        box-sizing: border-box;
    }
    
    #title h5{
        padding-left: 25px;
        padding-top: 10px;
        float: left;
    }

    #content>table{
        width: 950px;
        text-align: center;
    }
    #content>table>thead{
        border-left: 1px solid white;
        border-right: 1px solid white;
        border-top: 2px solid gray;
        border-bottom: 2px solid gray;
    }
    #content>table>tbody{
        border-left: 1px solid white;
        border-right: 1px solid white;
    }
    #content>table>tfoot{
        border-left: 1px solid white;
        border-right: 1px solid white;
        border-top: 2px solid gray;
        border-bottom: 2px solid gray;
    }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<jsp:include page="sidebar.jsp"/>

    <div id="content">
        <div id="title">
            <span>
                <h5>전사 자료실</h5>
            </span>
        </div>
        <br><br><br>
        <c:if test="${ loginUser.deptCode eq 'D2' }">
	        <div style="margin-left: 25px;">
	            <a href="updateForm.db?no=${ db.dbNo }" class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">수정</a>&nbsp;&nbsp;
	            <a href="delete.db?no=${ db.dbNo }" class="btn btn-sm btn-light">삭제</a>
	        </div>
	    </c:if>
        <br>
        <table border="1" align="center">
            <thead>
                <tr height="35">
                    <th width="130">제목</th>
                    <td style="text-align: left;">
                        ${ db.dbTitle }
                    </td>
                </tr>
                <tr height="35">
                    <th>등록일</th>
                    <td style="text-align: left;">
                        ${ db.createDate }
                    </td>
                </tr>
                <tr height="35">
                    <th>조회수</th>
                    <td style="text-align: left;">${ db.count }</td>
                </tr>
            </thead>
            <tbody>
                <tr height="200">
                    <td colspan="2" style="text-align: left;">
						${ db.dbContent }
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr height="35">
                    <th>첨부파일</th>
                    <td style="text-align: left;">
						<a href="${ db.changeName }" download="${ db.originName }">${ db.originName }</a>
					</td>
                </tr>
            </tfoot>
        </table>
        <br>
        <div style="margin-left: 935px">
            <a href="list.db" class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">목록</a>
        </div>
        <br>

        <table align="center" border="1">
            <tr height="35" style="border-top: 2px solid gray;">
                <th width="130">이전글 <i id="upDown1" class="fas fa-regular fa-angle-up"></i></th>
                <td style="text-align: left;">
                    이전글이 없습니다
                </td>
            </tr>
            <tr height="35" style="border-bottom: 2px solid gray;">
                <th>다음글 <i id="upDown1" class="fas fa-regular fa-angle-down"></i></th>
                <td style="text-align: left;">
                    1월 시국세
                </td>
            </tr>
        </table>
    </div>

</body>
</html>