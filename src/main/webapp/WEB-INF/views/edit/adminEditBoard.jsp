<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="content">
	<div class="col-sm-12">
	
	<table class="table table-hover dt-responsive"
		style="text-align: center; background-color: white; color: black;" id="adminEditBoard">
		<thead>
			<tr>

				<td >첨삭번호</td>
				<td >이력서 번호</td>
				<td >작성자</td>
				<td >첨삭상태</td>

			</tr>
		</thead>
		<tbody>
	
			<c:forEach var="ae" items="${aelist}" varStatus="status">
					<tr>
						
						<td style="text-align: center;">${status.count}</td>
						<td style="text-align: center;">${ae.resu_code}</td>
						<td style="text-align: center;">
						<a id ="detail" href="adminEditDetail.htm?username=${ae.username}&resu_code=${ae.resu_code}">
						${ae.username}</a></td>
						<td style="text-align: center;">
        				<span id="${ae.edit_status}" class="label label-default">진행중</span>
        				</td>
					</tr>
			</c:forEach>
		</tbody>
		</table>	
	</div>
	
</div>
