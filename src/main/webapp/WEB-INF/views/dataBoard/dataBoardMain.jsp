<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{
        box-sizing: border-box;
    }
    
    .outer{
        width: 1200px;
        height: 1000px;
        margin: auto;
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
        float: left !important;
        border: 1px solid blue;
    }
    .input-group{
        margin-left: 750px;
        width: 250px !important;
        height: 30px;
        padding-top: 10px;
    }
    
    .form-control{
    	width: 100px;
    }

    #content>table{
        width: 950px;
        text-align: center;
    }

</style>
<body>
	<div class="outer">

        <div id="sidebar">
            <jsp:include page="sidebar.jsp"/>
        </div>
        <div id="content">
            <div id="title" style="border:1px solid gold;">
                <span>
                    <h5>전사 자료실</h5>
                </span>
                <form action="">
                    <div class="input-group mb-3 ">
                        <input type="text" class="form-control" placeholder="검색어를 입력해주세요" required>
                        <div class="input-group-append">
                            <button class="btn btn-secondary" type="submit">검색</button>
                        </div>
                    </div>
                </form>
            </div>
            <br>
            <a class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white; margin-left: 920px; margin-bottom: -15px;" href="enrollForm.da">글쓰기</a>
            <br><br>
            <table align="center" class="table table-hover table-sm">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>등록일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>5</td>
                        <td>브로셔</td>
                        <td>2023-03-02</td>
                        <td>22</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>소개자료</td>
                        <td>2023-03-02</td>
                        <td>20</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br>

        <!-- 페이징 처리 -->
        <div id="pagingArea">

        </div>

    </div>
</body>
</html>