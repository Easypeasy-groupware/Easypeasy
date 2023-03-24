<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* sidebar 스타일 */
    .sidebar {top: 0; left: 0; width: 200px; height: 1000px; float: left; border-right: 2px solid rgb(185, 187, 221);}
    h4 {text-align: center;}
    #topbtn{width:100%; height:35px; margin:auto; margin-bottom:15px; padding:5px 0 5px 0; background-color: rgb(142, 161, 122); border-radius:4px; text-align:center; justify-content: center;}
  	
	.menu-title{margin:20px 0 20px 0; text-align:center;}
	#title{font-size:20px; font-weight:600; color:rgb(93, 109, 75);}
	#title:hover{color:rgb(58, 69, 47); text-decoration:none;}
    
    .menu {margin-top: 20px;}
	.menu ul {list-style: none; padding: 0; margin: 0;}
	.menu li {margin-bottom: 5px; text-align: center;}
	.menu a {display: inline-block; padding: 10px; color: #333; text-decoration: none; transition: background-color 0.3s ease-in-out;}
	.menu a:hover {background-color: #f2f2f2;}
	.submenu ul {list-style: none; padding: 0; margin: 0; display: none;}
	.submenu li {margin-bottom: 5px;}
	.submenu a {display: block; padding: 10px; color: #333; text-decoration: none; transition: background-color 0.3s ease-in-out;}
	.submenu a:hover {background-color: #f2f2f2;}
	.active {background-color: #f2f2f2;}
	
</style>
</head>
<body>
	 <div class="sidebar">
          <!-- sidebar 내용 -->
          <div class="sidebar">
          	<div class="menu-title">
				<a href="" id="title">게시판</a>
			</div>
			<%-- <c:if test="${ loginUser.deptCode eq 'D1' }"> --%>
            	<button type="button" class="btn btn-success" id="topbtn" onclick="location.href='enrollSetting.bo';">게시판 추가</button>
            <%-- </c:if> --%>
            <div class="menu">
                <ul>
                    <li><a href="list.bo">전체 공지사항</a>
                    <%-- <c:if test="${ loginUser.deptCode eq 'D1' }"> --%>
                    		<a href="updateSettingForms.bo"><img src="resources/common_images/board_icon.png" style="width:20px; height:20px;"></a>
                    <%-- </c:if> --%>
                    </li>
                    <li><a href="food.bo?boardCno=2">식단표</a>
                    <%-- <c:if test="${ loginUser.deptCode eq 'D1' }"> --%>
                    		<a href="updateSettingForm.bo"><img src="resources/common_images/board_icon.png" style="width:20px; height:20px;"></a>
                    <%-- </c:if> --%>
                    </li>
                        
                    <li><a href="free.bo?boardCno=3">자유게시판</a>
                    <%-- <c:if test="${ loginUser.deptCode eq 'D1' }"> --%>
                    		<a href="updateSettingForm.bo"><img src="resources/common_images/board_icon.png" style="width:20px; height:20px;"></a>
                    <%-- </c:if> --%>
                    </li>
                    <li><a href="comm.bo?boardCno=4">커뮤니티</a>
                    <%-- <c:if test="${ loginUser.deptCode eq 'D1' }"> --%>
                    		<a href="updateSettingForm.bo"><img src="resources/common_images/board_icon.png" style="width:20px; height:20px;"></a>
                    <%-- </c:if> --%>
                    </li>
    
                    <li><a href="deplist.bo?boardCno=5">부서 공지사항</a>
                    <%-- <c:if test="${ loginUser.deptCode eq 'D1' }"> --%>
                    		<a href="updateSettingForm.bo"><img src="resources/common_images/board_icon.png" style="width:20px; height:20px;"></a>
                    <%-- </c:if> --%>
                    </li> 
                    <li><a href="defree.bo?boardCno=6">부서 자유게시판</a>
                    <%-- <c:if test="${ loginUser.deptCode eq 'D1' }"> --%>
                    		<a href="updateSettingForm.bo"><img src="resources/common_images/board_icon.png" style="width:20px; height:20px;"></a>
                    <%-- </c:if> --%>
                    </li>
                </ul>
            </div>
        </div>
    
     </div>
</body>
</html>