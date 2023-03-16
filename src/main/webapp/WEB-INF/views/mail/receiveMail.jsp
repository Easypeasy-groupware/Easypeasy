<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EasyPeasy-mail</title>

<style>
    *{box-sizing: content-box;}

    /* 메일 컨텐트 css */
    #mail_content{width: 1000px; float: left;}
    #mail_header{height: 130px; border-bottom: 2px solid rgb(185, 187, 221); margin: 10px;}
    #mail_header1{height: 90px;}
    #mail_header2{height: 100%;}
    #mail_header_info{font-size: 25px; float: left; margin: 20px;}
    #search_bar{float: right; margin: 20px;}
    #mail_content_menubar{padding: 5px;}
    .menu{float: left; text-align: center; font-weight: 600; font-size: 13px; height: 40px; line-height: 40px;}
    .menu1{width: 100px;}
    .menu2{width: 80px;}
    .menu3{width: 120px;}

    .block{width: 220px; min-height: 150px; max-height: 300px; background: white; border-radius: 10px; border: 1px solid rgb(185, 187, 221); 
               position: absolute; left: 550px; text-align: center; display: none;}
    .block_list{width: 205px; min-height: 115px; max-height: 230px; margin: auto; overflow-x: hidden; overflow-y: auto; margin-bottom: 10px;}
    .block_one{width: 100%; height: 30px; line-height: 30px; font-size: 13px;}
    .block_one>div{float: left;}
    .tag_name{width: 100px;}
    .shift_name{width: 100%; margin: auto; font-size: 15px;}
    .x-btn{width: 40px; height: 30px; line-height: 30px; margin-bottom: 5px; float: right; border: none;}
    .tagTriangle {width: 10px; height: 0px; border-top: 8px solid transparent; border-left: 15px solid pink; 
                  border-bottom: 8px solid transparent; margin-top: 6px;}

    #mail_detail_content{padding: 0px 15px 0px 15px; overflow-y: auto;}
    .detail_info_tr{height: 25px;}
    .detail_info_th{width: 100px; text-align: left;}
    .detail_info_attach{width: 90%; height: 100px; padding: 5px 0px 5px 20px; float: left; border: 1px solid grey; 
                        box-sizing: border-box; font-weight: 600; overflow-y: auto;}
    .detail_info_attach>div{font-size: 14px; margin: 3px 0px 3px 0px;}
    .tr_attach{margin-top: 15px}
    #attach{width: 20px; margin: 35px 5px 5px 35px; line-height: 25px; float: left;}

    #content_text_area{margin: 5px 1.8px 0px 1.8px; height: 535px; max-height: 2000px; padding: 20px;}
