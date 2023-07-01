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
    #send{width: 100px; height: 30px; margin:auto; padding:5px 0 5px 0; background-color: rgb(142, 161, 122);
          border-radius:4px; border: none; color: white; display: block; float: left; margin-top: 9px;}
          
    #send:hover{background-color:rgb(58, 69, 47); text-decoration:none; color: white;}
    #send_btnList{line-height: 45px;}
    #send_btnList>button{height: 30px; line-height: 12px;}

    #receiver_area{min-height: 100px; max-height: 200px; border: 1px solid gray; background: whitesmoke;}
    #in_receiver_list{width: 100%; max-height: 200px; padding-left: 20px; display: block; overflow-y: auto; overflow-x: auto;}
    .receiver_one{height: 30px;}
    .receiver_one>b{line-height: 10px;}

    .receiver_one>button, 
    .receiver_ref_one>button, 
    .receiver_hid_ref_one>button{height: 25px; line-height: 20px; padding: 0px 8px 0px 8px; 
                                 margin-top: 5px; border: 1px solid gray; background-color: whitesmoke;}
    
    #mail_content_text{height: 865px; padding: 0px 20px 0px 20px; overflow-y: auto; overflow-x: hidden;}
    #mail_header_info{font-size: 25px; float: left; margin: 20px;}
    #input_receiver, #input_reference, #input_hidden_reference{width: 585px;}

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
    .mail_addressbook{height: 35px; padding-top: 3px;}

    /* 주소록 모달 */
    .modal-content{position: absolute; top:250px; left:100px;}
    #dept{height: 40px;}
    #modal_receiveList{border: 1px solid gray; border-radius: 2px; padding: 3px;}
    .appEmp{width: 420px; height: 30px;}
    .addbtn{height: 25px; width: 25px; float: right;}
    .emp-list{width: 420px; height: 30px;}
    .minusbtn{height: 25px; width: 25px; float: right;}
