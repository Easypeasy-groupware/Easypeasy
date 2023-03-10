<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
    <style>
         /* 안가져감 */
     /* div{
        box-sizing:border-box; 
         border:1px solid red;
         }  */
       .area{width:1200px;}
       .menubar{
        float:left;
        box-sizing:border-box;
        width:200px;
        height:2000px;
        border:1px solid gray;
       }
       .app-menu{
        padding-left:0;
        list-style-type:none;
       }
       .app-menu>li{
        padding:5px;
        text-align:center;
        
       }
       .app-menu a{
        text-decoration:none;
        color:black;
       }
       #newApp-form>ul{list-style:none;}
       .selectForm{
        display: flex;
        align-items: center;
       }
       .selectForm>div{width:50%; float:left;}
        .appLine>div{float:left;}
        .appLine1, .appLine2{width:50%;}
        .appLine1 *,.appLine2 *{list-style:none;}
        .app-comment{padding:10px;}  
        
     /* 문서목록 스타일 */        
        .list-1{width:100%; height:60px;}
        .list-1{
            text-align:right;
            width:100%; 
            padding:15px;
            margin-right: 10px; 
            font-size:13px;
           
        }
        .list1-1{height:40px;}
        #paging{text-align: center; display: inline-block; padding-left :0;}
        #paging li {text-align: center; float: left; list-style:none; border-radius:10px; margin:2px; background-color: rgb(234, 234, 234);}
        #paging li a {display: block; font-size: 12px; color: black; padding: 5px 10px; box-sizing: border-box; text-decoration-line:none;}
        #paging li.on {background:rgb(166, 184, 145);}
        #paging li.on a { color: white;}    
        
        /* 모달 창 가운데로 정렬*/
        .modal.modal-center {
        /* text-align: center; */
        }

         @media screen and (min-width: 768px) { 
        .modal.modal-center:before {
            display: inline-block;
            vertical-align: middle;
            content: " ";
            height: 30%;
        }
        } 

        .modal-dialog.modal-center {
        display: inline-block;
        text-align: left;
        vertical-align: middle; 
        }
        .moal{z-index:10000;
        	/* z-index: 2147483647; */
        }
    </style>
    
    <!-- 부트스트랩 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- flatpickr -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>  

    <!-- 써머노트 -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>  
