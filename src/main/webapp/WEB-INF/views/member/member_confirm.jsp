<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content">

<div class="main_area">
	<h2>로그인</h2>
	
	<p>
		한번더 로그인을 해주세요.<br>
		페이스북으로 가입하신 회원은 아래 버튼을 눌러주세요
	</p>
	
	<form class="form-horizontal" action="" method="post">
		<ul class="login_form_con">
			<li class="lft">
				<p><input type="password" class="form-control" name="password" id="password" placeholder="비밀번호 입력"></p>
			</li>
			<li class="rgt">
				<div>
					<button type="submit" class="btn btn-info">로그인</button>
				</div>
			</li>
		</ul>
	</form>
	<div style="margin-top:20px">
		<form class="form-horizontal" action="/member_confirm_fb.htm" method="post">
			<input type="submit" value="페이스북 회원" class="btn btn-default">
		</form>
	</div>
</div>
</div>