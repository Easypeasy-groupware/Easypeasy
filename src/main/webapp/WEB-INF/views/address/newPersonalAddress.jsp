<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
<style>
    .content-outer{width:1000px; margin-left:200px;}
    .content-outer *{box-sizing: border-box;}
    #address-group{font-size:22px; font-weight:600;}
    
    .nav-link{color:black;}
    .active{font-weight: 600;}
   

    /*테이블*/
    .input-table{
        margin:auto; 
        border-collapse: separate; border-spacing:0px 10px; /*셀간격*/
    }
    .col-2{
        width:100%; height:100%;
        border:1px solid gray; border-radius:5px;
    }

    .td-select{
        width:98%; height:100%;
        border:1px solid gray; border-radius:5px;
    }
    #add-btn{
        width:100%; height:100%;
        border:0; border-radius:5px; 
        color:white; background:rgb(166, 184, 145);
    }
    .td-textarea{border:1px solid gray; border-radius:5px;}

    /*버튼*/
    .set-btn{border:0; border-radius: 5px; width:90px; height:30px; color:white;}
    #reset-btn{background:rgb(158, 158, 158); margin:0 5px 0 450px;}
    #submit-btn{background:rgb(166, 184, 145);}

    /*그룹추가용 모달*/
    .modal-body, .modal-footer{text-align: center;}
    #modal-input{width:60%; height:40px; margin-top:10px; border:1px solid gray; border-radius:5px;}
    #modal-close-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(158, 158, 158); display:inline-block;}
    #modal-add-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(166, 184, 145); display:inline-block;}
</style>
</head>
<body>	

	<jsp:include page="addMenubar.jsp"/>
	
    <div class="content-outer">

        <p id="address-group">연락처추가</p>

        <br>

        <ul class="nav nav-tabs">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">개인</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">공용</a>
            </li>
        </ul>

        <br>
        <form action="">
            <table class="input-table" border=1>
                <colgroup>
                    <col style="width:150px;">
                    <col style="width:350px;">
                    <col style="width:150px;">
                </colgroup>
                <tr>
                    <td>이름</td>
                    <td colspan="2">
                        <input type="text" class="col-2" required>
                    </td>
                </tr>
                <tr>
                    <td>회사</td>
                    <td colspan="2">
                        <input type="text" class="col-2">
                    </td>
                </tr>
                <tr>
                    <td>부서</td>
                    <td colspan="2">
                        <input type="text" class="col-2">
                    </td>
                </tr>
                <tr>
                    <td>직위</td>
                    <td colspan="2">
                        <input type="text" class="col-2">
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td colspan="2">
                        <input type="email" class="col-2">
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td colspan="2">
                        <input type="text" class="col-2">
                    </td>
                </tr>
                <tr>
                    <td>그룹</td>
                    <td>
                        <select class="td-select">
                            <option>선택안함</option>
                            <option>friends</option>
                            <option>aaa</option>
                            <option>거래처</option>
                        </select>
                    </td>
                    <td>
                        <button type="button" id="add-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">새그룹</button>
                    </td>
                </tr>
                <tr>
                    <td>회사전화</td>
                    <td colspan="2">
                        <input type="text" class="col-2">
                    </td>
                </tr>
                <tr>
                    <td>회사주소</td>
                    <td colspan="2">
                        <input type="text" class="col-2" style="width:100%;">
                    </td>
                </tr>
                <tr>
                    <td>메모</td>
                    <td colspan="2">
                        <textarea class="td-textarea" rows="4" style="resize:none; width:100%">

                        </textarea>
                    </td>
                </tr>
            </table>

            <br>

            <button type="reset" class="set-btn" id="reset-btn">초기화</button>
            <button type="submit" class="set-btn" id="submit-btn">추가</button>

        </form>
    </div>

    <!--새로운 그룹 추가용 모달-->
    <div class="modal fade" id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <p class="modal-title" style="font-weight:600">새 그룹 추가</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                <form>
                    <div class="modal-body">
                        <input type="text" id="modal-input" name="newGroup">
                        <br><br>
                        <button type="button" data-bs-dismiss="modal" id="modal-close-btn">닫기</button>
                        <button type="submit" id="modal-add-btn">추가</button>
                    </div>
                    
                </form>

            </div>
          </div>
    </div>
</body>
</html>