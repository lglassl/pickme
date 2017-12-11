<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="wrapper">
	<header class="main-header">
		<!-- Logo -->
		<a href="/home.htm" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"><b>P</b>M</span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><b>Pick</b> Me</span>
		</a>
		<!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top" role="navigation">
			<!-- Sidebar toggle button-->
			<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
				role="button"> <span class="sr-only">Toggle navigation</span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
			</a>
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">


					<!-- 회원가입 -->
					<se:authorize access="!hasRole('ROLE_JOIN')">
						<li class="dropdown user user-menu"><a href="/join_solo.htm"
							class="dropdown-toggle">회원가입</a></li>
					</se:authorize>

					<se:authentication property="name" var="LoginUser" />
					<!-- 일반회원 -->
					<se:authorize access="hasAnyRole('ROLE_JOIN', 'ROLE_USER')">
						<se:authorize access="!hasRole('ROLE_COMP')">
							<se:authorize access="!hasRole('ROLE_ADMIN')">
							
							<!-- 쪽지 -->
					<li class="dropdown messages-menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="fa fa-envelope-o"></i>
					</a>
						<ul class="dropdown-menu">
							<li class="header">You have ${lCount} messages</li>
							<li>
								<!-- inner menu: contains the actual data -->
								<ul class="menu">
								<c:forEach var="lList" items="${letterList}">
									<li>
									<!-- start message -->
									<a href="#" onclick="show(${lList.letter_no})">
										<div class="pull-left">
											<img src="/resources/dist/img/user7-128x128.jpg" class="img-circle" alt="User Image" />
										</div>
										<h4>
											${lList.comp_username} <small><i class="fa fa-clock-o"></i> 5 mins</small>
										</h4>
										<p>제출 관련 쪽지</p>
									</a>
									</li>
									</c:forEach>
								</ul>
							</li>
						</ul></li>
								<li class="dropdown user user-menu"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown"> 
									회원정보
								</a>
									<ul class="dropdown-menu">
										<li class="user-header"><img
											src="/resources/dist/img/user2-160x160.jpg"
											class="img-circle" alt="User Image" />
											<p>
												<a href="/member_confirm.htm" class="btn btn-default">회원정보수정</a>
											</p> <se:authorize access="hasAnyRole('ROLE_USER')">
												<p>${sname}님의채용 정보</p>
												<div class="pull-left">
													<a href="#" style="color: #fff">작성중 12</a>
												</div>
												<div class="pull-right">
													<a href="#" style="color: #fff">제출완료 4</a>
												</div>
											</se:authorize></li>
									</ul></li>
							</se:authorize>
						</se:authorize>
					</se:authorize>

					<!-- 기업회원 -->
					<se:authorize access="hasAnyRole('ROLE_COMP')">
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <span
								class="hidden-xs">기업정보</span>
						</a>
							<ul class="dropdown-menu">
								User image
								<li class="user-header">우리 로고 <img
									src="/resources/bootstrap/upload/images/${clogo}"
									class="img-circle" alt="User Image" />
									<p>
										<a href="/member_confirm_comp.htm" class="btn btn-default">기업정보수정</a>
									</p>
									<p>${cname}님의채용 정보</p> 작성중과 제출완료 링크는 같은 곳의 링크(제출 이력서 리스트)
									<div class="pull-left">
										<a href="#" style="color: #fff">작성중 12</a>
									</div>
									<div class="pull-right">
										<a href="#" style="color: #fff">제출완료 4</a>
									</div>
								</li>
							</ul></li>
					</se:authorize>

					<li>
					<se:authorize access="!hasRole('ROLE_JOIN')">
						<a href="/login.htm" class="dropdown-toggle">로그인</a>
					</se:authorize> 
					
					<se:authentication property="name" var="LoginUser" /> 
					<se:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER', 'ROLE_JOIN')">
						<a href="/logout" class="dropdown-toggle">로그아웃</a>
					</se:authorize></li>
					<!-- Control Sidebar Toggle Button(웹 사이트 설정부분) -->
					<!-- 
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li>
               -->
				</ul>
			</div>

		</nav>
	</header>


	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar">
		<!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar">
			<!-- Sidebar user panel -->
			<div class="user-panel">

				<!-- 일반회원 -->
				<se:authorize access="hasAnyRole('ROLE_USER')">
					<div class="pull-left image">
						<!-- 우리 로고 -->
						<img src="/resources/dist/img/user2-160x160.jpg"
							class="img-circle" alt="User Image" />
					</div>
					<div class="pull-left info">
						<p>
							<b>${sname}</b>님 환영합니다
						</p>
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</se:authorize>

				<!-- 기업회원 -->
				<se:authorize access="hasAnyRole('ROLE_COMP')">
					<div class="pull-left image">
						<!-- 우리 로고 -->
						<img src="${clogo}"
							class="img-circle" alt="User Image" />
					</div>
					<div class="pull-left info">
						<p>
							<b>${cname}</b>님 환영합니다
						</p>
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</se:authorize>

				<!-- 관리자 -->
				<se:authorize access="hasAnyRole('ROLE_ADMIN')">
					<div class="pull-left image">
						<!-- 우리 로고 -->
						<img src="/resources/images/check.png" class="img-circle"
							alt="User Image" />
					</div>
					<div class="pull-left info">
						<p>
							<b>관리자</b>님 환영합니다
						</p>
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</se:authorize>
			</div>

			<!-- 비회원 aside -->
			<se:authorize access="!hasRole('ROLE_JOIN')">
				<ul class="sidebar-menu">
					<li class="header">MAIN NAVIGATION</li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-pie-chart"></i> <span>채용공고</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="/comp_pick_list.htm"><i
									class="fa fa-circle-o"></i>채용리스트</a></li>
							<li><a href="/comp_pick_cal.htm"><i
									class="fa fa-circle-o"></i>채용달력</a></li>
						</ul></li>

					<li><a href="../entity_list.htm"> <i class="fa fa-th"></i>
							<span>소통 게시판</span> <small class="label pull-right bg-green">new</small>
					</a></li>
					<li><a href="/qa_list.htm"> <i class="fa fa-th"></i> <span>Q&A
								게시판</span> <small class="label pull-right bg-green">new</small>
					</a></li>
				</ul>
			</se:authorize>

			<!-- 개인회원 aside -->
			<se:authorize access="hasAnyRole('ROLE_JOIN', 'ROLE_USER')">
				<se:authorize access="!hasRole('ROLE_COMP')">
					<se:authorize access="!hasRole('ROLE_ADMIN')">
						<ul class="sidebar-menu">
							<li class="header">MAIN NAVIGATION</li>
							<li class="treeview"><a href="#"> <i
									class="fa fa-pie-chart"></i> <span>채용공고</span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="/comp_pick_list.htm"><i
											class="fa fa-circle-o"></i>채용리스트</a></li>
									<li><a href="/comp_pick_cal.htm"><i
											class="fa fa-circle-o"></i>채용달력</a></li>
								</ul></li>

							<se:authorize access="hasAnyRole('ROLE_USER')">
								<c:set var="resumeConfirmCheck" value="0"/>
								<c:set var="resumeConfirmList" value="${resumeConfirmList}"/>
								<c:if test="${resumeConfirm != 0}">
									<%-- <c:forEach var="i" begin="0" end="${fn:length(resumeConfirmList)}" step="1"> --%>
										<%-- <c:if test="${resumeConfirmCheck == 0}"> --%>
											<%-- <c:if test="${resumeConfirmList.get(i).getUsername() eq username}"> --%>
												<li>
													<a href="<%=request.getContextPath() %>/resume/update.htm">
														<i class="fa fa-th"></i> <span>이력서 수정</span> <small
														class="label pull-right bg-green">new</small>
													</a>
												</li>
												<%-- <c:set var="resumeConfirmCheck" value="1"/> --%>
											<%-- </c:if> --%>
										<%-- </c:if> --%>
									<%-- </c:forEach> --%>
								</c:if>
									<c:if test="${resumeConfirm == 0}">
										<li>
											<a href="<%=request.getContextPath() %>/resume.htm">
												<i class="fa fa-th"></i> <span>이력서 등록</span> <small
												class="label pull-right bg-green">new</small>
											</a>
										</li>
									</c:if>
								
								<li class="treeview"><a href="#"> <i
										class="fa fa-pie-chart"></i> <span>지원자 이력서 관리</span> <i
										class="fa fa-angle-left pull-right"></i>
								</a>
									<ul class="treeview-menu">
										<li><a href="/compResume.htm"><i
												class="fa fa-circle-o"></i>지원자 이력서 리스트</a></li>
									</ul></li>
								<li class="treeview"><a href="#"> <i
										class="fa fa-pie-chart"></i> <span>개인용 자소서 관리</span> <i
										class="fa fa-angle-left pull-right"></i>
								</a>
									<ul class="treeview-menu">
										<li><a href="/userResume.htm"><i
												class="fa fa-circle-o"></i>이력서/자소서 리스트</a></li>
										<li><a href="/userEditBoard.htm"><i
												class="fa fa-circle-o"></i>첨삭완료 게시판</a></li>
									</ul></li>
								<li class="treeview"><a href="#"> <i
										class="fa fa-pie-chart"></i> <span>전문가용 첨삭게시판</span> <i
										class="fa fa-angle-left pull-right"></i>
								</a>
									<ul class="treeview-menu">
										<li><a href="/adminEditBoard.htm"><i
												class="fa fa-circle-o"></i>첨삭게시판</a></li>
									</ul></li>

								<li><a href="../widgets.html"> <i class="fa fa-th"></i>
										<span>첨삭완료</span> <small class="label pull-right bg-green">new</small>
								</a></li>
							</se:authorize>

							<li><a href="../entity_list.htm"> <i class="fa fa-th"></i>
									<span>소통 게시판</span> <small class="label pull-right bg-green">new</small>
							</a></li>
							<li><a href="/qa_list.htm"> <i class="fa fa-th"></i>
									<span>Q&A 게시판</span> <small class="label pull-right bg-green">new</small>
							</a></li>
							<li>
				              <a href="chat.htm">
				                <i class="fa fa-th"></i> <span>채팅하기</span> <small class="label pull-right bg-green">new</small>
				              </a>
				            </li>
						</ul>
					</se:authorize>
				</se:authorize>
			</se:authorize>




			<!-- 기업회원 aside -->
			<se:authorize access="hasAnyRole('ROLE_COMP')">
				<ul class="sidebar-menu">
					<li class="header">MAIN NAVIGATION</li>

					<!-- 공고 등록 -->
					<li><a href="employmentinsert.htm"> <i class="fa fa-th"></i> <span>공고
								등록</span> <small class="label pull-right bg-green">new</small>
					</a></li>

					<li><a href="employmentlist.htm?username='${username}'"> <i class="fa fa-th"></i> <span>개인리스트
								</span> <small class="label pull-right bg-green">new</small>
					</a></li>

					<!-- 지원자이력서 리스트 -->
					<li><a href="../widgets.html"> <i class="fa fa-th"></i> <span>지원자 이력서
						</span> <small class="label pull-right bg-green">new</small>
					</a></li>

					<!-- 공고 리스트 -->
					<li class="treeview"><a href="#"> <i
							class="fa fa-pie-chart"></i> <span>채용공고</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="../charts/chartjs.html"><i
									class="fa fa-circle-o"></i>채용리스트</a></li>
							<li><a href="../charts/morris.html"><i
									class="fa fa-circle-o"></i>채용달력</a></li>
						</ul></li>

					<!-- Q&A게시판 -->
					<li><a href="/qa_list.htm"> <i class="fa fa-th"></i> <span>Q&A
								게시판</span> <small class="label pull-right bg-green">new</small>
					</a></li>

					<!-- 쪽지게시판 -->
					<li>
						<a href="#" id="openLetter"> 
							<i class="fa fa-th"></i> 
							<span>쪽지보내기</span>
						</a>
					</li>
				</ul>
			</se:authorize>

			<!-- 관리자 -->
			<se:authorize access="hasAnyRole('ROLE_ADMIN')">
				<ul class="sidebar-menu">
					<li class="header">MAIN NAVIGATION</li>
					<!-- Q&A게시판 -->
					<li><a href="/qa_list.htm"> <i class="fa fa-th"></i> <span>Q&A
								게시판</span> <small class="label pull-right bg-green">new</small>
					</a></li>

					<!-- 소통 게시판 -->
					<li><a href=/qa_list.htm"> <i class="fa fa-th"></i> <span>Q&A
								게시판</span> <small class="label pull-right bg-green">new</small>
					</a></li>

					<!-- 공고 리스트 -->
					<li class="treeview"><a href="#"> <i
							class="fa fa-pie-chart"></i> <span>채용공고</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="../charts/chartjs.html"><i
									class="fa fa-circle-o"></i>채용리스트</a></li>
							<li><a href="../charts/morris.html"><i
									class="fa fa-circle-o"></i>채용달력</a></li>
						</ul></li>
				</ul>
			</se:authorize>

			<!-- 전문가 -->
			<!-- 
          //첨삭 게시판
           <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li>
              <a href="../widgets.html">
                <i class="fa fa-th"></i> <span>첨삭 게시판</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            </ul>
           -->

		</section>
		<!-- /.sidebar -->
	</aside>

	<!-- Content Wrapper. Contains page content -->
	<!-- 
      <div class="content-wrapper">
        Content Header (Page header)
        <section class="content-header">
          <h1>
            General Form Elements
            <small>Preview</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Forms</a></li>
            <li class="active">General Elements</li>
          </ol>
        </section>
       </div> 
         -->
	
	<!-- 쪽지 보내기 모달 -->
