<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<ul class="comment-section">

		<li class="comment user-comment">

               <div class="info">
                   <a href="#">Anie Silverston</a>
                   <span>4 hours ago</span>
               </div>

               <a class="avatar" href="#">
                   <img src="resources/chat-images/avatar_user_1.jpg" width="35" alt="Profile Avatar" title="Anie Silverston" />
               </a>

               <p>Suspendisse gravida sem?</p>

		</li>

		<li class="comment author-comment">

               <div class="info">
                   <a href="#">Jack Smith</a>
                   <span>3 hours ago</span>
               </div>

               <a class="avatar" href="#">
                   <img src="resources/chat-images/avatar_author.jpg" width="35" alt="Profile Avatar" title="Jack Smith" />
               </a>

               <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse gravida sem sit amet molestie portitor.</p>

		</li>

		<li class="comment user-comment">

               <div class="info">
                   <a href="#">Bradley Jones</a>
                   <span>1 hour ago</span>
               </div>

               <a class="avatar" href="#">
                   <img src="resources/chat-images/avatar_user_2.jpg" width="35" alt="Profile Avatar" title="Bradley Jones" />
               </a>

               <p>Suspendisse gravida sem sit amet molestie portitor?</p>

		</li>

           <li class="comment author-comment">

               <div class="info">
                   <a href="#">Jack Smith</a>
                   <span>1 hour ago</span>
               </div>

               <a class="avatar" href="#">
                   <img src="resources/chat-images/avatar_author.jpg" width="35" alt="Profile Avatar" title="Jack Smith" />
               </a>

               <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisee gravida sem sit amet molestie porttitor.</p>

           </li>

           <li class="write-new">

               <form action="#" method="post">

                   <textarea placeholder="Write your comment here" name="comment"></textarea>

                   <div>
                       <img src="resources/chat-images/avatar_user_2.jpg" width="35" alt="Profile of Bradley Jones" title="Bradley Jones" />
                       <button type="submit">Submit</button>
                   </div>

               </form>

           </li>

	</ul>

      
</body>
</html>