</style>
</head>
<body>

	<!-- 헤더바 영역 -->
	<jsp:include page="../common/header.jsp" />

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <div style="position: absolute; top: 120px;">

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
                    <button id="send">보내기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <c:if test="${mail.tempStorage != 'Y'}">
                        <button id="temp_save" class="btn btn-outline-secondary">임시저장</button>
                    </c:if>
                </div>
            </div>
            <div id="mail_content_text">
                <input type="hidden" name="sendMailAdd" value="${loginUser.email}">
                <table id="send_info">
                    <tr class="detail_info_tr">
                        <th>받은 사람</th>
                        <td style="width: 100px;"><input id="to_me" type="checkbox"> 나에게</td>
                        <td><input id="input_receiver" class="mail_input" type="text">
                            &nbsp;&nbsp;&nbsp;<button type="button" id="add_receiver" class="btn btn-secondary">추가</button></td>
                        <td class="mail_addressbook">
                            <button type="button" id="reference_division1" class="mail_addressbook btn btn-secondary" data-toggle="modal" data-target="#attendee-add">주소록</button>
                        </td>
                    </tr>
                    <tr class="detail_info_tr">
                        <th>참 조</th>
                        <td>
                            <button type="button" id="open_btn_hidden_reference" class="btn btn-outline-secondary">+</button>
                        </td>
                        <td>
                            <input id="input_reference" class="mail_input" type="text">
                            &nbsp;&nbsp;&nbsp;<button type="button" id="add_rec_ref" class="btn btn-secondary">추가</button>
                        </td>
                        <td class="mail_addressbook">
                            <button type="button" id="reference_division2" class="mail_addressbook btn btn-secondary" data-toggle="modal" data-target="#attendee-add">주소록</button>
                        </td>
                    </tr>
                    <tr class="detail_info_tr" id="hidden_reference">
                        <th>숨은 참조</th>
                        <td><button type="button" id="close_btn_hidden_reference" class="btn btn-outline-secondary">-</button></td>
                        <td><input id="input_hidden_reference" class="mail_input" type="text">
                            &nbsp;&nbsp;&nbsp;<button type="button" id="add_rec_hid_ref" class="btn btn-secondary">추가</button></td>
                        <td class="mail_addressbook">
                            <button type="button" id="reference_division3" class="mail_addressbook btn btn-secondary" data-toggle="modal" data-target="#attendee-add">주소록</button>
                        </td>
                    </tr>
                    <tr class="detail_info_tr">
                        <th>수신 목록</th>
                        <td></td>
                        <td colspan="2" id="receiver_area">
                            <div id="in_receiver_list">
                            </div>
                            <input id="input_receiver_list" name="recMailAdd" type="eamil" multiple style="display: none;">
                            <input id="input_ref_list" name="refList" type="email" multiple style="display: none;">
                            <input id="input_hid_ref_list" name="hRefList" type="email" multiple style="display: none;">
                        </td>
                    </tr>
                    <tr class="detail_info_tr"><td></td></tr>
                    <tr class="detail_info_tr">
                        <th>제 목</th>
                        <td><input id="imporMail" type="checkbox" name="imporMail"> 중요</td>
                        <td colspan="2"><input type="text" id="mail_title" class="mail_input" style="width: 760px; margin-right: 0;" name="mailTitle" value="${mail.mailTitle}"></td>
                    </tr>
                    <tr class="detail_info_tr">
                        <th>파일 첨부</th>
                        <td></td>
                        <td colspan="2" style="text-align: left;">
                            <button id="file_choose" type="button" class="btn btn-secondary">파일 선택</button>
                            <button id="file_delete" type="button" class="btn btn-secondary">모두 삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td colspan="2" id="attach_area">
                            <c:choose>
                                <c:when test="${ empty attachmentList }">
                                    <div id="no_attachment">
                                        <img id="attach" src="resources/common_images/attachment.png">
                                        <div>첨부파일을 여기로 끌어다 옮겨주세요.</div>
                                    </div>
                                    <div id="in_attachments">
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div id="no_attachment" style="display: none;">
                                        <img id="attach" src="resources/common_images/attachment.png">
                                        <div>첨부파일을 여기로 끌어다 옮겨주세요.</div>
                                    </div>
                                    <div id="existing_attachment">
                                        <c:forEach var="a" items="${ attachmentList }">
                                            첨부파일명 : <a href="${ a.filePath }">${ a.originName }</a>&nbsp;&nbsp;&nbsp;<br>
                                        </c:forEach>
                                    </div>
                                    <div id="in_attachments" style="display: block;">
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <input id="attach_files" type="file" multiple="multiple" accept="image/*,text/*,audio/*,video.*,.hwp.,.zip,.xlsx" name="originNames" style="display: none;">
                        </td>
                    </tr>
                    <tr style="height: 20px;"></tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td colspan="2">
                            <textarea name="mailContent" id="summernote" value="">${ mail.mailContent }</textarea>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- 주소록 모달 -->
        <div class="modal" id="attendee-add">
            <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">수신자 선택</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body appLine">
                        <div class="appLine1">
                        <c:forEach var="d" items="${ deptList }" varStatus="status">
                            <div id="dept">
                                <b class="${ d.deptCode }">${ d.deptName }</b>
                                <span><img src="resources/common_images/list-down.png" style="width:15px;" class="dropdown-key" id="cList-key${ status.index }"></span>
                            </div>
                            <ul class="empList" id="cList-in${ status.index }" style="display: none;"> <!-- 사원리스트 -->
                                <c:forEach var="em" items="${ empMailList }">
                                    <c:if test="${ d.deptName eq em.deptName }">
                                        <li id="appEmp${ em.empNo }" class="appEmp">
                                            <span class="indiv-job">${em.jobName}</span> 
                                            <span class="indiv-name">${ em.empName }</span>
                                            <span class="indiv-email">${ em.email }</span>
                                            <input type="hidden" name="empNo" value="${em.empNo}">
                                            <button class="btn btn-outline-secondary addbtn" style="padding: 0;">+</button>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </c:forEach>
                        </div>
                        <div class="appLine2">
                            <div id="modal_receiveList">
                                <div style="height: 40px; margin-left: 10px; font-weight: 600;">수신 목록</div>
                                <div class="appArea">
                                    <ul class="appList"><!-- 추가되는 사원리스트 -->
                                    </ul>
                                </div>
                            </div>                    
                        </div>
                    </div>
            
                    <!-- Modal footer -->
                    <div style="margin:auto;">
                        <input type="hidden" id="reference_division" value="">
                        <button type="button" class="btn btn-light" data-dismiss="modal" id="add-empList">확인</button>
                        <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                    </div>
                    <br>
                </div>
            </div>
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
                eAddress.innerHTML = '<div class="receiver_one to_me"><b>${ loginUser.email }</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">x</button></div>';
                inReceiverList.append(eAddress);

                let deleteBtnList = document.querySelectorAll('#in_receiver_list button');
                deleteBtnList.forEach(function(deleteBtn){
                    deleteBtn.addEventListener('click', () => {
                        deleteBtn.parentNode.remove();
                    });
                });
            }else if(toMeBtn.checked == false){
                let toMeDiv = document.querySelector('.to_me');
                toMeDiv.remove();
            }
            
        });

        // 수신자 주소 추가
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
                document.getElementById("input_receiver").value = null;

                let deleteBtnList = document.querySelectorAll('#in_receiver_list button');
                deleteBtnList.forEach(function(deleteBtn){
                    deleteBtn.addEventListener('click', () => {
                        deleteBtn.parentNode.remove();
                    });
                });
            }
        });

        // 참조자 주소 추가
        const addRecRef = document.getElementById("add_rec_ref");
        addRecRef.addEventListener('click', function(){
            let re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            let email = document.getElementById("input_reference").value;
            if (email == '' || !re.test(email)) {
                alert("올바른 이메일 주소를 입력하세요")
                return false;
            }else{
                const inReceiverList = document.getElementById("in_receiver_list");
                const eAddress = document.createElement("div");
                eAddress.innerHTML = '<div class="receiver_ref_one"><b>참조 - ' + email + '</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">x</button></div>';
                inReceiverList.append(eAddress);
                document.getElementById("input_reference").value = null;


                let deleteBtnList = document.querySelectorAll('#in_receiver_list button');
                deleteBtnList.forEach(function(deleteBtn){
                    deleteBtn.addEventListener('click', () => {
                        deleteBtn.parentNode.remove();
                    });
                });
            }
        });

        // 숨은 참조자 주소 추가
        const addHidRecRef = document.getElementById("add_rec_hid_ref");
        addHidRecRef.addEventListener('click', function(){
            let re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            let email = document.getElementById("input_hidden_reference").value;
            if (email == '' || !re.test(email)) {
                alert("올바른 이메일 주소를 입력하세요")
                return false;
            }else{
                const inReceiverList = document.getElementById("in_receiver_list");
                const eAddress = document.createElement("div");
                eAddress.innerHTML = '<div class="receiver_hid_ref_one"><b>숨은 참조 - ' + email + '</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">x</button></div>';
                inReceiverList.append(eAddress);
                document.getElementById("input_hidden_reference").value = null;

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

        // 메일 보내기
        document.getElementById("send").addEventListener('click', function(){
            const receiverList = document.querySelectorAll("#in_receiver_list b");
            const recAddList = document.getElementById("input_receiver_list");
            const referAddList = document.getElementById("input_ref_list");
            const hidRefAddList = document.getElementById("input_hid_ref_list");
            const receiver = document.getElementsByClassName("receiver_one");
            const mailTitle = document.getElementById("mail_title");
            const mailContent = document.getElementById("summernote");

            recAddList.value = "";
            referAddList.value = "";
            hidRefAddList.value = "";

            for(let i=0; i<receiverList.length; i++) {
                if(receiverList[i].innerHTML.includes('숨은 참조')){
                    hidRefAddList.value += receiverList[i].innerHTML
                }else if(receiverList[i].innerHTML.includes('참조')){
                    referAddList.value += receiverList[i].innerHTML
                }else{
                    recAddList.value += receiverList[i].innerHTML + ","
                }
            }

            if(receiver.length < 1) {
                alert("수신자를 입력해주세요.")
            }else if(mailTitle.value == ""){
                alert("제목을 입력해주세요.")
            }else if(mailContent.value == ""){
                alert("내용을 입력해주세요.")
            }else{
                let formData = new FormData();

                for(let i=0; i<$("#attach_files")[0].files.length; i++) {
                    console.log($("#attach_files")[0].files[i]);
                    formData.append("originNames", $("#attach_files")[0].files[i]);
                }

                let data = {
                    recAddList: $("#input_receiver_list").val(),
                    refList: $("#input_ref_list").val(),
                    hRefList: $("#input_hid_ref_list").val(),
                    mailTitle: $("#mail_title").val(),
                    mailContent: $("#summernote").val(),
                    imporMail: $("input:checkbox[name='imporMail']:checked").val()
                }

                formData.append('key', new Blob([JSON.stringify(data)], {type : "application/json"}));
                $.ajax({
                    url:"send.ma",
                    method:"POST",
                    enctype:"multipart/form-data",
                    data:formData,
                    processData:false,
                    contentType:false,
                    success: function(result){
                        if(result == 1){
                            location.href="sendList.ma";
                        }
                    }, error:function(){

                    }
                });
            }
        });

        // 임시저장
        document.getElementById("temp_save").addEventListener('click', function(){
            const receiverList = document.querySelectorAll("#in_receiver_list b");
            const recAddList = document.getElementById("input_receiver_list");
            const referAddList = document.getElementById("input_ref_list");
            const hidRefAddList = document.getElementById("input_hid_ref_list");
            const receiver = document.getElementsByClassName("receiver_one");
            const mailTitle = document.getElementById("mail_title");
            const mailContent = document.getElementById("summernote");

            recAddList.value = "";
            referAddList.value = "";
            hidRefAddList.value = "";

            for(let i=0; i<receiverList.length; i++) {
                if(receiverList[i].innerHTML.includes('숨은 참조')){
                    hidRefAddList.value += receiverList[i].innerHTML
                }else if(receiverList[i].innerHTML.includes('참조')){
                    referAddList.value += receiverList[i].innerHTML
                }else{
                    recAddList.value += receiverList[i].innerHTML + ","
                }
            }

            if(mailTitle.value == ""){
                alert("제목을 입력해주세요.")
            }else if(mailContent.value == ""){
                alert("내용을 입력해주세요.")
            }else{
                let formData = new FormData();

                for(let i=0; i<$("#attach_files")[0].files.length; i++) {
                    console.log($("#attach_files")[0].files[i]);
                    formData.append("originNames", $("#attach_files")[0].files[i]);
                }

                let data = {
                    recAddList: $("#input_receiver_list").val(),
                    refList: $("#input_ref_list").val(),
                    hRefList: $("#input_hid_ref_list").val(),
                    mailTitle: $("#mail_title").val(),
                    mailContent: $("#summernote").val(),
                    imporMail: $("input:checkbox[name='imporMail']:checked").val(),
                    tempStorage : 'Y'
                }

                formData.append('key', new Blob([JSON.stringify(data)], {type : "application/json"}));
                console.log(formData)
                $.ajax({
                    url:"temp.ma",
                    method:"POST",
                    enctype:"multipart/form-data",
                    data:formData,
                    processData:false,
                    contentType:false,
                    success: function(result){
                        if(result == 1){
                            location.href = "tempList.ma"
                        }
                    }, error:function(){

                    }
                });
            }
        });
        

        /* 주소록 */

        document.getElementById("reference_division1").addEventListener('click', function(){
            document.getElementById("reference_division").value = 1;
        })

        document.getElementById("reference_division2").addEventListener('click', function(){
            document.getElementById("reference_division").value = 2;
        })

        document.getElementById("reference_division3").addEventListener('click', function(){
            document.getElementById("reference_division").value = 3;
        })

        // - 부서별 명단 펼치기/접기
        $("#cList-key0").click(function(){
            if($(this).attr("src") === "resources/common_images/list-down.png"){
                $(this).attr("src", "resources/common_images/list-up.png");	
                $("#cList-in0").show();
            }else {
                $(this).attr("src", "resources/common_images/list-down.png");
                $("#cList-in0").hide();
            }
        })
        $("#cList-key1").click(function(){
            if($(this).attr("src") === "resources/common_images/list-down.png"){
                $(this).attr("src", "resources/common_images/list-up.png");	
                $("#cList-in1").show();
            }else {
                $(this).attr("src", "resources/common_images/list-down.png");
                $("#cList-in1").hide();
            }
        })
        $("#cList-key2").click(function(){
            if($(this).attr("src") === "resources/common_images/list-down.png"){
                $(this).attr("src", "resources/common_images/list-up.png");
                $("#cList-in2").show();
            }else {
                $(this).attr("src", "resources/common_images/list-down.png");
                $("#cList-in2").hide();
            }
        })
        $("#cList-key3").click(function(){
            if($(this).attr("src") === "resources/common_images/list-down.png"){
                $(this).attr("src", "resources/common_images/list-up.png");	
                $("#cList-in3").show();
            }else {
                $(this).attr("src", "resources/common_images/list-down.png");
                $("#cList-in3").hide();
            }
        })
        $("#cList-key4").click(function(){
            if($(this).attr("src") === "resources/common_images/list-down.png"){
                $(this).attr("src", "resources/common_images/list-up.png");	
                $("#cList-in4").show();
            }else {
                $(this).attr("src", "resources/common_images/list-down.png");
                $("#cList-in4").hide();
            }
        })
        $("#cList-key5").click(function(){
            if($(this).attr("src") === "resources/common_images/list-down.png"){
                $(this).attr("src", "resources/common_images/list-up.png");	
                $("#cList-in5").show();
            }else {
                $(this).attr("src", "resources/common_images/list-down.png");
                $("#cList-in5").hide();
            }
        })
        $("#cList-key6").click(function(){
            if($(this).attr("src") === "resources/common_images/list-down.png"){
                $(this).attr("src", "resources/common_images/list-up.png");	
                $("#cList-in6").show();
            }else {
                $(this).attr("src", "resources/common_images/list-down.png");
                $("#cList-in6").hide();
            }
        })
        $("#cList-key7").click(function(){
            if($(this).attr("src") === "resources/common_images/list-down.png"){
                $(this).attr("src", "resources/common_images/list-up.png");	
                $("#cList-in7").show();
            }else {
                $(this).attr("src", "resources/common_images/list-down.png");
                $("#cList-in7").hide();
            }
        })

        // - 수신자 추가
        $(document).on("click", ".addbtn", function(){ 
            let val = "";
            let eee;
            let job = $(this).siblings().eq(0).text();
            let name = $(this).siblings().eq(1).text();
            let email = $(this).siblings().eq(2).text();
            let input = $(this).siblings("input").val();
            
            let arr = $(".appList").children();
            
            const refDiv = document.getElementById("reference_division").value;
            console.log(refDiv)
            if(refDiv == 1){
                val = "<li class='emp-list'><span class='indiv-job'>" + job + "</span> " 
                    + "<span class='indiv-name'> " + name + "</span> "
                    + "<span class='indiv-email'> " + email + "</span> "
                    + " <input type='hidden' class='emailList' value='"+ email +"'>"
                    + "<button style='padding: 0;' type='button' class='btn btn-outline-secondary minusbtn'>-</button></li>";
            }else if(refDiv == 2){
                val = "<li class='emp-list'><span class='indiv-job'>" + job + "</span> " 
                    + "<span class='indiv-name'> 참조 - " + name + "</span> "
                    + "<span class='indiv-email'> " + email + "</span> "
                    + " <input type='hidden' class='emailList_reference' value='"+ email +"'>"
                    + "<button style='padding: 0;' type='button' class='btn btn-outline-secondary minusbtn'>-</button></li>";
            }else{
                val = "<li class='emp-list'><span class='indiv-job'>" + job + "</span> " 
                    + "<span class='indiv-name'> 숨은 참조 - " + name + "</span> "
                    + "<span class='indiv-email'> " + email + "</span> "
                    + " <input type='hidden' class='emailList_hiddenReference' value='"+ email +"'>"
                    + "<button style='padding: 0;' type='button' class='btn btn-outline-secondary minusbtn'>-</button></li>";
            }
        
            $(".appList").append(val);
            
            eee = $(this).parent();
            eee.hide();
            
        })
        
        // - 수신자 삭제
        $(document).on("click", ".minusbtn", function(){
            $(this).parent().remove();
            let li = $(".empList").children();	
            eee.show();
        })
        
        // 수신 목록 리스트 추가 완료
        $(document).on("click", "#add-empList", function(){

            const refDiv = document.getElementById("reference_division").value;
            let email = document.querySelectorAll(".emailList");
            let reference = document.querySelectorAll(".emailList_reference");
            let hiddenReference = document.querySelectorAll(".emailList_hiddenReference");
            const inReceiverList = document.getElementById("in_receiver_list");
            const eAddress = document.createElement("div");
            if(refDiv == 1){
                email.forEach(function(e){
                    eAddress.innerHTML += '<div class="receiver_one"><b>' + e.value + '</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">x</button></div>';
                });
            }else if(refDiv == 2){
                reference.forEach(function(e){
                    eAddress.innerHTML += '<div class="receiver_one"><b> 참조 - ' + e.value + '</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">x</button></div>';
                });
            }else{
                hiddenReference.forEach(function(e){
                    eAddress.innerHTML += '<div class="receiver_one"><b> 숨은 참조 - ' + e.value + '</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">x</button></div>';
                });
            };

            inReceiverList.append(eAddress);
            document.getElementById("input_receiver").value = null;

            let deleteBtnList = document.querySelectorAll('#in_receiver_list button');
            deleteBtnList.forEach(function(deleteBtn){
                deleteBtn.addEventListener('click', () => {
                    deleteBtn.parentNode.remove();
                });
            });
        });
        
        
        $(document).on("click", ".empDelete", function(){
            $(this).parent().remove();
        })
    </script>
</body>
</html>