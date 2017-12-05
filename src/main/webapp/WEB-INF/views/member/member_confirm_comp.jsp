<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content">

<div style="width:80%;margin:0 auto;padding-top:30px">
	<h2>로그인</h2>
	
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
</div>
</div>