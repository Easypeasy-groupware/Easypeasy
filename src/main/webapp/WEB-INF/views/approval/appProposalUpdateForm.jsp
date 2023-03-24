<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        #main{position: absolute; top: 120px;}

        .form-outer{ 
            width:1000px;
            margin:auto;
            float:left;
            box-sizing: border-box;
        }
        .form-outer>div{float:left;}
        .left-outer{width:100%; padding:30px;} 
        .left-form3 table{float:left;}
        .left-form1, .left-form2 ,.left-form3,.left-form4,.left-form5,.left-form6{width:100%;}
        .speech-bubble {
            position: relative;
            background: #d1d2d2;
            border-radius: .4em;
        }

        .speech-bubble:after {
            content: '';
            position: absolute;
            top: 0;
            left: 50%;
            width: 0;
            height: 0;
            border: 20px solid transparent;
            border-bottom-color: #d1d2d2;
            border-top: 0;
            border-left: 0;
            margin-left: -10px;
            margin-top: -20px;
        } 
        
        /* 첨부파일 스타일 */
        #attach_area{height: 100px; border: 1px solid gray; background: whitesmoke; vertical-align: middle;}
        #no_attachment{width: 360px; margin: auto; display: block;}
        #no_attachment img, #no_attachment div{float: left;}
        #no_attachment div{margin-left: 10px; line-height: 26px; font-size: 15px; font-weight: 400; color: gray;}
        #in_attachments{width: 100%; max-height: 100px; padding-left: 20px; display: none;}
        #attach{width: 25px;}
        .attach_delete_btn{border: none;}            

    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>


	<div id="main">
    <jsp:include page="appMenubar.jsp" />
    <div class="form-outer">
        <div class="left-outer">
        	<form id="contentArea" method="POST" enctype="multipart/form-data">
            <div class="left-form1">
                <p>
                	<b style="font-size:30px;">일반품의서</b>
	                <input type="hidden" name="formCode" value="2">
	                <input type="hidden" name="formName" value="일반품의서">
	                <input type="hidden" name="appNo" value = "${ap.appNo}">
	                 
                </p>
            </div>
            <div class="left-form2">
            	<a href=""  data-toggle="modal" data-target="#send-approval" style="padding:20px; color:rgb(71, 71, 71);">결재요청</a>|
		            <span style="padding:20px; color:rgb(71, 71, 71);" onclick="tempSave();">임시저장</span>|
                <a href="" style="padding:20px; color:rgb(71, 71, 71);">취소</a>|
                <a href="" style="padding:20px; color:rgb(71, 71, 71);"  data-toggle="modal" data-target="#app-line">결재선지정</a>
                <br><br><br>
            </div>
                    <div class="left-form4">
                        <table class="table-bordered">
                            <tr>
                                <td width="100px;" style="text-align:center">
                                    <label for="writer">기안자</label>
                                </td>
                                <td width="200px;">
                                    <input type="text" value="" id="writer" readonly> 
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:center">
                                    <label for="dept">소속</label>
                                </td>
                                <td>
                                    <input type="text" value="" id="dept" readonly> 
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:center">
                                    <label for="enrollDate">기안일</label>
                                </td>
                                <td style="text-align:center">
                                    <input id="enrollDate" name="enrollDate" type="date" style="width:94%;" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:center">
                                    <label for="appNo">문서번호</label>
                                </td>
                                <td>
                                    <input type="text" value="${ap.appChange}" id="appChange" name="appChange" readonly>
                                </td>
                            </tr>
                        </table>
                        <br>
                    </div>
                    <script>
                        document.getElementById("enrollDate").value = new Date().toISOString().substring(0, 10);
                    </script>
                    <div class="left-form5">
                        <table class="table-bordered" >

                            <tr>
                                <td style="text-align:center; width:100px;">
                                    <label for="title">제목</label>
                                </td>
                                <td>
                                    <input type="text" name="title" style="width:700px;"  value="${ap.title }">
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="5" style="text-align:center" >
                                    <label for="content">내용</label>
                                </td>
                                <td rowspan="5" height="150px;">
                                    <textarea class="summernote form-control" name="content" required  id="content" rows="10" style="resize:none;">${ap.content }</textarea>
                                </td>
                            </tr>
                            <tr></tr>
                            <tr></tr>
                            <tr></tr>
                            <tr></tr>
                            <tr>
                                <td style="text-align:center">
                                    <label for="attachment">첨부파일</label>
                                </td>
                                <td>
                                    <button id="file_choose" type="button" class="btn btn-outline-secondary btn-sm">파일 선택</button>
                                    <button id="file_delete" type="button" class="btn btn-outline-secondary btn-sm">모두 삭제</button>
                                </td>
                            </tr>
                            <tr></tr>
                            <tr>
                                <td colspan="2" id="attach_area">
                                    <div id="no_attachment" >
                                        <img id="attach" src="resources/common_images/attachment.png" width="30px;">
                                        <div>첨부파일을 여기로 끌어다 옮겨주세요.</div>
                                    </div>
                                    <div id="in_attachments">
                                        <c:if test="${not empty list3}">
                                            <c:forEach var="a" items="${list3 }">
                                                <div> 첨부파일명 :  ${a.originName}  &nbsp;&nbsp;&nbsp; <br></div>
                                            </c:forEach>
                                        </c:if>                                
                                    </div>
                                    <input id="attach_files" type="file" multiple="multiple" accept="image/*,text/*,audio/*,video.*,.hwp.,.zip" name="originNames" style="display: none;">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br>
                <div class="left-form6">
                    <div style=" padding:10px; font-size:20px;">
                        <p><b> 결재선</b></p>
                </div>
                
                <div class="app-comment" style="font-size:15px;">
                    <img src="<c:out value='${loginUser.empProfile }' default='resources/profile_images/default_profile.png' />" width="30px;" alt=""> &nbsp;${loginUser.empName} ${loginUser.jobName}
                    <br>
                        이지피지 | ${loginUser.deptName}
                    <br>
                        기안
                    <br><br><br>
                    
                </div>
                
                <div class="app-body">
                        <c:choose>
                            <c:when test="${empty list1}">
                                결재선이 비었습니다.
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="e" items="${list1}">
                                <div class="app-comment" style="font-size:15px;">
                                    <img src="<c:out value='${e.empProfile}' default='resources/profile_images/default_profile.png' />" width="30px;" alt=""> &nbsp;${e.empName} ${e.jobCode == 'J1'?'사원':
                                                                                                                                                                                            e.jobCode == 'J2'?'대리':
                                                                                                                                                                                            e.jobCode == 'J3'?'과장':
                                                                                                                                                                                            e.jobCode == 'J4'?'부장':
                                                                                                                                                                                            e.jobCode == 'J5'?'상무':
                                                                                                                                                                                            e.jobCode == 'J6'?'대표':''}
                                    <input type="hidden" name="recEmpNo" value="${e.recEmpNo }">																														                             
                                    <br>
                                        이지피지 | ${e.deptName}
                                    <br>
                                        결재
                                    <br><br><br>
                                    
                                </div>	               			
                                </c:forEach>
                            </c:otherwise>
                    </c:choose>               
                </div>

                
                    <div style=" padding:10px; font-size:20px;">
                        <p><b> 참조자</b></p>
                </div>
                
                <div class="app-comment" style="font-size:15px;">
                    <img src="<c:out value='${loginUser.empProfile }' default='resources/profile_images/default_profile.png' />" width="30px;" alt=""> &nbsp;정형돈 과장
                    <br>
                        회사명 | 부서명
                    <br>
                        참조
                    <br><br>

                    <br>
                </div>
                
                <div class="rep-body">
                        <c:choose>
                            <c:when test="${empty list2}">
                                참조선이 비었습니다.
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="r" items="${list2}">
                                <div class="app-comment" style="font-size:15px;">
                                    <img src="<c:out value='${r.empProfile }' default='resources/profile_images/default_profile.png' />" width="30px;" alt=""> &nbsp;${r.empName} ${r.jobCode == 'J1'?'사원':
                                                                                                                                                                                    r.jobCode == 'J2'?'대리':
                                                                                                                                                                                    r.jobCode == 'J3'?'과장':
                                                                                                                                                                                    r.jobCode == 'J4'?'부장':
                                                                                                                                                                                    r.jobCode == 'J5'?'상무':
                                                                                                                                                                                    r.jobCode == 'J6'?'대표':''}
                                    <input type="hidden" name="recEmpNo" value="${r.recEmpNo }">	
                                    <br>
                                        이지피지 | ${r.deptName}
                                    <br>
                                        참조
                                    <br><br><br>
                                    
                                </div>	               			
                                </c:forEach>
                            </c:otherwise>
                    </c:choose>               
                </div>
                
                <div id="commentArea">
                
                </div>	            
                
                    </div>
                </form>
                
            </div>
        </div>
    </div>


    <script>
    
	    // 회원정보흘 가져오는 ajax
	    $(function(){
	    	
	    	$.ajax({
	    		url:"enrollinfo.ap",
	    		success:function(result){
	    				    			
	    			$("#writer").val(result.a.empName);
	    			$("#dept").val(result.a.deptName);
	    			
	    		}, error:function(request, status, error){
	    			console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
					console.log("직성용 정보 불러오기 ajax 통신실패");
	    		}
	    	});
	    	
	    	// 첨부파일 있을때와 없을 때
	    	if(${not empty list3}){
	    		$("#in_attachments").css('display', 'block');
	    		$("#no_attachment").css('display', 'none');

	    	}else{
	    		$("#in_attachments").css('display', 'none');
	    		$("#no_attachment").css('display', 'block');	    		
	    	}
	    });
    
    
    
    
    
        $('.summernote').summernote({
            toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']           });


	   
	    
	    
        // 첨부파일 업로드 하기
        // 버튼 클릭해서 선택해오기
        let fileNames = [];
        let noAttach = document.getElementById("no_attachment");
        let inAttachs = document.getElementById("in_attachments");
        document.getElementById("file_choose").addEventListener('click', function(){
            let attachFile = document.getElementById("attach_files");
            attachFile.click();
            attachFile.addEventListener('change', function(){
                let vaildFile = attachFile.files.length >= 0;
                if(vaildFile){
                    //inAttachs.innerText = ''
                    noAttach.style.display = "none";
                    let attach = "";
                    for(let i=0; i<attachFile.files.length; i++){
                    	
                    	inAttachs.innerHTML += "<div>첨부파일명 : " + attachFile[i].name + "&nbsp;&nbsp;&nbsp;<br></div>";
                        
                    };
                    inAttachs.append(attach);
                    
                    inAttachs.style.overflowY = 'auto';
                    inAttachs.style.display = "block";
                };
            });  
        });

        let uploadBox = document.querySelector('#attach_area');

        // 박스 안에 Drag를 하고 있을 때
        uploadBox.addEventListener('dragover', function(e) {
            e.preventDefault();
            this.style.backgroundColor = 'white';
        });
        
        // 박스 밖으로 Drag가 나갈 때
        uploadBox.addEventListener('dragleave', function(e) {
            this.style.backgroundColor = 'whitesmoke';
        });
        // 박스 안에서 Drag를 Drop했을 때
        uploadBox.addEventListener('drop', function(e) {
            e.preventDefault();
            this.style.backgroundColor = 'whitesmoke';
            let attachFile = e.dataTransfer.files
            let vaildFile = e.dataTransfer.types.indexOf('Files') >= 0;
            if(vaildFile){
                //inAttachs.innerText = ''
                noAttach.style.display = "none";
                for(let i=0; i<attachFile.length; i++){
                    inAttachs.innerHTML += "<div>첨부파일명 : " + attachFile[i].name + "&nbsp;&nbsp;&nbsp;<br></div>";
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
        
        // 유효한 기안의견 작성 시 update 요청되게 하기
        function insertApp(){
        	
            $.ajax({
                url:"enrollinfo.ap",
                success:function(result){

                    $("#appChange").val(result.appChange);
                    
                }, error:function(request, status, error){
                    console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
                    console.log("직성용 정보 불러오기 ajax 통신실패");
                }
            });
            
       
        	if($("#writerComment").val().trim().length>0){
        		
        		if(!($("#content").val().trim().length>0)){
        			swal("내용 작성 후 상신요청해주세요.");
        		}
        		
        		
        		if($(".app-body input").html() == null){
        			swal("결재선 선택 후 상신요청해주세요.");
        		}
        		
        		const appContent = $("#contentArea");
        		
        		// 결재 / 참조자 목록들 배열에 담기
        		const recEmpNo = [];
        		const refList = [];
        		
        		const appBody = $(".app-body input");
        		const refBody = $(".rep-body input");
        		
        		
        		for(let i = 0; i < appBody.length; i++){
        			console.log(appBody[i]);
        			appBody[i].setAttribute('name', 'alList['+ i +'].recEmpNo');
        	
        		}

        		for(let j = 0; j < refBody.length; j++){
        			refBody[j].setAttribute('name', 'refList[' + j + '].recEmpNo');
        	
        		}
			
				let value = "";
				value += "<input type='hidden' name='writerComment' value='"+ $("#writerComment").val() +"'>"
				 + "<input type='hidden' name='status' value='"+ 1 +"'>";
				$("#commentArea").html(value);
				
				$("input[type=radio][name=start-half]").attr('name', 'halfStatus');
				$("input[type=radio][name=end-half]").attr('name','halfStatus');
				
				$("#contentArea").attr("action","insert.ap").submit();;
				

        		
        	}else{
        		
        		swal("의견 작성 후 상신요청해주세요.");
        	}
        	
        }
        
        function tempSave(){
        	
        	
        	
        	
			let value = "";
			value += "<input type='hidden' name='status' value='"+ 2 +"'>";
			$("#commentArea").html(value);
			
    		// 결재 / 참조자 목록들 배열에 담기
    		const recEmpNo = [];
    		const refList = [];
    		
    		const appBody = $(".app-body input");
    		const refBody = $(".rep-body input");
    		
    		
    		for(let i = 0; i < appBody.length; i++){
    			console.log(appBody[i]);
    			appBody[i].setAttribute('name', 'alList['+ i +'].recEmpNo');
    	
    		}

    		for(let j = 0; j < refBody.length; j++){
    			refBody[j].setAttribute('name', 'refList[' + j + '].recEmpNo');
    	
    		}

			
			
    		$("#contentArea").attr("action","update.ap").submit();
        }            
        

    </script>

</body>
</html>