<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 조직도 트리 -->
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<link rel="stylesheet" type="text/css" href="resources/org/jquery.treeview.css"/>
<link rel="stylesheet" type="text/css" href="resources/org/demo/screen.css"/>
 <!-- 부트스트랩 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
  /* 전체 wrapper */
  .wrapper {width: 1200px;margin: 0 auto; position: absolute; top: 120px;}
  body {font-family: Arial, sans-serif;	margin: 0; padding: 0;}
  
  /* content */
  .board {width: 1000px; float: right;}
  .container {margin: 20px auto; width: 100%; padding: 20px;}
  form {max-width: 1000px; margin: 0 auto; padding: 10px; border-radius: 5px; box-sizing: border-box;}
  .search-container {display: flex; justify-content: flex-end;margin-bottom: 10px;}
  .namebox {
      display: inline-block;
      width: 300px;
      height: 120px;
      margin: 10px;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      box-shadow: 2px 2px 5px #ddd;
      text-align: center;
      z-index:-99;
  }
  .imagecard {
  	  display: inline-block;
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      float: left;
      margin-right: 10px;
  }
  .imagecard img {
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
      width: 300px;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.4); /* Add black background with opacity */
    }
    .modal-content {
      background-color: white;
      margin: 15% auto; /* 15% from the top and centered */
      padding: 20px;
      border: 1px solid #888;
      width: 300px; /* Could be more or less, depending on screen size */
    }
    .close {color: #aaa; float: right; font-size: 28px; font-weight: bold;}
    .close:hover, .close:focus {color: black; text-decoration: none; cursor: pointer;}
    
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
	   
	   <jsp:include page="../organization/orgSidebar.jsp" />
	  
	    <div class="board">
	    	<h2>조직도</h2>
			<div class="container">
	          <form>
	              <div class="search-container">
	                  <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#tree-modal">조직도</button>
	              </div>
	          </form>
	          
	          <div class="main">
	          	<c:forEach var="d" items="${deptList}">
			        <c:if test="${d.deptCode eq 'D1'}">
			            <h4><a onclick="dept1();">${d.deptName}</a></h4>
	          			<div id="d1">
				          <c:forEach var="e" items="${list}">
				          	<c:if test="${e.deptCode eq d.deptCode}">
					           <div class="namebox" data-toggle="modal" data-target="#myModal${ e.empNo }">
					            <table>
					            	<tr>
					            		<td>
					            			<c:if test="${e.empProfile eq null}">
					            				<img src="resources/profile_images/default_profile.png"  style="width:100px;">
					            			</c:if>
					            			<img src="${e.empProfile}"  style="width:100px;">
					            		</td>
					            		<td>
					            			<br><h4>${e.jobName} | ${e.empName}</h4>
					            			<input type="hidden" name="empNo" value="${e.empNo}">
					            		</td>
					            	</tr>
					            </table>
					           </div><br>
							  
					            <!--  모달  -->
								 <div id="myModal${ e.empNo }" class="modal">
									<div class="modal-dialog">
								    <div class="modal-content">
								      <span class="close" data-dismiss="modal">&times;</span>
								      <div class="modal-body">
								        <table>
								          <tr>
								            <td><input type="hidden" name="empNo" value="${e.empNo}">
								            	<c:if test="${e.empProfile eq null}">
					            					<img src="resources/profile_images/default_profile.png"  style="width:100px;">
					            				</c:if>
								            	<img src="${e.empProfile}"  style="width:200px;"></td>
								            <td><h3>${e.empName }</h3>
								              <p>${e.jobName }</p>
								              <p>${e.deptName }</p>
								              <p>${e.email }</p></td>
								          </tr>
								        </table>
								      </div>
								    </div>
								</div>
								  </div>
					          </c:if>
				          </c:forEach>
				          </div>
		          	</c:if> 
	          </c:forEach>
	          
	            <c:forEach var="d" items="${deptList}">
			        <c:if test="${d.deptCode eq 'D2'}">
			            <h4><a onclick="dept2();">${d.deptName}</a></h4>
	          			<div id="d2" style="display: none;">
				          <c:forEach var="e" items="${list}">
				          	<c:if test="${e.deptCode eq d.deptCode}">
					           <div class="namebox" data-toggle="modal" data-target="#myModal${ e.empNo }">
					            <table>
					            	<tr>
					            		<td>
					            			<c:if test="${e.empProfile eq null}">
					            				<img src="resources/profile_images/default_profile.png"  style="width:100px;">
					            			</c:if>
					            			<img src="${e.empProfile}"  style="width:80px;"></td>
					            		<td>
					            			<br><h4>${e.jobName} | ${e.empName}</h4>
					            			<input type="hidden" name="empNo" value="${e.empNo}">
					            		</td>
					            	</tr>
					            </table>
					           </div><br>
					           <!--  모달  -->
								 <div id="myModal${ e.empNo }" class="modal">
									<div class="modal-dialog">
								    <div class="modal-content">
								      <span class="close" data-dismiss="modal">&times;</span>
								      <div class="modal-body">
								        <table>
								          <tr>
								            <td><input type="hidden" name="empNo" value="${e.empNo}">
								            	<c:if test="${e.empProfile eq null}">
					            					<img src="resources/profile_images/default_profile.png"  style="width:100px;">
					            				</c:if>
								            	<img src="${e.empProfile}"  style="width:200px;"></td>
								            <td><h3>${e.empName }</h3>
								              <p>${e.jobName }</p>
								              <p>${e.deptName }</p>
								              <p>${e.email }</p></td>
								          </tr>
								        </table>
								      </div>
								    </div>
								  </div>
								</div>
					          </c:if>
				          </c:forEach>
				          </div>
		          	</c:if> 
	          </c:forEach>
	          
	          <c:forEach var="d" items="${deptList}">
			        <c:if test="${d.deptCode eq 'D3'}">
			            <h4><a onclick="dept3();">${d.deptName}</a></h4>
	          			<div id="d3" style="display: none;">
				          <c:forEach var="e" items="${list}">
				          	<c:if test="${e.deptCode eq d.deptCode}">
					           <div class="namebox" data-toggle="modal" data-target="#myModal${ e.empNo }">
					            <table>
					            	<tr>
					            		<td>
					            			<c:if test="${e.empProfile eq null}">
					            				<img src="resources/profile_images/default_profile.png"  style="width:100px;">
					            			</c:if>
					            			<img src="${e.empProfile}"  style="width:80px;"></td>
					            		<td>
					            			<br><h4>${e.jobName} | ${e.empName}</h4>
					            			<input type="hidden" name="empNo" value="${e.empNo}">
					            		</td>
					            	</tr>
					            </table>
					           </div><br>
					           <!--  모달  -->
								 <div id="myModal${ e.empNo }" class="modal">
									<div class="modal-dialog">
								    <div class="modal-content">
								      <span class="close" data-dismiss="modal">&times;</span>
								      <div class="modal-body">
								        <table>
								          <tr>
								            <td><input type="hidden" name="empNo" value="${e.empNo}">
								            	<c:if test="${e.empProfile eq null}">
					            					<img src="resources/profile_images/default_profile.png"  style="width:100px;">
					            				</c:if>
								            	<img src="${e.empProfile}"  style="width:200px;"></td>
								            <td><h3>${e.empName }</h3>
								              <p>${e.jobName }</p>
								              <p>${e.deptName }</p>
								              <p>${e.email }</p></td>
								          </tr>
								        </table>
								      </div>
								    </div>
								  </div>
								</div>
					          </c:if>
				          </c:forEach>
				          </div>
		          	</c:if> 
	          </c:forEach>
	          
	          <c:forEach var="d" items="${deptList}">
			        <c:if test="${d.deptCode eq 'D4'}">
			            <h4><a onclick="dept4();">${d.deptName}</a></h4>
	          			<div id="d4" style="display: none;">
				          <c:forEach var="e" items="${list}">
				          	<c:if test="${e.deptCode eq d.deptCode}">
					          <div class="namebox" data-toggle="modal" data-target="#myModal${ e.empNo }">
					            <table>
					            	<tr>
					            		<td>
					            			<c:if test="${e.empProfile eq null}">
					            				<img src="resources/profile_images/default_profile.png"  style="width:100px;">
					            			</c:if>
					            			<img src="${e.empProfile}"  style="width:80px;"></td>
					            		<td>
					            			<br><h4>${e.jobName} | ${e.empName}</h4>
					            			<input type="hidden" name="empNo" value="${e.empNo}">
					            		</td>
					            	</tr>
					            </table>
					           </div><br>
					           <!--  모달  -->
								 <div id="myModal${ e.empNo }" class="modal">
									<div class="modal-dialog">
								    <div class="modal-content">
								      <span class="close"  data-dismiss="modal">&times;</span>
								      <div class="modal-body">
								        <table>
								          <tr>
								            <td><input type="hidden" name="empNo" value="${e.empNo}">
								            	<c:if test="${e.empProfile eq null}">
					            					<img src="resources/profile_images/default_profile.png"  style="width:100px;">
					            				</c:if>
								            	<img src="${e.empProfile}"  style="width:200px;"></td>
								            <td><h3>${e.empName }</h3>
								              <p>${e.jobName }</p>
								              <p>${e.deptName }</p>
								              <p>${e.email }</p></td>
								          </tr>
								        </table>
								      </div>
								    </div>
								  </div>
								</div>
					          </c:if>
				          </c:forEach>
				          </div>
		          	</c:if> 
	          </c:forEach>
	          
	          <c:forEach var="d" items="${deptList}">
			        <c:if test="${d.deptCode eq 'D5'}">
			            <h4><a onclick="dept5();">${d.deptName}</a></h4>
	          			<div id="d5" style="display: none;">
				          <c:forEach var="e" items="${list}">
				          	<c:if test="${e.deptCode eq d.deptCode}">
					          <div class="namebox" data-toggle="modal" data-target="#myModal${ e.empNo }">
					            <table>
					            	<tr>
					            		<td>
					            			<c:if test="${e.empProfile eq null}">
					            				<img src="resources/profile_images/default_profile.png"  style="width:100px;">
					            			</c:if>
					            			<img src="${e.empProfile}"  style="width:80px;"></td>
					            		<td>
					            			<br><h4>${e.jobName} | ${e.empName}</h4>
					            			<input type="hidden" name="empNo" value="${e.empNo}">
					            		</td>
					            	</tr>
					            </table>
					           </div><br>
					           <!--  모달  -->
								 <div id="myModal${ e.empNo }" class="modal">
									<div class="modal-dialog">
								    <div class="modal-content">
								      <span class="close" data-dismiss="modal">&times;</span>
								      <div class="modal-body">
								        <table>
								          <tr>
								            <td><input type="hidden" name="empNo" value="${e.empNo}">
								            	<c:if test="${e.empProfile eq null}">
					            					<img src="resources/profile_images/default_profile.png"  style="width:100px;">
					            				</c:if>
								            	<img src="${e.empProfile}"  style="width:200px;"></td>
								            <td><h3>${e.empName }</h3>
								              <p>${e.jobName }</p>
								              <p>${e.deptName }</p>
								              <p>${e.email }</p></td>
								          </tr>
								        </table>
								      </div>
								    </div>
								  </div>
								</div>
					          </c:if>
				          </c:forEach>
				          </div>
		          	</c:if> 
	          </c:forEach>
	          
	          
	          <c:forEach var="d" items="${deptList}">
			        <c:if test="${d.deptCode eq 'D6'}">
			            <h4><a onclick="dept6();">${d.deptName}</a></h4>
	          			<div id="d6" style="display: none;">
				          <c:forEach var="e" items="${list}">
				          	<c:if test="${e.deptCode eq d.deptCode}">
					           <div class="namebox" data-toggle="modal" data-target="#myModal${ e.empNo }">
					            <table>
					            	<tr>
					            		<td>
					            			<c:if test="${e.empProfile eq null}">
					            				<img src="resources/profile_images/default_profile.png"  style="width:100px;">
					            			</c:if>
					            			<img src="${e.empProfile}"  style="width:80px;"></td>
					            		<td>
					            			<br><h4>${e.jobName} | ${e.empName}</h4>
					            			<input type="hidden" name="empNo" value="${e.empNo}">
					            		</td>
					            	</tr>
					            </table>
					           </div><br>
					           <!--  모달  -->
								 <div id="myModal${ e.empNo }" class="modal">
									<div class="modal-dialog">
								    <div class="modal-content">
								      <span class="close"  data-dismiss="modal">&times;</span>
								      <div class="modal-body">
								        <table>
								          <tr>
								            <td><input type="hidden" name="empNo" value="${e.empNo}">
								            	<c:if test="${e.empProfile eq null}">
					            					<img src="resources/profile_images/default_profile.png"  style="width:100px;">
					            				</c:if>
								            	<img src="${e.empProfile}"  style="width:200px;"></td>
								            <td><h3>${e.empName }</h3>
								              <p>${e.jobName }</p>
								              <p>${e.deptName }</p>
								              <p>${e.email }</p></td>
								          </tr>
								        </table>
								      </div>
								    </div>
								  </div>
								</div>
					          </c:if>
				          </c:forEach>
				          </div>
		          	</c:if> 
	          </c:forEach>
	         </div> 
	      </div>
	    </div>
	</div>
	   
	  
	  
		
		<script>
			function dept1(){
				if($('#d1').css('display') == 'none'){
				$('#d1').show();
				
				}else{
					$('#d1').hide();
				}
			}
			
			function dept2(){
				if($('#d2').css('display') == 'none'){
				$('#d2').show();
				
				}else{
					$('#d2').hide();
				}
			}
			
			function dept3(){
				if($('#d3').css('display') == 'none'){
				$('#d3').show();
				
				}else{
					$('#d3').hide();
				}
			}
			
			function dept4(){
				if($('#d4').css('display') == 'none'){
				$('#d4').show();
				
				}else{
					$('#d4').hide();
				}
			}
			
			function dept5(){
				if($('#d5').css('display') == 'none'){
				$('#d5').show();
				
				}else{
					$('#d5').hide();
				}
			}
			
			function dept6(){
				if($('#d6').css('display') == 'none'){
				$('#d6').show();
				
				}else{
					$('#d6').hide();
				}
			}
		</script>
			    
			    
			    
	  <!-- 검색/조직도 트리 -->
		<!-- 모달 -->
		<div class="modal fade" id="tree-modal" tabindex="-1" role="dialog" aria-labelledby="tree-modal-label" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="tree-modal-label">
						
							<form action="searchForm.org" method="Get" id="searchForm">
								<input type="hidden" name="cpage" value="1">
									<%-- <input type="text" name="keyword" value="${keyword}" id="search" placeholder="사원 검색"></h5>
									<button type="submit" class="btn btn-success" >검색</button> --%>
							</form>
							
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					
						<!-- 조직도 트리 -->
						
						<div id="main">
	
							<h5>Easy peasy조직도</h5>
							<form action="adminList.org">
								<input type="hidden" name="empNo" value="empNo">
								<ul id="browser" class="filetree treeview-famfamfam">
									<li><span class="folder">이지피지</span>
										<ul class="empList">
										
											<c:forEach var="d" items="${deptList}">
												<li class="closed">
													<span class="folder">${d.deptName}</span>
													<ul>
														<c:forEach var="e" items="${list}">
															<c:if test="${ e.deptName eq d.deptName }">
																<li class="empInfo">
																	<span class="file">
																		${e.jobName} ${ e.empName }
																		<input type="hidden" name="empNo" value="${e.empNo}">
																		<!-- <button class="btn btn-outline-secondary btn-sm addbtn">+</button> -->
																	</span>
																</li>
															</c:if>
														</c:forEach>
													</ul>
												</li>
											</c:forEach>
											
										</ul>
									</li>
								</ul>
							</form>
							
							
							
						</div>
	                    <div class="modal-footer">
	                    	<!-- <button type="button" onclick="copyApp();" class="btn btn-light" data-dismiss="modal">상세조회</button> -->
	                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                    </div>
	                </div>
	            </div>
	        </div>
		</div>
		<script src="resources/org/demo/jquery.cookie.js" type="text/javascript"></script>
		<script src="resources/org/jquery.treeview.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#browser").treeview({
					toggle: function() {
						console.log("%s was toggled.", $(this).find(">span").text());
					}
				});
			
				$("#add").click(function() {
					var branches = $("<li><span class='folder'>New Sublist</span><ul>" +
						"<li><span class='file'>Item1</span></li>" +
						"<li><span class='file'>Item2</span></li></ul></li>").appendTo("#browser");
					$("#browser").treeview({
						add: branches
					});
				});
			});
		</script>
		
		
</body>
</html>
	          
	          
	          
	          
	          
	          