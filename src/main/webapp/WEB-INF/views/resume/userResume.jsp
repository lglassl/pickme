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
		$('#userResume').DataTable({
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
		
	//제출하기 버튼 온클릭	
	function goPaper(sc){
	 	$.ajax({
			type: "post",
			url:  "psUpdate.htm",
			cache: false,				
			data:'username=' + $('#'+sc).val(),
			 success:function(data){
  		    	location.href = "userResume.htm"; 
  		     },
  			error: function(){						
  				alert('Error while request..');
  			}
  		});
     };
	
     //요청하기 버튼 온클릭
 	function goEdit(sc){
	 	$.ajax({
			type: "post",
			url:  "esUpdate.htm",
			cache: false,				
			data:'username=' + $('#'+sc).val(),
			 success:function(data){
  		    	location.href = "userResume.htm"; 
  		     },
  			error: function(){						
  				alert('Error while request..');
  			}
  		});
     };

	
</script>

<div id="content">
	<div class="col-sm-12">
			
			<a id="doing" href="/userResumeDoing.htm">
			<img src="<%=request.getContextPath()%>/resources/images/1-1.PNG" 
			onmouseover="this.src='<%=request.getContextPath()%>/resources/images/1-2.PNG'"
			onmouseout="this.src='<%=request.getContextPath()%>/resources/images/1-1.PNG'">
			</a>
			
			<a id="finish" href="#">
			<img src="<%=request.getContextPath()%>/resources/images/2-1.PNG" 
			onmouseover="this.src='<%=request.getContextPath()%>/resources/images/2-2.PNG'"
			onmouseout="this.src='<%=request.getContextPath()%>/resources/images/2-1.PNG'">
			</a>
			
			<a id="request" href="#">
			<img src="<%=request.getContextPath()%>/resources/images/3-1.PNG" onmouseover="this.src='<%=request.getContextPath()%>/resources/images/3-2.PNG'"
			onmouseout="this.src='<%=request.getContextPath()%>/resources/images/3-1.PNG'">
			</a>
			
			<a id="requestfinish" href="/userEditBoard.htm">
			<img src="<%=request.getContextPath()%>/resources/images/4-1.PNG" onmouseover="this.src='<%=request.getContextPath()%>/resources/images/4-2.PNG'"
			onmouseout="this.src='<%=request.getContextPath()%>/resources/images/4-1.PNG'">
			</a>
			
			<a id="companypicklist" href="/comp_pick.htm">
	       <img src="<%=request.getContextPath()%>/resources/images/5-1.PNG" onmouseover="this.src='<%=request.getContextPath()%>/resources/images/5-2.PNG'"
	       onmouseout="this.src='<%=request.getContextPath()%>/resources/images/5-1.PNG'">
	        </a>
			
		</div>
</div>
	<table class="table table-hover dt-responsive"
		style="text-align: center; background-color: white; color: black;" id="userResume">
		<thead>
			<tr>

				<td >번호</td>
				<td >작성자</td>
				<td>채용공고 번호</td>
				<td >제출상태</td>
				<td >첨삭상태</td>

			</tr>
		</thead>
		<tbody>
	
			<c:forEach var="list" items="${list}" varStatus="status">
					<tr>
						<td style="text-align: center;">${list.resu_code}</td>
						
						<td style="text-align: center;">${list.username}
        				<input type="hidden" id="${status.count}" value="${list.username}">
						</td>
						
						<td style="text-align: center;">${list.pick_code}</td>
   						<td style="text-align: center;">
							<c:set var="ps" value="${list.paper_status}" />
							<c:choose>
    						<c:when test ="${ps eq 0}">
       						<span class="label label-default">작성 중</span>
    						</c:when>
        					
    					<%--제출 페이지는 수정에서?!
    					    <c:when test ="${ps eq 1}">		
        					<button type="button" id="pssub" onclick="goPaper(${status.count})">제출하기
        					</button>
    						</c:when> --%>
        					
    						<c:when test ="${ps eq 1}">
       						<span class="label label-success">제출완료</span>
        					</c:when>
							</c:choose>
					
						</td>
				
						<td style="text-align: center;">
						<c:set var="es" value="${list.edit_status}" />
						<c:choose>
    					
    					<c:when test ="${es eq 1}">
        				<button id="edit1" type="button" class="btn btn-danger" onclick="goEdit(${status.count})">요청하기</button>
    					</c:when>
    					
    					<c:when test ="${es eq 2}">
        				<span class="label label-default">진행 중</span>
    					</c:when>
    					
    					<c:when test ="${es eq 3}">
        				<span class="label label-primary">첨삭O(제출완료)</span>
        				</c:when>
        				
        				<c:when test ="${es eq 4}">
        				<span class="label label-primary">첨삭X(제출완료)</span>
        				</c:when>
    					
    					<c:otherwise>
       					<span class="label label-warning">후기카운트확인</span>
    					</c:otherwise>
						</c:choose>
				</td>
			</tr>
		</c:forEach>
		
		</tbody>

	</table>