</style>
</head>
<body>
	<!-- 구글 아이콘, 폰트 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	
    <!-- 메일 사이드바 -->
	<jsp:include page="mailSidebar.jsp" />

    <!-- 메일 컨텐트-->
    <div id="mail_content">
        <div id="mail_header">
            <div id="mail_header1" style="width:100%; float:left">
                <div id="mail_header_info">
                    <b>받은 메일함</b>
                    <img src="">
                    <b>전체메일 </b><b style="color: dodgerblue;"></b><b>/ </b><b style="color: crimson">75</b>
                </div>
                <div id="search_bar">
                    <form action="">
                        <select name="search" id="">
                            <option value="searchAll">전체</option>
                            <option value="searchAddress">메일 주소</option>
                            <option value="searchTitle">메일 제목</option>
                            <option value="searchContent">메일 내용</option>
                        </select>
                        <input type="text">
                        <button>검색</button>
                    </form>
                </div>
            </div><br>
            <div id="mail_header2">
                <div class="menu" style="width: 27px;"><input type="checkbox" name="" id="check_all"></div>
                <div class="menu menu1" id="spam"><img src="">스팸 등록</div>
                <div class="menu menu2" id="reply"><img src="">답장</div>
                <div class="menu menu2" id="delete"><img src="">삭제</div>
                <div class="menu menu2" id="tag"><img src="">태그</div>
                <div class="menu menu2" id="forward"><img src="">전달</div>
                <div class="menu menu2" id="shift"><img src="">이동</div>
                <div class="menu menu3" id="read_unread"><img src="">읽음/안읽음</div>
                <div class="menu menu1" style="float: right; margin-left: 10px;" id="after_mail">
                    다음 메일
                    <div class="material-symbols-outlined" style="display: block; padding-top: 8px; float: right;">expand_more</div>
                </div>
                <div class="menu menu1" style="float: right;" id="before_mail">
                    이전 메일
                    <div class="material-symbols-outlined" style="display: block; padding-top: 8px; float: right;">expand_less</div>
                </div>
            </div>
            <div id="mail_detail_content">
                <div>
                    <img id="favorite" style="width: 22px; margin-right: 20px; float: left;" src="resources/common_images/favorite.png">
                    <div style="font-size: 17px; font-weight: 700;">메일제목 - ${ mail.mailTitle }</div><br>
                    <table>
                        <tr class="detail_info_tr">
                            <th class="detail_info_th">보낸 사람</th>
                            <td style="width: 90%;">${ mail.empName } ${ mail.sendMailAdd }</td>
                        </tr>
                        <tr class="detail_info_tr">
                            <th class="detail_info_th">받는 사람</th>
                            <td>
                                <c:forEach var="r" items="${ receiverList }">
                                    <c:choose>
                                        <c:when test="${ r.reference == 'N' && r.hiddenReference == 'N' }">
                                            ${ r.empName } ${ r.recMailAdd }
                                        </c:when>
                                        <c:otherwise>
                                        </c:otherwise>
                                    </c:choose>    
                                </c:forEach>
                            </td>
                        </tr>
                        <tr class="detail_info_tr">
                            <th class="detail_info_th">참 조</th>
                            <td>
                                <c:forEach var="r" items="${ receiverList }">
                                    <c:choose>
                                        <c:when test="${ r.reference == 'Y' }">
                                            <div>${ r.empName } ${ r.recMailAdd }</div>
                                        </c:when>
                                        <c:otherwise>
                                        </c:otherwise>
                                    </c:choose>    
                                </c:forEach>
                            </td>
                        </tr>
                        <tr class="detail_info_tr">
                            <th class="detail_info_th">보낸 날짜</th>
                            <td>${ mail.recDate }</td>
                        </tr>
                        <tr style="height: 10px;"></tr>
                        <tr class="detail_info_tr tr_attach">
                            <td colspan="2" style="padding: 4px; border: 2px solid gray; background: whitesmoke;">
                                <div style="width: 10%; height: 100px; float: left;">
                                    <img id="attach" src="resources/common_images/attachment.png">
                                </div>
                                <div class="detail_info_attach">
                                    <c:choose>
                                        <c:when test="${ empty attachmentList }">
                                            <div>첨부파일이 없습니다.</div>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="a" items="${ attachmentList }">
                                                <a href="${ a.filePath }" download="">${ a.originName }</a><br>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div id="content_text_area">
                        ${ mail.mailContent }
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        // 메일 상세조회
        let mailSelectList = document.querySelectorAll('.mail_select_area');
        mailSelectList.forEach(function(select){
            // select.addEventListener('click', function(){
            //     let mailNo = this.getElementsByClassName('mailNo').mailNo.value;
            //     console.log(mailNo);
            //     let link = this.getElementsByClassName('mail_select_area');
            //     console.log(link);
            // });
            select.addEventListener('click', function(){
                this.action = "www.naver.com";
                this.method = "POST";
                this.submit();
            });
        });

        // 전체 체크박스
        let checkAll = document.getElementById("check_all");
        let mailCheckBox = document.querySelectorAll('.mail_checkbox');
        checkAll.addEventListener('change', function(event){
            mailCheckBox.forEach((checkbox) => {
                checkbox.checked = checkAll.checked;
            })
        });

        // 스팸 등록
        let spamEnroll = document.getElementById("spam");
        let mailNoList = document.getElementsByClassName("mailNo");
        spamEnroll.addEventListener('click', function(){
        let checkedBoxSum = 0
        let count = 0;
        let arr = [];
        let form = document.createElement("form");
            mailCheckBox.forEach((i) => {
                if(i.checked == true) {
                    checkedBoxSum += 1;
                    arr[count] = mailNoList[i.value].value;
                    count += 1; 
                }
            })
            console.log(arr);

            if(checkedBoxSum != 0) {

            // form.setAttribute("charset", "UTF-8");
            // form.setAttribute("method", "POST");  
            // form.setAttribute("action", "액션 주소");

            // let hiddenInput = document.createElement("input");
            // hiddenInput.setAttribute("type", "hidden");
            // hiddenInput.setAttribute("name", "mailNoArr");
            // hiddenInput.setAttribute("value", arr);
            // form.appendChild(hiddenInput);

            // document.body.appendChild(form);
            // form.submit();

            }else {
                alert('체크박스를 선택해주세요');
            }
        });

        // 답장
        let reply = document.getElementById("reply");
        reply.addEventListener('click', function(){
            let checkedBoxSum = 0
            let count = 0;
            mailCheckBox.forEach((i) => {
                if(i.checked == true) {
                    count = i.value
                    checkedBoxSum += 1;
                }
            })
            if(checkedBoxSum == 1 && checkedBoxSum > 0) {
                mailSelectList[count].action = "www.naver.com";
                mailSelectList[count].method = "POST";
                mailSelectList[count].submit();
            }else{
                alert('한 개의 체크박스를 선택해주세요!')
            }
        });

        // 메일 삭제 - 스팸 등록과 동일
        let deleteMail = document.getElementById("delete");
        deleteMail.addEventListener('click', function(){
            let checkedBoxSum = 0
            let count = 0;
            let arr = [];
            let form = document.createElement("form");
                mailCheckBox.forEach((i) => {
                    if(i.checked == true) {
                        checkedBoxSum += 1;
                        arr[count] = mailNoList[i.value].value;
                        count += 1; 
                    }
                })
                console.log(arr);

            if(checkedBoxSum != 0) {

            }else{
                alert('체크박스를 선택해주세요');
            }
        });

        // 태그
        let tagging = document.getElementById("tag");
        let tagBlock = document.querySelector(".tag_block")
        tagging.addEventListener('click', function(){
            tagBlock.style.display = 'block';
        });

        // 메일 이동 - 태그와 동일
        let shift = document.getElementById("shift");
        let shiftBlock = document.querySelector(".shift_block")
        shift.addEventListener('click', function(){
            shiftBlock.style.display = 'block';
        });

        // x button 닫기 효과
        let x_blocks = document.querySelectorAll('.x');
        x_blocks.forEach(function(x){
            x.addEventListener('click', function(){
                this.parentNode.parentNode.style.display = 'none';
            })
        });

        // 전달 - 답장과 동일
        let forward = document.getElementById("forward");
        forward.addEventListener('click', function(){
            let checkedBoxSum = 0
            let count = 0;
            mailCheckBox.forEach((i) => {
                if(i.checked == true) {
                    count = i.value
                    checkedBoxSum += 1;
                }
            })
            if(checkedBoxSum == 1 && checkedBoxSum > 0) {
                mailSelectList[count].action = "www.naver.com";
                mailSelectList[count].method = "POST";
                mailSelectList[count].submit();
            }else{
                alert('한 개의 체크박스를 선택해주세요!')
            }
        });

        // 읽음 처리 - 스팸 처리와 동일
        let readAndUnread = document.getElementById("read_unread");
        readAndUnread.addEventListener('click', function(){
            let checkedBoxSum = 0
            let count = 0;
            let arr = [];
            let form = document.createElement("form");
                mailCheckBox.forEach((i) => {
                    if(i.checked == true) {
                        checkedBoxSum += 1;
                        arr[count] = mailNoList[i.value].value;
                        count += 1; 
                    }
                })
            if(checkedBoxSum != 0) {

            }else{
                alert('체크박스를 선택해주세요');
            }
        }); 

        // 새로고침
        let refresh = document.getElementById("refresh");
        refresh.addEventListener('click', function(){
            
        });

        // 즐겨찾기
        let favoriteList = document.querySelectorAll('.favorite');
        favoriteList.forEach(function(favorite){
            favorite.addEventListener('click', function(){
                console.log("즐겨찾기");
            });
        });

        // 아이콘 읽기 처리
        let readList = document.querySelectorAll('.read');
        readList.forEach(function(read){
            read.addEventListener('click', function(){
                console.log("읽기");
            });
        });
        
        // 이전 메일
        const prev = document.getElementById("before_mail")
        prev.addEventListener('click', function(){
            
        })

        // 다음 메일
        const next = document.getElementById("after_mail")
        next.addEventListener('click', function(){

        })


    </script>
</body>
</html>