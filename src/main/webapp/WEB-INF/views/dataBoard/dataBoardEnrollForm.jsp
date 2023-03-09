<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{
        box-sizing: border-box;
    }
    
    #content{
        border-left: 1px solid lightgray;
        width: 1000px;
        float: left;
        box-sizing: border-box;
    }

    #sidebar{
        width: 200px;
        float: left;
        padding-left: 10px;
        padding-top: 10px;
    }
    #sidebar a{
        color: black;
        text-decoration: none;
    }

    #title h5{
        padding-left: 25px;
        padding-top: 15px;
        float: left;
    }

    #content>table{
        width: 950px;
    }
    #content-1 input{
        border: 1px solid lightgray;
        border-radius: 5px;
        height: 30px;
    }
    #content-1 textarea{
        border: 1px solid lightgray;
        border-radius: 5px;
    }

    #submit{
        text-align: center;
    }
    #submit button[type=reset]{
        border: 1px solid lightgray;
    }


    .filebox input[type="file"] {
	    position: absolute;
	    width: 1px;
	    height: 1px;
	    padding: 0;
	    margin: -1px;
	    overflow: hidden;
	    clip:rect(0,0,0,0);
	    border: 0;
    }

    .filebox label {
	    display: inline-block;
	    padding: 5px 10px;
	    color: white;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background: rgb(214, 223, 204);
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-bottom-color: #e2e2e2;
	    border-radius: .25em;
	    margin-top: 5px;
	    margin-left: 10px;
    }

    /* named upload */
    .filebox .upload-name {
	    display: inline-block;
	    padding: 5px 10px;  /* label의 패딩값과 일치 */
	    font-size: inherit;
	    font-family: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #f5f5f5;
	    border: 1px solid #ebebeb;
	    border-bottom-color: #e2e2e2;
	    border-radius: .25em;
	    -webkit-appearance: none; /* 네이티브 외형 감추기 */
	    -moz-appearance: none;
	    appearance: none;
    }
</style>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<jsp:include page="sidebar.jsp"/>
	
    <div id="content">
        <div id="title">
            <span>
                <h5>자료실 작성</h5>
            </span>
        </div>
        <br>
        <br><br>
        <form action="" method="post" enctype="multipart/form-data">
            <div id="content-1">
                <table id="enroll" align="center">
                    <tr height="70">
                        <th width="80">제목</th>
                        <td>
                            <input type="text" name="" size="100" required>
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea name="" cols="99" rows="8" style="resize: none;"></textarea>
                        </td>
                    </tr>
                    <tr height="60">
                        <th>첨부파일</th>
                        <td>
                            <div class="filebox">
                                <input class="upload-name" disabled="disabled">
                            
                                <label for="ex_filename">업로드</label> 
                                <input type="file" id="ex_filename" class="upload-hidden" required> 
                            </div>
                        </td>
                    </tr>
                </table>
                <br><br>
                <div id="submit">
                    <button class="btn btn-sm btn-light" style="border: 1px solid lightgray; background: rgb(214, 223, 204); color: white;">등록</button>&nbsp;&nbsp;
                    <button type="reset" class="btn btn-sm btn-light">취소</button>
                </div>
            </div>
        </form>
    </div>
    <br>

    <script>
        $(document).ready(function(){
            var fileTarget = $('.filebox .upload-hidden');

            fileTarget.on('change', function(){  // 값이 변경되면
                if(window.FileReader){  // modern browser
                var filename = $(this)[0].files[0].name;
                } 
                else {  // old IE
                var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
                }
                
                // 추출한 파일명 삽입
                $(this).siblings('.upload-name').val(filename);
            });
        }); 
    </script>

</body>
</html>