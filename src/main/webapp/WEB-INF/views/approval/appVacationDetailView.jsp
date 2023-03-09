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
        .left-outer{width:80%;padding:30px;} 
        .right-outer{width:20%;padding:15px;}   
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
                <p><b style="font-size:30px;">휴가신청서</b></p>
            </div>
            <div class="left-form2">
                <a href="" style="padding:20px; color:rgb(71, 71, 71);">문서삭제</a> |
                <a href="" style="padding:20px; color:rgb(71, 71, 71);">기안수정</a>
                <br><br>
                            <!-- 결재자일때 보일버튼 -->
                <a href="" style="padding:20px; color:rgb(71, 71, 71);" data-toggle="modal" data-target="#approval">결재</a> |  
                <a href="" style="padding:20px; color:rgb(71, 71, 71);" data-toggle="modal" data-target="#companion">반려</a> |
                <a href="" style="padding:20px; color:rgb(71, 71, 71);">문서수정</a>
                <br><br>
            </div>

            
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
                        <td width="100px;" style="text-align:center">기안자</td>
                        <td width="200px;">정형돈</td>
                    </tr>
                    <tr>
                        <td style="text-align:center">소속</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="text-align:center">기안일</td>
                        <td style="text-align:center"></td>
                    </tr>
                    <tr>
                        <td style="text-align:center">문서번호</td>
                        <td></td>
                    </tr>
                </table>
                <br>
            </div>
            <div class="left-form5">
                <table class="table-bordered" >
                    <tr>
                        <td width="100px;" style="text-align:center">휴가종류</td>
                        <td width="700px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:center">기간 및 일시</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="text-align:center">반차여부</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td rowspan="5" style="text-align:center">휴가사유</td>
                        <td rowspan="5" height="150px;">내용</td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        
                    </tr>
                    <tr>
                       
                    </tr>
                    <tr>
                      
                    </tr>
                    <tr>
                        <td colspan="2">
                            1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다. <br>
                            &nbsp;&nbsp;&nbsp;&nbsp;단, 최초 입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다. <br>
                            2. 경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출 <br>
                            3. 공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:center">첨부파일</td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <br>
            <div class="left-form6">
                <p>댓글(n)</p> 
                <div style="padding:10px;">
                    <input type="text" style="width:600px;" placeholder="내용을 입력해주세요"><button>댓글작성</button>
                </div>
                <div style="padding:10px;">
                    <img src="img/user.png" width="30px;" alt="">&nbsp;정형돈 과장 | 부서명 | 날짜 <div style="float:right;"> <a href="" >수정</a> | <a href="">삭제</a></div> <br><br>
                    댓글내용
                </div>
            </div>
        </div>
        <div class="right-outer" style="padding-left:20px; border-left:1px solid gray;">
            <br>
            <div style="text-align:center; padding:20px; font-size:20px;">
                 <p><b> 결재선</b></p>
            </div>
           
            <div class="app-comment" style="font-size:15px;">
                <img src="img/user.png" width="30px;" alt=""> &nbsp;정형돈 과장
                <br>
                회사명 | 부서명
                <br>
                
                기안 상신 | 날짜
                <br><br>
                <hgroup class="speech-bubble">
                    <br>
                    &nbsp;&nbsp;국밥먹자
                    <br><br>
                </hgroup>
                <br>
            </div>

            <div class="app-comment" style="font-size:15px;">
                <img src="img/user.png" width="30px;" alt="">&nbsp;정형돈 과장
                <br>
                회사명 | 부서명
                <br>
                 결재 | 날짜
                <br><br>
                <hgroup class="speech-bubble">
                    <br>
                    &nbsp;&nbsp;시름
                    <br><br>
                </hgroup>
                <br>
            </div>
            
            
        </div>
    </div>

    <!-- 결재하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="approval">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">결재하기</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                    <form action="">
                        <table class="table-borderless" style="width:100%; height:150px;">
                            
                                <tr>
                                    <td>결재문서명</td>
                                    <td>휴가신청서</td>
                                </tr>
                                <tr>
                                    <td>결재의견</td>
                                    <td>
                                        <textarea name="" id="" cols="30" rows="3" style="resize:none"></textarea>
                                    </td>
                                </tr>
                            
                        </table>
                    </form>        
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer" style="margin:auto;">
                <button type="submit" class="btn btn-light">승인</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>

    <!-- 반려하는 모달 -->
    <!-- The Modal -->
    <div class="modal" id="companion">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">반려하기</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                    <form action="">
                        <table class="table-borderless" style="width:100%; height:150px;">
                            
                                <tr>
                                    <td>결재문서명</td>
                                    <td>휴가신청서</td>
                                </tr>
                                <tr>
                                    <td>반려의견</td>
                                    <td>
                                        <textarea name="" id="" cols="30" rows="3" style="resize:none"></textarea>
                                    </td>
                                </tr>
                            
                        </table>
                    </form>        
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer" style="margin:auto;">
                <button type="submit" class="btn btn-light">반려</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>    
</body>
</html>