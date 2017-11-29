<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
		$('#resumelist').DataTable({
			"responsive" : true,
			 "sPaginationType": "full_numbers",
			"sDom": '<"top">rt<"bottom"flp><"clear">',
			
			
			"lengthMenu" : [ [ 10, 20, 35 ], [ 10, 20, 35 ] ],
			"searching" : true,
			"columnDefs" : [ //�̰� �����̶� ������ư�� ���Ĺ�ư ���ַ��� �Ѱ���
			{
				"targets" : [ -1 ], //������ �÷�
				"orderable" : false, //�����ϴ°� ����
			}, ]
		});

		$('td>button').click(function() {

			alert("�պ� ���ϰ� ���� �߼�");
			$('#aa').modal('show');
		
		});
		
		

	});
</script>
<div id="content">
	<table class="table table-hover dt-responsive" style="text-align: center; background-color: white; color: black;"
		id="resumelist">
		<thead>
			<tr>

				<td width=60%>��ȣ</td>
				<td width=10%>������ �̸�</td>
				<td width=20%>����</td>
				<td width=10%>�հݿ���</td>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" begin="1" end="100" step="1">
				<tr>

					<td width=25%>${i}</td>
					<td width=25%>������${i}</td>
					<td width=25%><a href="compResumeDetail.htm">���� �̾����${i}</a></td>
					<td width=25%><button id="b${i}">�պҰ���${i}</button></td>
				</tr>
			</c:forEach>



			<!-- 
					<c:forEach var="passfail" items="" varStatus="status">
						<tr>
						
							<td id="">${status.count}</td>
							<td id="moviename">${d_selectgenrelist.d_movieName}</td>
							<td id="genre">${d_selectgenrelist.d_genre}</td>
							<td id="director">${d_selectgenrelist.d_director}</td>
							<td id="playdate">${d_selectgenrelist.d_playDate.substring(0,10)}</td>
							<td id="price">${d_selectgenrelist.d_price} ��</td>
									
							<td>
								<button class="snip1535" onclick="/MailSend.htm" id="mail" >�հݺ��հ�</button>
							</td>
						</tr>
					</c:forEach>
				 -->


		</tbody>

	</table>
	
	<div id="aa" class="modal fade" role="dialog">
		<!-- Modal content -->
		<div class="modal-dialog" id="modalformsize">
			<div class="container col-sm-12" style="background-color:white;">
				<form name="paymentform" action="#" method="post">
					<div class="modal-header" style="text-align:center;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
         				<h4 class="modal-title" id="mtitle">���Ƥ÷оƤ÷оƤä�</h4>
       				</div>
					<div class="modal-body"> 
						<label id="label_1">������</label>
						<input type="text" name="" id="" class="form-control">
						<br>
						<label id="label_2">�ٿ��٤���</label>
						<input type="text" name="" id="" class="form-control">
						<br>
						<input type="button" class="btn btn-default" id="50jin" name="50bt">
						�������ٺ�
					</div>
					</form>
					</div>
					</div>
					</div>
</div>
