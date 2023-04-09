<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EasyPeasy-mail</title>
<style>
    
</style>
</head>
<body>
	
    <div id="search_bar">
        <form id="search" action="" method="POST">
            <select id="search_category" name="category">
                <option value="all">전체</option>
                <option value="name">이름</option>
                <option value="address">메일 주소</option>
                <option value="title">메일 제목</option>
                <option value="content">메일 내용</option>
            </select>
            <input type="text" id="keyword" name="keyword" value="">
            <input type="hidden" id="boxNum" name="boxNum" value="">
            <input type="hidden" id="cpage" name="cpage" value="1">
            <input type="hidden" id="search_selected" value="${mail.category}">
            <button type="button" id="search_btn">검색</button>
        </form>
    </div>
            

    <script>
        // 검색
        let keyword = document.getElementById("keyword");
        document.getElementById("search_btn").addEventListener('click', function(){
            
            let form = document.getElementById("search");
            let keyword = document.getElementById("keyword");
            let boxNum = document.getElementById("boxNum");
            let boxNameElement = document.getElementById("mail_header_info");
            let boxName = boxNameElement.firstElementChild.innerHTML;
            let tagNo = document.getElementById("tagNo");
            let num = 0;
            console.log(tagNo);
            switch(boxName){
                case "받은 메일함" : num = 1;
                    break;
                case "오늘 온 메일함" : num = 2;
                    break;
                case "내게 쓴 메일함" : num = 3;
                    break;
                case "첨부파일 메일함" : num = 4;
                    break;
                case "보낸 메일함" : num = 5;
                    break;
                case "안읽은 메일함" : num = 6;
                    break;
                case "중요 메일함" : num = 7;
                    break;
                case "작성중인 메일함" : num = 8;
                    break;
                case "스팸 메일함" : num = 9;
                    break;  
                case "휴지통" : num = 10;
                    break; 
                default : num = 11;
            }
            boxNum.value = num;
            if(keyword.value != ""){
                if(tagNo != null){
                    form.append(tagNo);
                }
                form.action = "search.ma";
                console.log(form)
                form.submit();
            }else{
                alert("검색어를 입력해주세요.")
            }
        })

        keyword.addEventListener("keydown", function (event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                document.getElementById("search_btn").click();
            }
        });
    </script>
</body>
</html>