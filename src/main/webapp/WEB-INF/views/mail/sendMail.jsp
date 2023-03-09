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

    /* 메일 사이드바 css*/
    #mail_side_bar{width: 200px; height: 1000px; float: left; border-right: 2px solid rgb(185, 187, 221); padding: 10px;}
    #send_mail_btn{width: 170px;}
    .mailbox_subject{width: 157px; float: left; font-size: 18px; font-weight: 700; color: darkslategrey;}
    .settings{width: 13px; padding-top: 5px;}
    .boxList{width: 170px;}
    .boxList>div{width: 140px; float: left; margin: 5px 0px 0px 15px; padding: 5px 0px 5px 0px; font-size: 14px;}
    .boxList>img{width: 15px; margin-top: 5px; padding: 5px 0px 5px 0px;}
    #tagList{min-height: 60px; max-height: 200px; overflow-y: auto; overflow-x: hidden;}
    #tagList>div{float: left;}
    .tag{width: 200px; float: left; margin: 0px 0px 2px 10px;}
    .tag>div{font-size: 14px;}
    .tagTriangle{width: 10px; height: 0px; float: left; border-top: 8px solid transparent; 
                 border-left: 15px solid pink; border-bottom: 8px solid transparent; margin-top: 6px; margin-right: 10px;}
    .tagTriangle+div{width: 140px; height: 17px; margin-top: 6px; overflow: hidden;}
    #add_tag{width: 100%; padding: 15px 0px 0px 20px; margin-bottom: 42px; font-size: 14px; font-weight: 600; color: gray;}
    #add_tag_view{width: 300px; height: 350px; padding-top: 15px;  position: absolute; top: 400px; left: 400px; border-radius: 10px;
                  border: 1px solid rgb(185, 187, 221); background: white; z-index: 10; display: none;}
    #select_tag_color{width: 100%; height: 80px; margin: auto;}
    #select_tag_color>div{width: 15px; height: 15px; margin: 4px; float: left; background-color: brown;}

    .favorite{width: 16px;}
    #spambox, #trashcan{width: 125px; float: left;}
    #spambox+button, #trashcan+button{width: 40px; font-size: 10px; padding: 4px;}

    /* 메일 컨텐트 css*/
    #mail_content{width: 1000px; float: left;}
    #mail_header{height: 130px; border-bottom: 2px solid rgb(185, 187, 221); margin: 10px;}
    #mail_header1{height: 90x;}
    #send_btnList{line-height: 45px;}
    #send_btnList>button{height: 30px; line-height: 12px;}

    #receiver_area{min-height: 100px; max-height: 200px; border: 1px solid gray; background: whitesmoke;}
    #in_receiver_list{width: 100%; max-height: 200px; padding-left: 20px; display: block; overflow-y: auto; overflow-x: auto;}
    .receiver_one{height: 30px;}
    .receiver_one>b{line-height: 10px;}
    .receiver_one>button{height: 25px; line-height: 20px; padding: 0px 8px 0px 8px; margin-top: 5px; border: 1px solid gray; background-color: whitesmoke;}
    
    #mail_content_text{height: 865px; padding: 0px 20px 0px 20px; overflow-y: auto; overflow-x: hidden;}
    #mail_header_info{font-size: 25px; float: left; margin: 20px;}
    #input_receiver{width: 585px;}

    #hidden_reference{display: none;}
    #open_btn_hidden_reference{display: block; padding-left: 6px;}
    #open_btn_hidden_reference, #close_btn_hidden_reference{width: 25px; height: 25px; line-height: 0px;}
    #close_btn_hidden_reference{padding-left: 9px;}
    .detail_info_tr{height: 35px;}
    .detail_info_tr th{width: 120px; text-align: center; padding-bottom: 10px;}
    .detail_info_tr>th{font-size: 18px;}
    .detail_info_tr td{padding-bottom: 10px;}
    .detail_info_tr input[type=text]{width: 670px; height: 35px; margin-right: 10px;}
    #attach_area{height: 100px; border: 2px dashed gray; background: whitesmoke; vertical-align: middle;}
    #no_attachment{width: 360px; margin: auto; display: block;}
    #no_attachment img, #no_attachment div{float: left;}
    #no_attachment div{margin-left: 10px; line-height: 26px; font-size: 18px; font-weight: 600; color: gray;}
    #in_attachments{width: 100%; max-height: 100px; padding-left: 20px; display: none;}
    #attach{width: 25px;}
    .attach_delete_btn{border: none;}
    
    /* 부트스트랩 버튼 css */
    .btn-secondary{height: 36px; min-width: 40px; max-width: 100px;}
