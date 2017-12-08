<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
	$(document).ready(function() {
		$('#pickListTable').DataTable({
			"sPaginationType" : "full_numbers",
			"sDom" : '<"top">rt<"bottom"flp><"clear">',

			"lengthMenu" : [ [ 15, 25, 35 ], [ 15, 25, 35 ] ],
			"searching" : true,
			"columnDefs" : [ //�̰� �����̶� ������ư�� ���Ĺ�ư ���ַ��� �Ѱ���
			{
				"targets" : [ -1 ], //������ �÷�
				"orderable" : false, //�����ϴ°� ����
			}, ]
		});
		
	} );
</script>

<div id="content" style="padding:15%;">
	<table class="table table-striped table-bordered table-hover" id="pickListTable">
		<thead>
            <tr>
            	<th></th>
                <th>����̸�</th>
                <th>ä������</th>
                <th>������</th>
                <th>������</th>
                <th>�ۼ��� ��</th>
            </tr>
        </thead>
		<tbody>
			<c:set var="compPickList" value="${compPickList}"/>	
			<!-- ���ȸ������ -->
			<c:set var="userComPpList" value="${userComPpList}"/>
			<!-- ȸ�� ���ƿ� ���� -->
			<c:set var="listLike" value="${listLike}"/>	
			<c:forEach var="i" begin="0" end="${fn:length(userComPpList)-1}" step="1">
				<c:forEach var="j" begin="0" end="${fn:length(compPickList)-1}" step="1">
					<c:if test="${userComPpList.get(i).getUsername() eq compPickList.get(j).getUsername()}">
						<tr>
			                <td><img id="logo_image" src="${userComPpList.get(i).getComp_logo()}" style="width: 30px;"></td>
			                <td>${userComPpList.get(i).getComp_name()}</td>
			                <td>${compPickList.get(j).getPick_ctmt()}</td>
			                <td>${compPickList.get(j).getPick_end()}</td>
			                <td>${compPickList.get(j).getPick_start()}</td>
			                <td>${compPickList.get(j).getPick_num()}</td>
			            </tr>
					</c:if>
				</c:forEach>
			</c:forEach>
        </tbody>
	</table>
</div>