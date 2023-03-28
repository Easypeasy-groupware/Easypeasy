<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
        box-sizing: border-box;
    }
    
    #title h5{
        padding-left: 25px;
        padding-top: 10px;
        float: left;
    }

    #content>table{
    	margin-left: 20px;
        width: 98%;
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
    
    .nextPrev a{
    	text-decoration: none;
        color: black;
    }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

    <div id="main">
	
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
                    <a onclick="postFormSubmit(1);" class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">수정</a>&nbsp;&nbsp;
                    <a onclick="postFormSubmit(2);" class="btn btn-sm btn-light">삭제</a>
                </div>
            </c:if>
            
            <form action="" method="post" id="postForm">
                <input type="hidden" name="no" value="${ db.dbNo }">
                <!-- 현재 게시글의 첨부파일에 대한 경로 넘기기 -->
                <input type="hidden" name="filePath" value="${ db.changeName }">
            </form>
            
            <script>
                function postFormSubmit(num){ // 숫자 받기 위한 num변수
                    if(num == 1){
                        $("#postForm").attr("action", "updateForm.db").submit();
                    }else{
                        $("#postForm").attr("action", "delete.db").submit();
                    }
                }
            </script>
            
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
                            <c:if test="${fn:contains(db.changeName, 'pdf')}">
                            	<a style="margin-left: 20px; font-weight:bold;" href="openPdf.db" onClick="window.open(this.href, '', 'width=900, height=600'); return false;" target="_blanck">미리보기</a>
                            </c:if>
                        </td>
                    </tr>
                </tfoot>
            </table>
            <br>
            <div style="margin-left: 950px">
                <a href="list.db" class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">목록</a>
            </div>
            <br>

            <table align="center" border="1">
                <tr height="35" class="nextPrev" style="border-top: 2px solid gray;">
                    <th width="130">다음글 <i id="upDown1" class="fas fa-regular fa-angle-up"></i></th>
                    <td style="text-align: left;">
                        <c:choose>
                            <c:when test="${ db.nextTitle eq null }">
                                다음글이 없습니다.
                            </c:when>
                            <c:otherwise>
                                <a href="detail.db?no=${ db.nextNo }">${ db.nextTitle }</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr height="35" class="nextPrev" style="border-bottom: 2px solid gray;">
                    <th>이전글 <i id="upDown1" class="fas fa-regular fa-angle-down"></i></th>
                    <td style="text-align: left;">
                        <c:choose>
                            <c:when test="${ db.prevTitle eq null }">
                                이전글이 없습니다.
                            </c:when>
                            <c:otherwise>
                                <a href="detail.db?no=${ db.prevNo }">${ db.prevTitle }</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    

</body>
</html>