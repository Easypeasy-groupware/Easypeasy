<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 전체 wrapper */
    .wrapper { width: 1200px; margin: 0 auto; position: absolute; top: 120px} /* 중앙 정렬을 위한 margin: 0 auto; */
    body {font-family: Arial, sans-serif; margin: 0; padding: 0;}
    /* 게시판 스타일 */
    .board {width: 1000px;float: right;}
    .container {margin: 20px auto; width: 900px; padding: 20px;}
    form {max-width: 1000px; margin: 0 auto; padding: 20px; border-radius: 5px; box-sizing: border-box;}
    label {display: inline-block; margin-bottom: 5px; font-weight: bold;}
	input[type="text"],input[type="file"],textarea,
	select {width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 3px; box-sizing: border-box; margin-bottom: 20px; font-size: 16px; font-family: inherit;}
	select {height: 40px;}
	/* 파일첨부 스타일 */
	#attach_area{height: 100px; border: 2px dashed gray; background: whitesmoke; vertical-align: middle;}
    #no_attachment{width: 100%; margin: auto; display: block;}
    #no_attachment img, #no_attachment div{float: left;}
    #no_attachment div{margin-left: 10px; line-height: 26px; font-size: 18px; font-weight: 600; color: gray;}
    #in_attachments{width: 100%; max-height: 100px; padding-left: 20px; display: none;}
    #attach{width: 25px;}
    .attach_delete_btn{border: none;}
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
	
		<jsp:include page="../board/boardSidebar.jsp" />
       
        <div class="board">
        	<form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">
          <h3>게시글 작성</h3>
          <br><br>
              <label>게시판그룹</label>
                  <select name="boardCno">
                      <option value="1" name="boardCno" id="1">전체 공지사항</option>
                <!--       <option value="2" name="boardCno" id="2">식단표</option>
                      <option value="3" name="boardCno" id="3">자유게시판</option>
                      <option value="4" name="boardCno" id="4">커뮤니티</option>
                      <option value="5" name="boardCno" id="5">부서 공지사항</option>
                      <option value="6" name="boardCno" id="6">부서 자유게시판</option> -->
                  </select><br>
              <label for="title">게시글 제목</label>
                  <input type="text" id="boardTitle" name="boardTitle" required /><br>
              <input type="hidden" name="boardWriter" value="${loginUser.empNo}">
              
              
              <label for="file">파일첨부</label>
                  <input type="file" id="upfile" class="form-control-file border" name="upfile"><br>
               <!--    
                  <table>
                  	<tr>
	                  <td>
		                  <button id="file_choose" type="button" class="btn btn-secondary btn-sm">파일 선택</button>
	                      <button id="file_delete" type="button" class="btn btn-secondary btn-sm">모두 삭제</button>
		              </td>
		            </tr>
	                  <td colspan="2" id="attach_area">
	                        <div id="no_attachment">
	                            <img id="attach" src="resources/common_images/attachment.png">
	                            <div>첨부파일을 여기로 끌어다 옮겨주세요.</div>
	                        </div>
	                        <div id="in_attachments">
	                        </div>
	                        <input id="attach_files" type="file" multiple="multiple" accept="image/*,text/*,audio/*,video.*,.hwp.,.zip" name="originNames" style="display: none;">
	                 </td>
                  </table>
                   -->
              <br>    
              
              
              <label for="content">내용</label>
                  <textarea name="boardContent" id="boardContent" cols="30" rows="10" required placeholder="내용을 입력하세요"></textarea><br>
              <!-- <label for="boardPin">공지등록</label>
                  <input type="checkbox" id="N" name="boardPin" /><br> -->
               
                    <br><br>
              <div align="center">
                <button type="button" class="btn btn-dark" onclick="javascript:history.go(-1);">이전으로</button>
                <button type="submit" class="btn btn-success">등록하기</button>
                <!-- <button type="button" class="btn btn-secondary">임시저장</button> -->
              </div>
              </form>
        </div>
	</div>
	<!-- 
        <script>
     	// 첨부파일 업로드 하기
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
        
        </script>
	 -->
</body>
</html>