</style>
</head>
<body>

	<!-- 헤더바 영역 -->
	<jsp:include page="../common/header.jsp" />

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

	<!-- 메일 사이드바 -->
    <div id="mail_side_bar">
        <h2>메일</h2>
        <br><br>
        <div>
            <div class="mailbox_subject">즐겨찾기</div>
            <img class="settings" src="resources/common_images/setting.png">
            <br><br>
            <div class="boxList">
                <div>안읽은 메일함</div><img class="favorite" src="resources/common_images/favorite.png">
                <div>중요 메일함</div><img class="favorite" src="resources/common_images/favorite.png">
                <div>작성중인 메일함</div><img class="favorite" src="resources/common_images/favorite.png">
            </div>
        </div>
        <br><br>
        <div>
            <div class="mailbox_subject">태그</div>
            <br><br>
            <div id="tagList">
                <div class="tag">
                    <div class="tagTriangle"></div><div>영업 1팀</div>
                </div>
                <div class="tag">
                    <div class="tagTriangle"></div><div>과장님 업무지시 솰라솰라솰라</div>
                </div>
                <div class="tag">
                    <div class="tagTriangle"></div><div>1순위</div>
                </div>
                <div class="tag">
                    <div class="tagTriangle"></div><div>2순위</div>
                </div>
                <div class="tag">
                    <div class="tagTriangle"></div><div>2순위</div>
                </div>
                <div class="tag">
                    <div class="tagTriangle"></div><div>2순위</div>
                </div>
                <div class="tag">
                    <div class="tagTriangle"></div><div>2순위</div>
                </div>
                <div class="tag">
                    <div class="tagTriangle"></div><div>2순위</div>
                </div>
                <div class="tag">
                    <div class="tagTriangle"></div><div>2순위</div>
                </div>
            </div>
            <div id="add_tag"> + 태그 추가</div>

            <!-- 태그 추가 화면 -->
            <div id="add_tag_view">
                <b style="line-height: 50px; font-size: 20px; padding-left: 30px; color: grey;">태그 추가</b>
                <br><br>
                <div style="width: 80%; margin: auto;">
                    <b style="color: rgb(80, 80, 80); margin-bottom: 3px;">새 태그 이름을 입력해주세요</b>
                    <input id="tagName" type="text" name="tagName" style="width: 100%; margin-top: 5px; box-sizing: border-box;">
                </div>
                <div style="width: 80%; margin: auto; margin-top: 15px; margin-bottom: 15px; border: 1px solid rgb(185, 187, 221);"></div>
                <div style="width: 80%; margin: auto;">
                    <b style="color: rgb(80, 80, 80); margin-bottom: 3px;">태그 색상을 선택해주세요</b>
                    <div id="select_tag_color">
                        <div style="background-color: cadetblue;"></div>
                        <div style="background-color: darkseagreen;"></div>
                        <div style="background-color: greenyellow;"></div>
                        <div style="background-color: cornflowerblue;"></div>
                        <div style="background-color: crimson;"></div>
                        <div style="background-color: coral;"></div>
                        <div style="background-color: darkcyan;"></div>
                        <div style="background-color: darkgoldenrod;"></div>
                        <div style="background-color: darkblue;"></div>
                        <div style="background-color: darkgreen;"></div>
                        <div style="background-color: darkgrey;"></div>
                        <div style="background-color: darkslategray;"></div>
                        <div style="background-color: darkmagenta;"></div>
                        <div style="background-color: darkturquoise;"></div>
                        <div style="background-color: dodgerblue;"></div>
                        <div style="background-color: gold;"></div>
                        <div style="background-color: deeppink;"></div>
                        <div style="background-color: wheat;"></div>
                        <div style="background-color: brown;"></div>
                        <div style="background-color: black;"></div>
                    </div>
                    <input type="hidden" id="tagColor" name="tagColor">
                </div>
                <div style="width: 100%; text-align: center;">
                    <button class="btn btn-danger">추가</button>
                    <button class="x btn btn-secondary" type="button">취소</button>
                </div>
            </div>
        </div>
        <div>
            <div class="mailbox_subject">메일함</div>
            <img class="settings" src="resources/common_images/setting.png">
            <br><br>
            <div class="boxList">
                <div>받은 메일함(전체)</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div>오늘 온 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div>내게 쓴 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div>첨부 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div>보낸 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div>예약 메일함</div><img class="favorite" src="resources/common_images/unFavorite.png">
                <div style="width: 200px;">
                    <div id="spambox">스팸 메일함 </div>
                    <button class="btn btn-outline-secondary btn-sm">비우기</button>
                </div>
                <div style="width: 200px;">
                    <div id="trashcan">휴지통 </div>
                    <button class="btn btn-outline-secondary btn-sm">비우기</button>
                </div>
            </div>
        </div>
        <br><br>
    </div>

    <script>
        // 태그 추가 화면 등장
        document.getElementById("add_tag").addEventListener('click', function(){
            document.getElementById("add_tag_view").style.display = 'block'
        });

        // button 닫기 효과
        let x_blocks = document.querySelectorAll('.x');
        x_blocks.forEach(function(x){
            x.addEventListener('click', function(){
                this.parentNode.parentNode.style.display = 'none';
            })
        });
    </script>

    <!-- 메일 컨텐트-->
    <div id="mail_content">
        <div id="mail_header">
            <div id="mail_header1" style="width:100%; float:left">
                <div id="mail_header_info">
                    <b>메일 쓰기</b>
                </div>
            </div>
            <div id="send_btnList">
                <button id="send" class="btn btn-primary">보내기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button id="temp_save" class="btn btn-outline-secondary">임시저장</button>&nbsp;
                <button id="preview" class="btn btn-outline-secondary">미리보기</button>&nbsp;
            </div>
        </div>
        <form id="mail_content_text" method="POST" enctype="multipart/form-data">
            <table id="send_info">
                <tr class="detail_info_tr">
                    <th>받은 사람</th>
                    <td style="width: 100px;"><input id="to_me" type="checkbox"> 나에게</td>
                    <td><input id="input_receiver" class="mail_input" type="text">
                        &nbsp;&nbsp;&nbsp;<button type="button" id="add_receiver" class="btn btn-secondary">추가</button></td>
                    <td><button type="button" class="btn btn-secondary">주소록</button></td>
                </tr>
                <tr class="detail_info_tr">
                    <td colspan="2">
                        <div style="width: 150px; margin-left: 30px;">
                            <b>수신자 목록 첨부<br>(excel 파일만 가능)</b>
                        </div>
                    </td>
                    <td><input class="mail_input" type="text"></td>
                    <td><button type="button" class="btn btn-secondary">주소록</button></td>
                </tr>
                <tr class="detail_info_tr">
                    <th>수신 목록</th>
                    <td></td>
                    <td colspan="2" id="receiver_area">
                        <div id="in_receiver_list">
                        </div>
                        <input id="input_receiver_list" type="text" style="display: none;">
                    </td>
                </tr>
                <tr class="detail_info_tr"><td></td></tr>
                <tr class="detail_info_tr">
                    <th>참 조</th>
                    <td><button type="button" id="open_btn_hidden_reference" class="btn btn-outline-secondary">+</button></td>
                    <td><input class="mail_input" type="text"></td>
                    <td><button type="button" class="btn btn-secondary">주소록</button></td>
                </tr>
                <tr class="detail_info_tr" id="hidden_reference">
                    <th>숨은 참조</th>
                    <td><button type="button" id="close_btn_hidden_reference" class="btn btn-outline-secondary">-</button></td>
                    <td><input class="mail_input" type="text"></td>
                    <td><button type="button" class="btn btn-secondary">주소록</button></td>
                </tr>
                <tr class="detail_info_tr">
                    <th>제 목</th>
                    <td><input type="checkbox"> 중요</td>
                    <td colspan="2"><input class="mail_input" style="width: 760px; margin-right: 0;" type="text"></td>
                </tr>
                <tr class="detail_info_tr">
                    <th>파일 첨부</th>
                    <td></td>
                    <td colspan="2" style="text-align: left;">
                        <button id="file_choose" type="button" class="btn btn-secondary">파일 선택</button>
                        <button type="button" class="btn btn-secondary">자료실</button>
                        <button id="file_delete" type="button" class="btn btn-secondary">모두 삭제</button>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td colspan="2" id="attach_area">
                        <div id="no_attachment">
                            <img id="attach" src="resources/common_images/attachment.png">
                            <div>첨부파일을 여기로 끌어다 옮겨주세요.</div>
                        </div>
                        <div id="in_attachments">
                        </div>
                        <input id="attach_files" type="file" multiple accept="image/*,text/*,audio/*,video.*,.hwp.,.zip" name="originNames" style="display: none;">
                    </td>
                </tr>
                <tr style="height: 20px;"></tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td colspan="2">
                        <textarea name="editordata" id="summernote">

                        </textarea>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <script>
        // 써머노트 에디터
        $(document).ready(function() {
            $('#summernote').summernote({
                height: 500,
                focus: true,
                lang: "ko-KR"
            });
        });

        // 나에게 버튼
        const toMeBtn = document.getElementById("to_me");
        toMeBtn.addEventListener('click', function(){
            const noReceiverList = document.getElementById("no_receiver_list");
            const inReceiverList = document.getElementById("in_receiver_list");
            
            if(toMeBtn.checked == true) {
                const eAddress = document.createElement("div");
                eAddress.innerHTML = '<div class="receiver_one to_me"><b>user10@easypeasy.com</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">x</button></div>';
                inReceiverList.append(eAddress);

                let deleteBtnList = document.querySelectorAll('#in_receiver_list button');
                deleteBtnList.forEach(function(deleteBtn){
                    deleteBtn.addEventListener('click', () => {
                        deleteBtn.parentNode.remove();
                    });
                });
            }else{
                const toMeDiv = document.querySelector('.to_me');
                toMeDiv.remove();
            }
        });

        const addReceiver = document.getElementById("add_receiver");
        addReceiver.addEventListener('click', function(){
            let re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            let email = document.getElementById("input_receiver").value;
            if (email == '' || !re.test(email)) {
                alert("올바른 이메일 주소를 입력하세요")
                return false;
            }else{
                const inReceiverList = document.getElementById("in_receiver_list");
                const eAddress = document.createElement("div");
                eAddress.innerHTML = '<div class="receiver_one"><b>' + email + '</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">x</button></div>';
                inReceiverList.append(eAddress);

                let deleteBtnList = document.querySelectorAll('#in_receiver_list button');
                deleteBtnList.forEach(function(deleteBtn){
                    deleteBtn.addEventListener('click', () => {
                        deleteBtn.parentNode.remove();
                    });
                });
            }
        });

        let deleteBtnList = document.querySelectorAll('#in_receiver_list button');
        deleteBtnList.forEach(function(deleteBtn){
            deleteBtn.addEventListener('click', () => {
                deleteBtn.parentNode.remove();
            });
        });


        // 숨은 참조 열기 버튼
        const hiddenRefenceOpenBtn = document.getElementById('open_btn_hidden_reference');
        const hiddenRefence = document.getElementById("hidden_reference");
        hiddenRefenceOpenBtn.addEventListener('click', function(){
            hiddenRefenceOpenBtn.style.display = "none";
            hiddenRefence.style.display = "table-row";
        });

        // 숨은 참조 숨기기 버튼
        const hiddenRefenceCloseBtn = document.getElementById('close_btn_hidden_reference');
        hiddenRefenceCloseBtn.addEventListener('click', function(){
            hiddenRefenceOpenBtn.style.display = 'block';
            hiddenRefence.style.display = "none";
        });

        // 에디터 내용이 비었는지 체크
        // if ($('#summernote').summernote('isEmpty')) {
        //     alert('editor content is empty');
        // }

        // 첨부파일 업로드1 (버튼 클릭 방식)
        let fileNames = [];
        let noAttach = document.getElementById("no_attachment");
        let inAttachs = document.getElementById("in_attachments");
        document.getElementById("file_choose").addEventListener('click', function(){
            let attachFile = document.getElementById("attach_files");
            attachFile.click();
            attachFile.addEventListener('change', function(){
                let vaildFile = attachFile.files.length >= 0;
                if(vaildFile){
                    inAttachs.innerText = ''
                    noAttach.style.display = "none";
                    for(let i=0; i<attachFile.files.length; i++){
                        inAttachs.innerHTML += "첨부파일명 : " + "<b>" + attachFile.files[i].name + "</b>" + "&nbsp;&nbsp;&nbsp; <br>"
                    };
                    inAttachs.style.overflowY = 'auto';
                    inAttachs.style.display = "block";
                };
            });  
        });

        // 첨부파일 업로드2 (Drag And Drop 방식)
        let uploadBox = document.querySelector('#attach_area');

        // 박스 안에 Drag를 하고 있을 때
        uploadBox.addEventListener('dragover', function(e) {
            e.preventDefault();
            this.style.backgroundColor = 'rgb(185, 187, 221)';
        });
        
        // 박스 밖으로 Drag가 나갈 때
        uploadBox.addEventListener('dragleave', function(e) {
            this.style.backgroundColor = 'gainsboro';
        });
        
        // 박스 안에서 Drag를 Drop했을 때
        uploadBox.addEventListener('drop', function(e) {
            e.preventDefault();
            this.style.backgroundColor = 'gainsboro';
            let attachFile = e.dataTransfer.files
            let vaildFile = e.dataTransfer.types.indexOf('Files') >= 0;
            if(vaildFile){
                inAttachs.innerText = ''
                noAttach.style.display = "none";
                for(let i=0; i<attachFile.length; i++){
                    inAttachs.innerHTML += "<div>첨부파일명 : " + "<b>" + attachFile[i].name + "</b>" + "&nbsp;&nbsp;&nbsp;<br>"
                };
                inAttachs.style.overflowY = 'auto';
                inAttachs.style.display = "block";
            };
        });

        // 첨부파일 전체 삭제
        document.getElementById('file_delete').addEventListener('click', function(){
            let attachFile = document.getElementById("attach_files");
            attachFile.value = ''
            inAttachs.innerText = ''
            inAttachs.style.display = "none";
            noAttach.style.display = "block";
        });







        document.getElementById("send").addEventListener('click', function(){
            const sendContent = document.getElementById("mail_content");
            const form = document.createElement("form");
            form.setAttribute("charset", "UTF-8");
            form.setAttribute("method", "POST");  
            form.setAttribute("action", "send.ma");
            form.appendChild(sendContent);
            document.body.appendChild(form);
            form.submit();
        })
    </script>
    

</body>
</html>