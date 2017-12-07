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

<script>
	$(document).ready(function() {
		$('#adminEditBoard').DataTable({
			"sPaginationType" : "full_numbers",
			"sDom" : '<"top">rt<"bottom"flp><"clear">',

			"lengthMenu" : [ [ 15, 25, 35 ], [ 15, 25, 35 ] ],
			"searching" : true,
			"columnDefs" : [ //이건 수정이랑 삭제버튼은 정렬버튼 없애려고 한거임
			{
				"targets" : [ -1 ], //마지막 컬럼
				"orderable" : true, //정렬하는거 없앰
			}, ]
		});
	});	
</script>

<div id="content">
	<div class="col-sm-12">
	
	<table class="table table-hover dt-responsive"
		style="text-align: center; background-color: white; color: black;" id="adminEditBoard">
		<thead>
			<tr>

				<td >번호</td>
				<td >작성자</td>
				<td>자소서항목 갯수</td>
				<td >첨삭상태</td>

			</tr>
		</thead>
		<tbody>
	
			<c:forEach var="ae" items="${aelist}" varStatus="status">
					<tr>
						<td style="text-align: center;">${status.count}</td>
						
						<td style="text-align: center;">${ae.username}</td>
						
						<td style="text-align: center;">${ae.pick_no}</td>
						
						<td style="text-align: center;">${ae.edit_status}</td>
					</tr>
			</c:forEach>
		</tbody>
		</table>	
	</div>
	
</div>