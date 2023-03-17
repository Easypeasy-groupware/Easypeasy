<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>

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

    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="appMenubar.jsp" />
    <div class="form-outer">
        <div class="left-outer">
            <div class="left-form1">
                <p><b style="font-size:30px;">연장근무신청서</b></p>
            </div>
            <div class="left-form2"><a href=""  data-toggle="modal" data-target="#send-approval" style="padding:20px; color:rgb(71, 71, 71);">결재요청</a>|
                                    <a href="" style="padding:20px; color:rgb(71, 71, 71);">임시저장</a>|
                                    <a href="" style="padding:20px; color:rgb(71, 71, 71);">취소</a>|
                                    <a href="" style="padding:20px; color:rgb(71, 71, 71);"  data-toggle="modal" data-target="#app-line">결재선지정</a>
                                    <br><br></div>
            <div class="left-form3">

                <table class="draft" style="width:100px; text-align:center; font-size:12px; margin-right:10px;" border="1">
                    <tr>
                        <td rowspan="4" style="background:rgb(223, 221, 221);">신<br>청</td>
                        <td>직급</td>
                    </tr>
                    <tr>
                        <td>도장 <br>이름</td>
                    </tr>
                    <tr>
                        <td>날짜</td>
                    </tr>
                </table>
                
                <table class="draft" style="width:100px; text-align:center; font-size:12px;" border="1">
                    <tr>
                        <td rowspan="4" style="background:rgb(223, 221, 221);">승<br>인</td>
                        <td>직급</td>
                    </tr>
                    <tr>
                        <td>도장 <br>이름</td>
                    </tr>
                    <tr>
                        <td>날짜</td>
                    </tr>
                </table>
                <br><br><br><br>
                
            </div>
                <div class="left-form4">
                    <table class="table-bordered">
                        <tr>
                            <td width="100px;" style="text-align:center">
                                <label for="writer">기안자</label>
                            </td>
                            <td width="200px;">
                                <input type="text" value="정형돈" readonly> 
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center">
                                <label for="dept">소속</label>
                            </td>
                            <td>
                                <input type="text" value="부서명" readonly> 
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
                                <input type="text" val="23013423" readonly>
                            </td>
                        </tr>
                    </table>
                    <br>
                </div>
                <div class="left-form5">
                    <table class="table-bordered" >

                        <tr>
                            <td style="text-align:center; width:100px;">
                                <label for="title">신청현황</label>
                            </td>
                            <td style="width:700px;">
                                * * 자정 이후 근무시작인 경우 날짜를 다음날로 지정해주세요.
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center">
                                <label for="content">근무구분</label>
                            </td>    
                            <td>
                                &nbsp;&nbsp;<input type="radio" id="extension" name="extra-sort">  <label for="extension" >연장</label>
                                &nbsp;&nbsp;<input type="radio" id="night" name="extra-sort">  <label for="night" >야간</label>     
                                &nbsp;&nbsp;<input type="radio" id="holiday" name="extra-sort">  <label for="holiday">휴일</label>
                            </td>                        
                        </tr>
                        <tr>
                            <td style="text-align:center">
                                <label for="content">근무일시</label>
                            </td>
                            <td>
                                &nbsp;&nbsp;
                                <input  class="dateSelect"  name="" id="" required >
                                <input type="number"  class="dateSelect-start"  name="overStartHour" id="overStartHour" required style="width:80px;" min="0" max="24"> ~ 
                                <input type="number" class="dateSelect-end" name="overEndHour" id="overEndHour" required style="width:80px;" min="0" max="24">
                                <button onclick="diffTime()">계산</button>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center"> 
                                <label for="content">근무시간</label>
                            </td>
                            <td id="overUseTime" name="overUseTime">
                                &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"  style="text-align:center">
                                * 주간 근무시간 - 근무일이 포함된 한 주 <br>

                                정상근무시간 + 연장근무 승인 요청에 대한 결재가 완료된 총 시간입니다. <br>
                                
                                근태관리에서 시간 수정이 가능하므로
                                
                                주간 근무시간은 상이해질 수 있습니다. <br>
                               </td>
                        </tr>
                        <tr>
                            <td rowspan="5" style="text-align:center">
                                <label for="content">신청사유</label>
                            </td>
                            <td rowspan="5" height="150px;">
                                <textarea class="form-control" name="" id="content" rows="10" style="resize:none;"></textarea>
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
                        <img src="img/user.png" width="30px;" alt=""> &nbsp;정형돈 과장
                        <br>
                            회사명 | 부서명
                        <br>
                            기안
                        <br><br>

                        <br>
                    </div>
                    <div class="app-comment" style="font-size:15px;">
                        <img src="img/user.png" width="30px;" alt=""> &nbsp;정형돈 과장
                        <br>
                            회사명 | 부서명
                        <br>
                            결재
                        <br><br>

                        <br>
                    </div>
                </div>
            </div>
        </div>
 
    </div>
    <script>

        function diffTime(){
            const startTime = document.getElementById('overStartHour');
            const endTime = document.getElementById('overEndHour');
            const diff = endTime.value - startTime.value;

            if(startTime.value > endTime.value || startTime.value == endTime.value){
                alert("시작시간과 종료시간을 다시 확인해주세요.");
                startTime.value = "";
                endTime.value = "";
                document.getElementById("overUseTime").value = "";
                document.getElementById("overUseTime").innerHTML = "";
            }else{
                document.getElementById("overUseTime").value = diff;
                document.getElementById("overUseTime").innerHTML = "총 " + diff + "시간";
            }

        }                
        document.getElementById("enrollDate").value = new Date().toISOString().substring(0, 10);
    
        var dateSelector = document.querySelector('.dateSelect');
        dateSelector.flatpickr();
        dateSelector.flatpickr({
        local: 'ko',
        disable: [
        
        // 주말 제외 (토, 일)
        function(date) {
        // return true to disable
        return (date.getDay() === 0 || date.getDay() === 6);
        }
        ],
        dateFormat: "Y-m-d",
        minDate: "today",
        defaultDate :"today",
        maxDate:new Date().fp_incr(30)
    });

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
                    inAttachs.innerText = ''
                    noAttach.style.display = "none";
                    for(let i=0; i<attachFile.files.length; i++){
                        inAttachs.innerHTML += "첨부파일명 : " + attachFile.files[i].name + "&nbsp;&nbsp;&nbsp; <br>"
                    };
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
                inAttachs.innerText = ''
                noAttach.style.display = "none";
                for(let i=0; i<attachFile.length; i++){
                    inAttachs.innerHTML += "<div>첨부파일명 : " + attachFile[i].name + "&nbsp;&nbsp;&nbsp;<br>"
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


</body>
</html>