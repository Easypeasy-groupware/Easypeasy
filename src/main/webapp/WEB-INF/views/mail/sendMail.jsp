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
	<jsp:include page="mailSidebar.jsp" />

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
        <form id="mail_content_text" action="send.ma" method="POST" enctype="multipart/form-data">
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
                    <td><input type="checkbox" name="imporMail"> 중요</td>
                    <td colspan="2"><input class="mail_input" style="width: 760px; margin-right: 0;" name="mailTitle" type="text"></td>
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
                        <textarea name="mailContent" id="summernote">

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

        // x button 닫기 효과
        let x_blocks = document.querySelectorAll('.x');
        x_blocks.forEach(function(x){
            x.addEventListener('click', function(){
                this.parentNode.parentNode.style.display = 'none';
            })
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
            const sendContent = document.getElementById("mail_content_text");
            // const form = document.createElement("form");
            // form.setAttribute("charset", "UTF-8");
            // form.setAttribute("method", "POST");  
            // form.setAttribute("action", "send.ma");
            // form.appendChild(sendContent);
            // document.body.appendChild(form);
            // form.submit();
            sendContent.submit();
        })
    </script>
    

</body>
</html>