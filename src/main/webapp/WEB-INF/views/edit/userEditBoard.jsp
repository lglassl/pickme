<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
<link
	href="//cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="/resources/bootstrap/css/resumelist.css" rel="stylesheet"
	type="text/css">
<style>
h3{
text-align:center;

}
</style>
<script>
	$(document).ready(function() {
		$('#userResume').DataTable({
			"sPaginationType" : "full_numbers",
			"sDom" : '<"top">rt<"bottom"flp><"clear">',

			"lengthMenu" : [ [ 10, 20, 30 ], [ 10, 20, 30 ] ],
			"searching" : true,
			"columnDefs" : [ //이건 수정이랑 삭제버튼은 정렬버튼 없애려고 한거임
			{
				"targets" : [ -1 ], //마지막 컬럼
				"orderable" : false, //정렬하는거 없앰
			}, ]
		});
	});
	
</script>
<div id="content">
<h3 >첨삭완료 게시판</h3>
		<table class="table table-hover dt-responsive"
		style="text-align: center; background-color: white; color: black;" id="userResume">
		<thead>
			<tr>
				<td >번호</td>
				<td >채용 공고 번호</td>
				<td >작성자</td>
				<td >첨삭상태</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="elist" items="${elist}">
					<tr>
						<td style="text-align: center;">${elist.resu_code}</td>
						<td style="text-align: center;">${elist.pick_code}</td>
						<td style="text-align: center;">
						<a id="edit" href="userEditDetail.htm?username=${elist.username}&pick_code=${elist.pick_code}">${elist.username}</a></td>
						<td style="text-align: center;">
						<c:set var="es" value="${elist.edit_status}" />
						<c:if test = "${es eq 3}">
						<button type="button" class="btn btn-info">첨삭완료</button>
						</c:if>
						</td>
					</tr>
			</c:forEach>
			</tbody>
			</table>
			
	</div>
	
			

	