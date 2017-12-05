<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

    <div class="wrapper">
      <header class="main-header">
        <!-- Logo -->
        <a href="/home.htm" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>P</b>M</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Pick</b> Me</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
            
              <!-- 쪽지 -->
              <li class="dropdown messages-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span class="label label-success">4</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 4 messages</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li><!-- start message -->
                        <a href="#">
                          <div class="pull-left">
                          	<!-- 로고 이미지 -->
                            <img src="/resources/dist/img/user7-128x128.jpg" class="img-circle" alt="User Image"/>
                          </div>
                          <h4>
                            	영진전자	
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <p>제출 관련 쪽지</p>
                        </a>
                      </li><!-- end message -->
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="/resources/dist/img/user3-128x128.jpg" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            	건설회사
                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
                          </h4>
                          <p>서류전형 결과</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="/resources/dist/img/user4-128x128.jpg" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                           	 자동차회사
                            <small><i class="fa fa-clock-o"></i> Today</small>
                          </h4>
                          <p>서류전형 결과</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="/resources/dist/img/user3-128x128.jpg" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            	건설회사
                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
                          </h4>
                          <p>서류전형 결과</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="/resources/dist/img/user4-128x128.jpg" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            	영진전자	
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <p>제출 관련 쪽지</p>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
              </li>
              
               <!-- 회원가입 -->
              <se:authorize access="!hasRole('ROLE_JOIN')">
              <li class="dropdown user user-menu">
                <a href="/join_solo.htm" class="dropdown-toggle">회원가입</a>
              </li>
              </se:authorize>
              
              <se:authentication property="name" var="LoginUser" />
              <!-- 일반회원 -->
              <se:authorize access="hasAnyRole('ROLE_USER')">
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <span class="hidden-xs">회원정보</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="user-header">
                    <img src="/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
                    <p><a href="/member_confirm.htm" class="btn btn-default">회원정보수정</a></p>
                    <p>${dto.solo_name}님의 채용 정보</p>
                    <div class="pull-left">
                      <a href="#" style="color:#fff">작성중 12</a>
                    </div>
                    <div class="pull-right">
                     <a href="#" style="color:#fff">제출완료 4</a>
                    </div>
                  </li>
                </ul>
              </li>
              </se:authorize>
              
              <!-- 기업회원 -->
              <se:authorize access="hasAnyRole('ROLE_COMP')">
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <span class="hidden-xs">기업정보</span>
                </a>
                <ul class="dropdown-menu">
                  User image
                  <li class="user-header">
                  	우리 로고
                    <img src="/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
                    <p><a href="/member_confirm_comp.htm" class="btn btn-default">기업정보수정</a></p>
                    <p>오영진님의 채용 정보</p>
                    작성중과 제출완료 링크는 같은 곳의 링크(제출 이력서 리스트)
                    <div class="pull-left">
                      <a href="#" style="color:#fff">작성중 12</a>
                    </div>
                    <div class="pull-right">
                     <a href="#" style="color:#fff">제출완료 4</a>
                    </div>
                  </li>
                </ul>
              </li>
              </se:authorize>
            
              <li>
              <se:authorize access="!hasRole('ROLE_JOIN')">
              	<a href="/login.htm" class="dropdown-toggle">로그인</a>
              </se:authorize>
              <se:authentication property="name" var="LoginUser" />
              <se:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER', 'ROLE_JOIN')">	
	          	<a href="/logout" class="dropdown-toggle">로그아웃</a>
              </se:authorize>
              </li>
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
            <div class="pull-left image">
            	<!-- 우리 로고 -->
              <img src="./resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p><b>오영진</b>님 환영합니다</p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          
          <!-- 개인회원 aside -->
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li>
              <a href="../widgets.html">
                <i class="fa fa-th"></i> <span>이력서 등록</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>채용공고</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="/comp_pick.htm"><i class="fa fa-circle-o"></i>채용리스트</a></li>
                <li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i>채용달력</a></li>
              </ul>
            </li>
            
              <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>지원자 이력서 관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="/compResume.htm"><i class="fa fa-circle-o"></i>지원자 이력서 리스트</a></li>
              </ul>
            </li>
              <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>개인용 자소서 관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="/userResume.htm"><i class="fa fa-circle-o"></i>이력서/자소서 리스트</a></li>
                <li><a href="/userEditBoard.htm"><i class="fa fa-circle-o"></i>첨삭완료 게시판</a></li>
              </ul>
            </li>
              <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>전문가용 첨삭게시판</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="/adminEditBoard.htm"><i class="fa fa-circle-o"></i>첨삭게시판</a></li>
              </ul>
            </li>
            
             <li>
              <a href="../widgets.html">
                <i class="fa fa-th"></i> <span>첨삭완료</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
             <li>
              <a href="../entity_list.htm">
                <i class="fa fa-th"></i> <span>소통 게시판</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
             <li>
              <a href="../widgets.html">
                <i class="fa fa-th"></i> <span>Q&A 게시판</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
          </ul> 
          
          
          
          
          <!-- 기업회원 aside -->
          <!-- 
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            
            //공고 등록
            <li>
              <a href="../widgets.html">
                <i class="fa fa-th"></i> <span>공고 등록</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            
            //이력서 리스트
            <li>
              <a href="../widgets.html">
                <i class="fa fa-th"></i> <span>이력서 리스트</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            
            //나의 공고 리스트
            <li>
              <a href="../widgets.html">
                <i class="fa fa-th-list"></i> <span>나의 공고 리스트</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            
            //공고 리스트
            <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>채용공고</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../charts/chartjs.html"><i class="fa fa-circle-o"></i>채용리스트</a></li>
                <li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i>채용달력</a></li>
              </ul>
            </li>
            
            //Q&A게시판
             <li>
              <a href="../widgets.html">
                <i class="fa fa-th"></i> <span>Q&A 게시판</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
             -->
          
          <!-- 관리자 -->
          <!-- 
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
          //Q&A게시판
             <li>
              <a href="../widgets.html">
                <i class="fa fa-th"></i> <span>Q&A 게시판</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            
            //소통 게시판
            <li>
              <a href="../widgets.html">
                <i class="fa fa-th"></i> <span>Q&A 게시판</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            
            //공고 리스트
            <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>채용공고</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../charts/chartjs.html"><i class="fa fa-circle-o"></i>채용리스트</a></li>
                <li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i>채용달력</a></li>
              </ul>
            </li>
          </ul>
           -->
          
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
        
        