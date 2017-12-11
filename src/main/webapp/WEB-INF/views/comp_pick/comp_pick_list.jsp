<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="/resources/bootstrap/css/entityList.css" rel="stylesheet" type="text/css" />
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

<div id="content">
<div class="main_area">

<!-- �̹����Ѹ� -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="https://placehold.it/1200x400?text=IMAGE" alt="Image">
        <div class="carousel-caption">
          <h3>Sell $</h3>
          <p>Money Money.</p>
        </div>      
      </div>

      <div class="item">
        <img src="https://placehold.it/1200x400?text=Another Image Maybe" alt="Image">
        <div class="carousel-caption">
          <h3>More Sell $</h3>
          <p>Lorem ipsum...</p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
<!-- �̹����Ѹ� -->

	<table class="table table-striped table-bordered table-hover" id="pickListTable">
		<thead>
            <tr>
            	<th></th>
                <th>����̸�</th>
                <th>ä������</th>
                <th>������</th>
                <th>������</th>
                <th>�ۼ��� ��</th>
                <th>��������</th>
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
			                <td>
			                	<a href="comp_pick.htm?comp_pick=${compPickList.get(j).getPick_code()}" id="btn" type="button" class="btn btn-info">ä�����</a>
			                </td>
			            </tr>
					</c:if>
				</c:forEach>
			</c:forEach>
        </tbody>
	</table>
</div>
</div>