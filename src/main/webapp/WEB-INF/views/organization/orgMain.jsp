<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
  /* 전체 wrapper */
  .wrapper {width: 1200px;margin: 0 auto;}
  .sidebar {top: 0; left: 0; width: 200px; height: 100%; float: left;}
  h4 {text-align: center;}
	.topbtn {display: flex; align-items: center; justify-content: center; height: 80px;}
	.menu {margin-top: 20px;}
	.menu ul {list-style: none; padding: 0; margin: 0;}
	.menu li {margin-bottom: 5px; }
	.menu a {display: block; padding: 10px; color: #333; text-decoration: none; transition: background-color 0.3s ease-in-out;}
	.menu a:hover {background-color: #f2f2f2;}
	.submenu ul {list-style: none; padding: 0; margin: 0;	display: none;}
	.submenu li {margin-bottom: 5px;}
	.submenu a {display: block;padding: 10px;color: #333;text-decoration: none;transition: background-color 0.3s ease-in-out;}
	.submenu a:hover {background-color: #f2f2f2;}
	.active {background-color: #f2f2f2;}
	.collapse-indicator:after {content: " ∨";}
	.submenu.active > .collapse-indicator:after {content: " ∧";}
  /*board*/
  body {font-family: Arial, sans-serif;	margin: 0; padding: 0;}
  .board {width: 1000px; float: right;}
	.container {margin: 20px auto; width: 100%; border: 1px solid #ccc; padding: 20px;}
  form {max-width: 1000px; margin: 0 auto; padding: 10px; border-radius: 5px; box-sizing: border-box;}
  .search-container {display: flex; justify-content: flex-end;margin-bottom: 10px;}
	.search-container input[type=text] { padding: 6px; margin-right: 10px; border: none; border-radius: 3px; width: 200px;}
  .card {
      display: inline-block;
      width: 300px;
      height: 120px;
      margin: 10px;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      box-shadow: 2px 2px 5px #ddd;
      text-align: center;
  }
  .image {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      object-fit: cover;
      float: left;
      margin-right: 10px;
  }
  .image img {
      display: inline-block;
      width: 100px;
      height: 100px;
      object-fit: cover;
      border-radius: 50%;
  }
  .details { align-items: center; margin-top: 10px;}
  .details h4 { margin: 0; text-align: center; transform: translateY(70%);}
/* Modal styles */
    .modal {
      display: none; /* Hide modal by default */
      position: fixed; /* Position modal */
      z-index: 1; /* Make modal appear on top of other elements */
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto; /* Enable scrolling if content exceeds viewport height */
      background-color: rgba(0, 0, 0, 0.4); /* Add black background with opacity */
    }
    .modal-content {
      background-color: white;
      margin: 15% auto; /* 15% from the top and centered */
      padding: 20px;
      border: 1px solid #888;
      width: 600px; /* Could be more or less, depending on screen size */
    }
    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }
    .close:hover, .close:focus {color: black; text-decoration: none; cursor: pointer;}
</style>
</head>
<body>

	<div class="wrapper">
    <div class="sidebar">
    	<h4>게시판</h4><br>
      <div class="topbtn">
        <button type="button" class="btn btn-success">관리자</button>
      </div>
      <div class="menu">
        <ul>
          <li><a href="#">인사관리부</a></li>
          <li><a href="#">경영지원부</a></li>
          <li class="submenu">
                      <a href="#" class="dep">영업부</a>
                       <ul>
                          <li><a href="#">영업 1팀</a></li>
                          <li><a href="#">영업 2팀</a></li>
              			  <li><a href="#">영업 3팀</a></li>
                      </ul>
                  </li>   
          <li><a href="#">마케팅부</a></li>
              </ul>
          </div>
    </div>
  
    <script>
      $(document).ready(function () {
        $('.menu li').click(function () {
          $(this).toggleClass('active');
        });
      });
    </script>



    <div class="board">
    	<h2>조직도</h2><br>
      <div class="container">
          
          <h6>인사관리부</h6>
          <form>
              <div class="search-container">
                  <select>
                      <option value="author">부서</option>
                      <option value="content">이름</option>
                  </select>
                      <input type="text" placeholder="내용을입력하세요">
                      <button type="button" class="btn btn-outline-dark btn-sm" onclick="search()">검색</button>
              </div>
          </form>
        
          <div class="card">
            <div class="image">
                <img src="../defaultProfile.png"  alt="Profile Image">
            </div>
            <div class="details">
                <h4>부장 홍길동</h4>
            </div>
        </div>
        <br>
          <div class="card">
            <div class="image">
                <img src="../defaultProfile.png"  alt="Profile Image">
            </div>
            <div class="details">
                <h4>과장 홍길동</h4>
            </div>
        </div>
        <br>
          <div class="card">
              <div class="image">
                  <img src="../defaultProfile.png"  alt="Profile Image">
              </div>
              <div class="details">
                  <h4>대리 홍길동</h4>
              </div>
          </div>
          <div class="card">
            <div class="image">
                <img src="../defaultProfile.png"  alt="Profile Image">
            </div>
            <div class="details">
                <h4>대리 홍길동</h4>
            </div>
        </div>
          <br>
          <div class="card">
            <div class="image">
                <img src="../defaultProfile.png"  alt="Profile Image">
            </div>
            <div class="details">
                <h4>사원 홍길동</h4>
            </div>
          </div>
          <div class="card">
            <div class="image">
                <img src="../defaultProfile.png"  alt="Profile Image">
            </div>
            <div class="details">
                <h4>사원 홍길동</h4>
            </div>
          </div>
      </div>
    </div>
  </div>

   <!-- 모달 -->
  <div id="myModal" class="modal">
    <div class="modal-content">
      <span class="close">&times;</span>
      <div class="modal-body">
        <table>
          <tr>
            <td><img src="../defaultProfile.png" alt="Profile Image" style="width:80%;"></td>
            <td><h3>홍길동</h3>
              <p>부장</p>
              <p>인사관리부</p>
              <p>honggildong@company.com</p></td>
          </tr>
        </table>
      </div>
    </div>
  </div>

  <script>
    // 모달을 위한 JavaScript 코드
    var modal = document.getElementById("myModal");
    var card = document.querySelector(".card");
    var img = document.querySelector(".card img");
    var span = document.getElementsByClassName("close")[0];

    card.addEventListener("click", function() {
      modal.style.display = "block";
      img.classList.add("modal-image");
    });

    span.onclick = function() {
      modal.style.display = "none";
      img.classList.remove("modal-image");
    };

    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
        img.classList.remove("modal-image");
      }
    };
  </script>
    
   
    
</div>   
  
</body>
</html>