<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content">

<div style="width:80%;margin:0 auto;padding-top:30px">
	<h2>로그인</h2>
	
	<p>
		한번더 로그인을 해주세요.<br>
		페이스북으로 가입하신 회원은 아래 버튼을 눌러주세요
	</p>
	
	<form class="form-horizontal" action="" method="post">
		<ul style="height:90px;padding:30px 0 0 0">
			<li style="float:left;width:70%">
				<p><input type="password" class="form-control" name="password" id="password" placeholder="비밀번호 입력"></p>
			</li>
			<li style="float:left;width:29%;margin-left:1%">
				<div>
					<button type="submit" class="btn btn-info" style="height:40px">로그인</button>
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