<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
    <style>
         /* 안가져감 */
     div{
        box-sizing:border-box; 
         border:1px solid red;
         } 
  
       .menubar{
        box-sizing:border-box;
        width:200px;
        border:1px solid gray;
        float:left;
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
    </style>
</head>
<body>
    
    <div class="menubar">
        <br><br>
        <ul class="app-menu">
            <li><button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#newApp">새 결재 진행</button></li>
            <br>
            <li><a href="">결재 대기문서</a></li>
            <li><a href="">참조 대기문서</a></li>
            <br>
            <li><b>개인</b></li>
            <li><a href="">기안문서함</a></li>
            <li><a href="">임시저장함</a></li>
            <li><a href="">결재문서함</a></li>
            <li><a href="">참조문서함</a></li>
            <br>
            <li><b>부서</b></li>
            <li><a href="">기안완료함</a></li>
            <li><a href="">부서참조함</a></li>
            <br><br>
        </ul>
    </div>
  
    <!-- 새 결재 양식 선택하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="newApp">
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
                    <form action="" id="newApp-form">
                        <br>
                        <ul>
                            <li>
                                <input type="radio" name="newForm" id="draft" value="draft">
                                <label for="draft">업무기안</label>   
                            </li>
                            <li>
                                <input type="radio" name="newForm" id="appr" value="appr">
                                <label for="appr">일반품의서</label>  
                            </li>
                            <li>
                                <input type="radio" name="newForm" id="vac" value="vac">
                                <label for="vac">휴가신청서</label>  
                            </li>
                            <li>
                                <input type="radio" name="newForm" id="extra" value="extra">  
                                <label for="extra">연장근무신청서</label>
                            </li>
                        </ul>
                    </form>
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
                <button type="submit" class="btn btn-light">확인</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>
    
    <script>
        $(document).ready(function(){
            $("input[name='newForm']").change(function(){
                if($("input[name='newForm']:checked").val()=='draft' || $("input[name='newForm']:checked").val()=='appr'){
                    $("#grade").text('A');
                    $("#preser").text('5년');
                }else{
                    $("#grade").text('B');
                    $("#preser").text('3년');
                }
            });
        });
    </script>

</body>
</html>
