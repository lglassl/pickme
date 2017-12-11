<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   <style>
		#company_pick{
		float:left;
		margin-left:40px;
		margin-bottom : 40px;
		width: 150px; 
		height: 180px;
		border: ridge;
		border-radius: 20px;
		box-shadow:10px 15px 5px gray;
		}
	</style>
   
   <script type="text/javascript">
   
   var introbtnIndex=1;
   
   $(function(){
	  	 $('.modal').on('hidden.bs.modal', function (e) {
	         console.log('modal close');
	     	 $(this).find('form')[0].reset();
	   	 });
	  	 
 		$("#pick_start_update").datepicker(
			{
				changeYear: true,
				changeMonth: true,
				dateFormat : "yy-mm-dd",
				prevText : "이전달",
				nextText : "다음달",
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				numberOfMonths : 1,
				yearRange: 'c-80:c'
			}
		);
 		
 		$("#pick_date_end").datepicker(
 				{
 					changeYear: true,
 					changeMonth: true,
 					dateFormat : "yy-mm-dd",
 					prevText : "이전달",
 					nextText : "다음달",
 					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
 					monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
 					numberOfMonths : 1,
 					yearRange: 'c-80:c'
 				}
 			);
 		
 		 

	   	 $('#hirejob_select_btn_update').click(function(){
	   		 
	   		 $('#hirejob_select_btn_update').attr('data-dismiss', '');
	   		
	   		 if($("input[id=hirecheck]:checked").val() == null || $("input[id=jobcheck]:checked").val() == null){
	   			alert('항목을 체크 해주세요.');
	   			$('#hire_field_update').val("");	
		   		$('#job_field_update').val("");
	   		 } else {
	   			$('#hire_field_update').val($("input[id=hirecheck]:checked").val());	
		   		$('#job_field_update').val($("input[id=jobcheck]:checked").val());
	   			
		   		$('#hirejob_select_btn_update').attr('data-dismiss','modal');
	   		 }
	   	 });
		
		$('#hirejob_select_close_update').click(function(){
			console.log(introbtnIndex);
			introbtnIndex = 1;
		});
		
		 $('#intro_plus').click(function(){
			console.log(introbtnIndex + "introbtnIndex");
	   		if(introbtnIndex =="5"){
		           $('#intro_plus').prop("disabled", true);
		           alert('자소서항목은 5개까지만 입력 가능합니다.');
		           introbtnIndex = 5;
		           
     		} else {
     			
     		if(introbtnIndex == "1"){
         		$('#intro_close').prop("disabled", false);
     		}
	   		$('#intro_plus').prop("disabled", false);
        	var skillStr=
        		"<tr id='tr" + introbtnIndex + "'>"
		   		+	"<td>&nbsp;</td>"
		   		+   "<td><input type='text' class='form-control' id='intro_no' "
		   		+   "name='list[" + introbtnIndex + "].intro_no' placeholder='자소서 항목을 입력해주세요'> "
				+   "<input type='text' class='form-control' id='intro_lim' "
				+   "name='list[" + introbtnIndex + "].intro_lim' placeholder='글자 수를 입력해주세요'></td>"
		   		+	"</tr>";
		   		
	        $('#table').append(skillStr);
	        console.log("plus : " + introbtnIndex);
	        introbtnIndex++;
		    }
	     }); 
		
		
		 $('#intro_close').click(function(){
			 console.log(introbtnIndex);
	        if(introbtnIndex == "1"){
	        	$('#intro_close').prop("disabled", true);
	        	console.log(introbtnIndex);
	        } else {
	        	if(introbtnIndex != "4"){
	        		$('#intro_plus').prop("disabled", false);
	        	}
	        	console.log("- 되기전 : " + introbtnIndex);
	        	introbtnIndex--;
	        	var plus = "#tr"+introbtnIndex+ ""; 
		        $(plus).remove();
		        
		        if(introbtnIndex == "1"){
	        		$('#intro_close').prop("disabled", true);
		        }
		        console.log("last : " + introbtnIndex);
	        }
	     }); 
		
 	});
   var num = 0;
   function ddddd(){
	    $('#Modal').modal('show');
  		console.log("버튼클릭이벤트??");
   	 	var url="hirejob_print.htm";
    	 	
   	 	$.ajax({
   	 		url:url,
   	 		type:"GET",
   	 		dataType:"JSON",
   	 		contentType: "application/json; charset=UTF-8",
   	 		success:function(responsedata){
				var hiredata = responsedata.hirelist;
				var jobdata = responsedata.joblist;
 	   	 			
				var hirestr = "";
				var jobstr = "";
				
				if(num == 0){
					$.each(hiredata,function(index,obj){
						console.log(obj.hire_field);
						hirestr= "<input type='checkbox' value='" 
						+ obj.hire_field + "' id='hirecheck'>" + obj.hire_field + "<br>";
						
						$('#jobdata').append(hirestr);
					});  
					
					$.each(jobdata,function(index,obj){
						console.log(obj.job_field);
						jobstr= "<input type='checkbox' value='" 
						+ obj.job_field + "' id='jobcheck'>" + obj.job_field + "<br>";
						
						$('#hiredata').append(jobstr);
					});
					num=1;
				} else {
					return;
				}
				  
 	  	 		},
 	  	 		error: function (xhr){
 	  	 			alert("check box 실패"+xhr.status);
 	  	 		}
 	  	 	});
   }
	
   function updatepick(pick_Code){
	   
	    if(introbtnIndex != "1"){
	    	$('#intro_close').prop("disabled", false);
	    } else {
	    	$('#intro_close').prop("disabled", false);
	    }
	  	
	    if(introbtnIndex == "5"){
	    	$('#intro_plus').prop("disabled", true);
	    } else {
	    	$('#intro_plus').prop("disabled", false);
	    }
	   
		var url = "employment_updateprint.htm";
		var pick_code = pick_Code;
		console.log(pick_code+"~~~~pick_code"); 
	
		$.ajax({
			url : url,
			type : "POST", 
			data : "s_pick_code="+pick_code,
			success : function(data){ 
				
				var ui = 	" <div class='modal-body col-sm-12'> "
							+ "<table class='table table-condensed' style='width:100%;' id='table'>"
							+ "<tr>"
							+ "<td> 채용 기간 <input type='hidden' id='pick_code' name='pick_code' value='" + pick_code + "'> </td> "
							+ "<td>채용 시작일 <input type='text' id='pick_start_update' name='pick_start'> </td>"
							+ "</tr>"
							+ "<tr>"
							+ "<td>	</td>"
							+ "<td>채용 마감일 <input type='text' id='pick_end_update' name='pick_end'> </td>"
							+ "</tr>"
							+ "<tr>"
							+ "<td>직무종류 및 채용형태</td>"
							+ "<td>직무종류<input type='text' id='hire_field_update' name='hire_field' readonly> "
							+ "    채용형태<input type='text' id='job_field_update' name='job_field' readonly> "		
							+ "    <input type='button' class='btn btn-default' id='hirejob_select_update' onclick='ddddd()' value='선택'/> "			
							+ "</td>"
							+ "</tr>"
							+ "<tr>"
							+ "<td>채용 인원</td>"
							+ "<td><input type='text' id='pick_num_update' name='pick_num'> &nbsp; 명 </td> "
							+ "</tr>"
							+ "<tr>"
							+ "<td>지원자격</td>"
							+ "<td><input type='text' id='pick_qulify_update' name='pick_qulify'> </td> "
							+ "</tr>"
							+ "<tr>"
							+ "<td>채용 내용</td>"
							+ "<td><textarea id='pick_ctmt_update' name='pick_ctmt' rows='4' cols='50'></textarea> </td>"
							+ "</tr>"
							+ "<tr id='intro_after'>"
							+ "<td>자기소개서 항목/ 글자수 <input type='hidden' id='pick_no_update' name='list[0].pick_no'> </td> "
							+ "<td> <input type='text' class='form-control' value='' id='intro_no_update' name='list[0].intro_no' placeholder='자소서 항목을 입력해주세요'> "
							+ "     <input type='text' class='form-control' value='' id='intro_lim_update' name='list[0].intro_lim' placeholder='글자 수를 입력해 주세요'> "
							+ "</td>"
							+ "</tr>"
							+ "</table>"
							+ "</div>"
							+ "<div class='row' style='text-align:center;'>"
							+ "<div class= 'col-sm-12'> "
	         				+ "<input type='button' class='btn btn-default' id='updateBtn' value='수정' onclick='update(" + pick_code + ")'> "
	         				+ "<input type='button' class='btn btn-default' value='취소' data-dismiss='modal' id='hirejob_select_close_update'> "
	       				 	+ "</div>"
	       				 	+ "<br>"
   							+ "</div>";
				
				$('#updateModal').modal('show');
				$('#tableAppendDiv').empty();
				$('#tableAppendDiv').append(ui);
				
				introbtnIndex = 1;
				var skillStr= "";
			
				var pick_dtolist = data.pick_dtolist;
				$('#pick_start_update').val(pick_dtolist.pick_start.substring(0,10));
				$('#pick_end_update').val(pick_dtolist.pick_start.substring(0,10));
				$('#hire_field_update').val(pick_dtolist.hire_field);
				$('#job_field_update').val(pick_dtolist.job_field);
				$('#pick_qulify_update').val(pick_dtolist.pick_qulify);
				$('#pick_num_update').val(pick_dtolist.pick_num);
				$('#pick_ctmt_update').val(pick_dtolist.pick_ctmt);
				$('#pick_no_update').val(pick_dtolist.list[0].pick_no);
				$('#intro_no_update').val(pick_dtolist.list[0].intro_no);
				$('#intro_lim_update').val(pick_dtolist.list[0].intro_lim);
					
					
				var pick_list = pick_dtolist.list;
				
				var intro_no = null;
				var intro_lim = null;
				
				
				$.each(pick_list,function(index,pick_list){
			        pick_no = pick_dtolist.list[0].pick_no;
					intro_no = pick_dtolist.list[introbtnIndex].intro_no;
					intro_lim = pick_dtolist.list[introbtnIndex].intro_lim;
					
					console.log(intro_no);
					console.log(intro_lim);
					
					skillStr = 
						"<tr id='tr" + introbtnIndex + "'>"
			   		+	"<td><input type='hidden' name='list[" + introbtnIndex + "].pick_no' value='" + pick_no + "'></td>"
			   		+   "<td><input type='text' class='form-control' id='intro_no_update" + introbtnIndex + "' "
			   		+   "name='list[" + introbtnIndex + "].intro_no' value='" + intro_no + "' placeholder='자소서 항목을 입력해주세요'> "
					+   "<input type='text' class='form-control' id='intro_lim_update" + introbtnIndex + "' "
					+   "name='list[" + introbtnIndex + "].intro_lim' value='" + intro_lim + "' placeholder='글자 수를 입력해주세요'>"
					+ 	"</td>" 
			   		+	"</tr>";
			   		
					$('#table').append(skillStr);
					introbtnIndex++;
				});

			},
			error: function (xhr){
	  	 		alert("modal print 실패 : "+xhr.status);
	  	 	}
			
		});
		
   }
   
   function update(){
	  $('#updateStart').submit();
   }
   
   </script>
   
  
   
   <div id="updateModal" class="modal fade" role="dialog" style="height:100%;">
		<!-- Modal content -->
		<div class="modal-dialog modal-lg">
			<div class="container col-sm-12" style="background-color:white;">
				<div class="modal-header" style="text-align:center;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
         			<h4 class="modal-title">채용정보 수정</h4>
       			</div>
       				<!-- boardnum moviename genre director playdate price filesource -->
       				
       			<form action="employmentupdate.htm" method="post" id="updateStart">
		       		<div class="row">
						<div class="col-sm-12" id="tableAppendDiv">
       						
       						
       						<!-- Modal table 들어오는 부분 -->
       						
       						
       					</div>
       					<div class="form" style="float:right">
							<input type='button' class='btn btn-primary btn-lg' id='intro_plus' value='+' /> 
							<input type='button' class='btn btn-primary btn-lg' id='intro_close' value='-' /> 
						</div>
       				</div>
       			</form>
			</div>	
		</div>	
	</div>
   
	<div id="Modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="container col-sm-12" style="background-color:white;">
					<div class="modal-header" style="text-align:center;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
	       				<h4 class="modal-title">직무종류 및 채용형태</h4>
	     			</div>
	
	      			<div class="row">
						<div class="col-sm-12">
		       				<div class="modal-body col-sm-12"> 
								<table class="col-sm-12">
									<tr>
										<th class="col-sm-6" style="text-align:center">
											직무종류
										</th>
										<th class="col-sm-6" style="text-align:center">
											채용형태
										</th>
									</tr>
									<tr>
										<td style="text-align:center" id="jobdata">
										<!-- DB에서 직무종류 불러오는 부분 -->
										
										</td>											
										<td style="text-align:center" id="hiredata"> 
											<!-- DB에서 채용형태 불러오는 부분 -->
										</td>
									</tr>
								</table>				
											
							</div>
							<div class="row" style="text-align:center;">
								<div class=" col-sm-12">
		       						<input id="hirejob_select_btn_update" type="button" class="btn btn-default" value="선택완료">
		       						<button type="reset" class="btn btn-default" data-dismiss="modal">등록취소</button>
		   						</div>
	       						<br>
	       					</div>		
	       				</div>
	      			</div>
			</div>	
		</div>	
	</div>
   
	   <div class="col-sm-12" style="text-align: center; color:black">
			<c:forEach var="employmentlist" items="${employmentlist}">		
				<div id="company_pick">
					<div class="row" style="height:40%">
						<img alt="이미지 로고 띄울겨" src="" id="compimg_lab">
					</div>
					<div class="row" style="height:20%">
						<label id="compname_lab">${employmentlist.username}</label>
					</div>
					<div class="row" style="height:20%">
						<label id="jobhire_lab">${employmentlist.hire_field} / </label>
						<label id="jobhire_lab">${employmentlist.job_field} </label>
					</div>
					<div class="row" style="height:20%">
						<input type="button" class="btn btn-default" value="UPDATE" id="updatePrintBtn" onclick="updatepick(${employmentlist.pick_code})">
					</div>
				</div>
			</c:forEach>
		</div>		