<div id="letter">
		<form action="send_letter.htm" method="post">
			<input type="hidden" name="comp_username" value="${LoginUser}">
			<table class="table table-striped">
				<tr>
					<th style="width:30%">제목</th>
					<td style="width:70%"><input type="text" name="letter_title" id="letter_title"></td>
				</tr>
				<tr>
					<th>받을사람</th>
					<td>
						<select name="solo_username" id="solo_username" style="width:100%">
							<option value="">회원을 선택하세요</option>
							<c:set var="memberlist" value="${memberList}" />
							<c:forEach var="mlist" items="${memberlist}">
								<option value="${mlist.username}">${mlist.username}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea id="letter_ctmt" name="letter_ctmt"></textarea></td>
				</tr>
			</table>
			<input type="submit" id="sendLetter" value="전송" onclick="return send()">
		</form>
</div>
<!-- 쪽지 보기 모달 -->
<div id="show_msg">
	<table class="table table-striped">
		<tr>
			<th style="width:30%">제목</th>
			<td style="width:70%"><p id="title"></p></td>
		</tr>
		<tr>
			<th>보낸기업</th>
			<td><p id="comp"></p></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><p id="letter_content"></p></td>
		</tr>
	</table>
</div>



<!-- 쪽지 -->
<script>
	/* 쪽지보내기 */  
     	$(function(){
     		$('#letter').dialog({
     			autoOpen : false,
     			modal :true
     		})
     		
     		$('#openLetter').click(function(){
     			$('#letter').dialog("open");
     		})
    		
    		$('#sendLetter').click(function(){
    			alert("쪽지가 전달되었습니다");
    			$('#letter').dialog("close");
    		});
     	})
     	
     	function send(){
    		if($('#letter_title').val() == ""){
    			alert("제목을 입력하세요");
    			$('#letter_title').focus();
    			return false;
    		}
    		if($('#solo_username').val() == ""){
    			alert("받을사람을 입력하세요");
    			$('#solo_username').focus();
    			return false;
    		}
    		if($('#letter_ctmt').val() == ""){
    			alert("내용을 입력하세요");
    			$('#letter_ctmt').focus();
    			return false;
    		}
     	}
     	
	/* 쪽지 보기 */
	$(function(){
 		$('#show_msg').dialog({
 			autoOpen : false,
 			modal :true
 		})
	})
 		
 	function show(parameter){
 		$.ajax({
 			type : "get",
 			url : "show_letter.htm",
 			data : 'letter_no='+parameter,
 			success : function(data){
 				if(data.msg == 'success'){
 					$('#show_msg').dialog("open");
 					$('#title').text(data.letter.letter_title);
 					$('#comp').text(data.letter.comp_username);
 					$('#letter_content').text(data.letter.letter_ctmt);
 				}
 			}
 		})
	}
</script>