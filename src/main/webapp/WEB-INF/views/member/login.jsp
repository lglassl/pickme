<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content">

<script src="/resources/bootstrap/js/member/facebook.js"></script>

<div style="width:80%;margin:0 auto;padding-top:30px">
	<h2>로그인</h2>
	<c:if test="${param.error != null}">
		<div>
			로그인 실패
			<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
			이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
			</c:if>
		</div>
	</c:if>
	
	<c:url value="/login" var="loginurl"></c:url>
	<form class="form-horizontal" action="${pageContext.request.contextPath}/login" method="post">
		<ul style="height:100px;padding:0px">
			<li style="float:left;width:70%">
				<p><input type="text" class="form-control" name="username" id="username" placeholder="아이디 입력"></p>
				<p><input type="password" class="form-control" name="password" id="password" placeholder="비밀번호 입력"></p>
			</li>
			<li style="float:left;width:29%;margin-left:1%">
				<div>
					<button type="submit" class="btn btn-info" style="height:78px">로그인</button>
				</div>
			</li>
		</ul>
	</form>
	<div>
		<a href="/join_sole.htm">회원가입</a> / 
		<a href="/member_solo_find.htm">아이디 비밀번호 찾기</a>
	</div>
	<div style="margin-top:20px">
		<a href="javascript:login()" class="btn btn-default">페이스북으로 로그인하기</a>
	</div>
</div>
</div>