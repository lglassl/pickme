<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content">
	<table class="table table-striped">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		<%-- <c:forEach items="${boardList}" var="boardList">
			<tr>
				<td>${boardList.boardNum}</td>
				<td><a href="boardContent.htm?boardNum=${boardList.boardNum}">${boardList.title}</a></td>
				<td>${boardList.name}</td>
				<!-- DB 설정해야함 -->
			</tr>
		</c:forEach> --%>
	</table>
</div>