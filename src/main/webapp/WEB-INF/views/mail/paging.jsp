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

    #paging{text-align: center; display: inline-block; padding-left :0; margin-top: 20px;}
    #paging li {text-align: center; float: left; list-style:none; border-radius:10px; margin:2px; background-color: rgb(234, 234, 234);}
    #paging li a {display: block; font-size: 12px; color: black; padding: 5px 10px; box-sizing: border-box; text-decoration-line:none;}
    #paging li.on {background:rgb(166, 184, 145);}
    #paging li.on a {cursor: pointer; color: white;}

    
</style>
</head>
<body>
	
    <c:if test="${ not empty pgMailList }">
        <div align="center">
            <ul id="paging">
                <c:choose>
                    <c:when test="${ mailPi.currentPage == 1 }">
                        <li><a> < </a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="on"><a id="${ mailPi.currentPage-1 }"> < </a></li>
                    </c:otherwise>
                </c:choose>
                <c:forEach var="p" begin="${ mailPi.startPage }" end="${ mailPi.endPage }">
                    <li class='on'><a id="${ p }"> ${ p } </a></li>
                </c:forEach>
                <c:choose>
                    <c:when test="${ mailPi.currentPage == mailPi.maxPage }">
                        <li><a> > </a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="on"><a id="${ mailPi.currentPage+1 }"> > </a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </c:if>

    <script>

        // 페이징 버튼
        let pagingBtn = document.querySelectorAll('.on');
        pagingBtn.forEach(function(btn){
            btn.addEventListener('click', function(){
                let boxNameElement = document.getElementById("mail_header_info");
                let boxName = boxNameElement.firstElementChild.innerHTML;
                let url;
                switch(boxName){
                    case "오늘 온 메일함" : url = "todayList.ma";
                        break;
                    case "내게 쓴 메일함" : url = "tomeList.ma";
                        break;
                    case "첨부파일 메일함" : url = "attachList.ma";
                        break;
                    case "안읽은 메일함" : url = "unreadList.ma";
                        break;
                    case "중요 메일함" : url = "imporList.ma";
                        break;
                    case "스팸 메일함" : url = "spamList.ma";
                        break;
                    case "휴지통 " : url = "deleteList.ma";
                        break;
                    default : url = "list.ma";
                }

                document.getElementsByTagName
                let sort = document.getElementById('sort');
                let sortValue = sort.options[sort.selectedIndex].value;
                const form = document.createElement('form');
                const input1 = document.createElement('input');
                const input2 = document.createElement('input');
                form.setAttribute('style', 'display:none')
                form.action = url;
                form.method = 'POST';
                input1.setAttribute('name', 'sort');
                input1.setAttribute('value', sortValue);
                input1.setAttribute('type', 'hidden');
                input2.setAttribute('name', 'cpage');
                input2.setAttribute('value', this.firstElementChild.id);
                input2.setAttribute('type', 'hidden');
                form.append(input1);
                form.append(input2);
                document.body.append(form);
                console.log(form)
                form.submit();
            })
        })

    </script>

</body>
</html>