</head>
<body>
    <div class="wrap-1" align="center">
        <div class="area" >
            <div class="menubar">
                <br><br>
                <ul class="app-menu">
                    <li><button type="button" class="btn btn-outline-secondary btn-lg" data-toggle="modal" data-target="#newApp">새 결재 진행</button></li>
                    <br>
                    <li><a href="recWlist.ap">결재 대기문서</a></li>
                    <li><a href="refWlist.ap">참조 대기문서</a></li>
                    <br>
                    <li><b>개인</b></li>
                    <li><a href="sendList.ap">기안문서함</a></li>
                    <li><a href="tempList.ap">임시저장함</a></li>
                    <li><a href="recList.ap">결재문서함</a></li>
                    <li><a href="refList.ap">참조문서함</a></li>
                    <br>
                    <li><b>부서</b></li>
                    <li><a href="dSendList.ap">기안완료함</a></li>
                    <li><a href="dRefList.ap">부서참조함</a></li>
                    <br><br>
                </ul>
            </div>
        </div>
    </div>
        <!-- 새 결재 양식 선택하는 모달 -->
        <!-- The Modal -->
        <div class="modal modal-center fade" id="newApp">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">결재 양식 선택</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body selectForm">
                    <div>
                        <form action="enrollForm.ap" type="Get" id="newApp-form">
                            <br>
                            <ul>
                                <li>
                                    <input type="radio" name="formCode" id="draft" value="1">
                                    <label for="draft">업무기안</label>   
                                </li>
                                <li>
                                    <input type="radio" name="formCode" id="propersal" value="2">
                                    <label for="propersal">일반품의서</label>  
                                </li>
                                <li>
                                    <input type="radio" name="formCode" id="vacation" value="3">
                                    <label for="vacation">휴가신청서</label>  
                                </li>
                                <li>
                                    <input type="radio" name="formCode" id="overtime" value="4">  
                                    <label for="overtime">연장근무신청서</label>
                                </li>
                            </ul>
                      
                    </div>
                    <div>
                        보안등급 &nbsp;  :  &nbsp; 
                        <span id="grade"></span>
                        <br><br>
                        보존연한 &nbsp;  :  &nbsp; 
                        <span id="preser"></span>
                    </div>
                </div>

		                <!-- Modal footer -->
		                <div class="modal-footer" style="margin:auto; ">
		                    <button type="submit"  class="btn btn-light">확인</button>
		                    <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
		                </div>
		          </form>
            </div>
            </div>
        </div>
    
    <script>
        $(document).ready(function(){
            $("input[name='formCode']").change(function(){
                if($("input[name='formCode']:checked").val()==1 || $("input[name='formCode']:checked").val()==2){
                    $("#grade").text('A');
                    $("#preser").text('5년');
                }else{
                    $("#grade").text('B');
                    $("#preser").text('3년');
                }
            });
        });
    </script>
    
    
    <!-- 결재선 선택하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="app-line">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">결재선 지정</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body appLine">
                <div class="appLine1">
                    <b style="color:black">결재선</b>  | <b style="color:gray;">참조자</b> <br><br>
                    조직도 <br>
                    <input type="search" style="width:120px"><button class="btn btn-outline-secondary">검색</button> <br>

                    <ul class="empList">
                       <li id="appEmp1" class="appEmp">
                            <span>결재</span> 
                            <span>ddd1</span> 
                            <span>ddd1</span>
                            <input type="hidden" class="empNo" name="empNo" value="1">
                            <button class="btn btn-outline-secondary addbtn">+</button>
                       </li> 
                       <li id="appEmp2" class="appEmp"> 
                            <span>결재</span> 
                            <span>ddd2</span>
                            <span>ddd2</span>
                            <input type="hidden" class="empNo" name="empNo" value="2">
                            <button class="btn btn-outline-secondary addbtn">+</button>
                        </li> 
                        <li id="appEmp3" class="appEmp"> 
                            <span>결재</span> 
                            <span>ddd3</span>
                            <span>ddd3</span>
                            <input type="hidden" class="empNo" name="empNo" value="3">
                            <button class="btn btn-outline-secondary addbtn">+</button>
                        </li> 
                    </ul>

                </div>
                <div class="appLine2">
                    <form action="">
                        <h5>결재자 지정</h5>
                        <div class="appArea">
                            <ul>
                                <li>
                                    <span>기안</span>
                                    <span>정형돈</span>
                                    <span>부서명</span>
                                </li>                 
                            </ul>
                            <ul class="appList">

                            </ul>
                        </div>
                    </form>                    
                </div>
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer"  style="margin:auto;">
                <button type="submit" class="btn btn-light" data-dismiss="modal" data-toggle="modal" data-target="#ref-line">확인</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>

    <script>

        // 조직도에서 결재선 직원 요소 추가하는 구문
        var appE = document.querySelectorAll(".empList .addbtn");

        for (var i = 0; i < appE.length; i++) {
            appE[i].addEventListener("click", click1);
        }
 
        function click1(){

            let emp = $(this).parents("li");
            
                emp.clone(true).appendTo(".appList"); 
                $(".appList button").text('-');
                $(this).attr("disabled", true);
                delApp();            
        }
            
        function delApp(){

            // 추가된 결재선 직원을 다시 삭제하는 구문
            var appD = document.querySelectorAll(".appList .addbtn");
            for (var i = 0; i < appD.length; i++) {
                appD[i].addEventListener("click", click2);
            }

            function click2(){

                let del = $(this).parents("li");
                del.remove(); 

                // 선택했던 추가버튼 다시 활성화 시키기
                const bList = document.querySelectorAll(".empList input");

                for(var i = 0; i < bList.length; i++){

                    if($(this).siblings("input").val() == bList[i].value){

                        bList[i].nextElementSibling.removeAttribute("disabled");
                    }
                }

            }

        }
    </script>


    <!-- 참조 선택하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="ref-line">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">참조자 지정</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body appLine">
                <div class="appLine1">
                    <b style="color:gray">결재선</b>  | <b style="color:black;">참조자</b> <br><br>
                    조직도 <br>
                    <input type="search" style="width:120px"><button class="btn btn-outline-secondary">검색</button> <br>

                    <ul class="empList2">
                        <li id="repEmp1" class="repEmp">
                             <span>참조</span> 
                             <span>ddd1</span> 
                             <span>ddd1</span>
                             <input type="hidden" class="empNo" name="empNo" value="1">
                             <button class="btn btn-outline-secondary addbtn">+</button>
                        </li> 
                        <li id="repEmp2" class="repEmp"> 
                             <span>참조</span> 
                             <span>ddd2</span>
                             <span>ddd2</span>
                             <input type="hidden" class="empNo" name="empNo" value="2">
                             <button class="btn btn-outline-secondary addbtn">+</button>
                         </li> 
                         <li id="repEmp3" class="repEmp"> 
                             <span>참조</span> 
                             <span>ddd3</span>
                             <span>ddd3</span>
                             <input type="hidden" class="empNo" name="empNo" value="3">
                             <button class="btn btn-outline-secondary addbtn">+</button>
                         </li> 
                     </ul>

                </div>
                <div class="appLine2">
                    <form action="">
                        <h5>참조자 지정</h5>
                        <div class="repArea">
                            <ul>
                                <li>
                                    <span>기안</span>
                                    <span>정형돈</span>
                                    <span>부서명</span>
                                </li>                 
                            </ul>
                            <ul class="repList">

                            </ul>
                        </div>
                    </form>                   
                </div>

            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer"  style="margin:auto;">
                <button type="submit" class="btn btn-light" data-toggle="modal" data-target="#ref-line">확인</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>

    
    <script>

        // 조직도에서 참조 직원 요소 추가하는 구문
        var repE = document.querySelectorAll(".empList2 .addbtn");

        for (var i = 0; i < repE.length; i++) {
            repE[i].addEventListener("click", click3);
        }
 
        function click3(){

            let emp = $(this).parents("li");
            
                emp.clone(true).appendTo(".repList"); 
                $(".repList button").text('-');
                $(this).attr("disabled", true);
                delRep();            
        }
            
        function delRep(){

            // 추가된 참조 직원을 다시 삭제하는 구문
            var repD = document.querySelectorAll(".repList .addbtn");
            for (var i = 0; i < repD.length; i++) {
                repD[i].addEventListener("click", click4);
            }

            function click4(){

                let rev = $(this).parents("li");
                rev.remove(); 

                // 선택했던 추가버튼 다시 활성화 시키기
                const cList = document.querySelectorAll(".empList2 input");

                for(var i = 0; i < cList.length; i++){

                    if($(this).siblings("input").val() == cList[i].value){

                        cList[i].nextElementSibling.removeAttribute("disabled");
                    }
                }

            }

        }
        
    </script>

    <!-- 결재요청시 기안의견 작성하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="send-approval">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">결재요청</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                    <form action="">
                        <table class="table-borderless" style="width:100%; height:150px;">
                            
                                <tr>
                                    <td>결재문서명</td>
                                    <td>결재문서제목</td>
                                </tr>
                                <tr>
                                    <td>기안의견</td>
                                    <td>
                                        <textarea name="" id="" cols="30" rows="3" style="resize:none"></textarea>
                                    </td>
                                </tr>
                            
                        </table>
                    </form>        
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer" style="margin:auto;">
                <button type="submit" class="btn btn-light">결재요청</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>

</body>
</html>
