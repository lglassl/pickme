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
			"columnDefs" : [ //이건 수정이랑 삭제버튼은 정렬버튼 없애려고 한거임
			{
				"targets" : [ -1 ], //마지막 컬럼
				"orderable" : false, //정렬하는거 없앰
			}, ]
		});
		
	} );
</script>

<div id="content">
<div class="main_area">

<!-- 이미지롤링 -->
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
<!-- 이미지롤링 -->

	<table class="table table-striped table-bordered table-hover" id="pickListTable">
		<thead>
            <tr>
            	<th></th>
                <th>기업이름</th>
                <th>채용정보</th>
                <th>마감일</th>
                <th>시작일</th>
                <th>작성자 수</th>
                <th>지원정보</th>
            </tr>
        </thead>
		<tbody>
			<c:set var="compPickList" value="${compPickList}"/>	
			<!-- 기업회원정보 -->
			<c:set var="userComPpList" value="${userComPpList}"/>
			<!-- 회원 좋아요 여부 -->
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
			                	<a href="comp_pick.htm?comp_pick=${compPickList.get(j).getPick_code()}" id="btn" type="button" class="btn btn-info">채용공고</a>
			                </td>
			            </tr>
					</c:if>
				</c:forEach>
			</c:forEach>
        </tbody>
	</table>
</div>
</div>