<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   <script type="text/javascript">
   
   $(function(){
	  	 $('.modal').on('hidden.bs.modal', function (e) {
	        console.log('modal close');
	      $(this).find('form')[0].reset();
	   	 });
	   
   		$("#pick_start_txt").datepicker(
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
   		
   		$("#pick_end_txt").datepicker(
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
   		
   		var num = 0;
	   	 $('#hirejob_select').click(function(){
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
							console.log(obj.hire_code);
							hirestr= "<input type='checkbox' value='" 
							+ obj.hire_code + "' id='hirecheck'>" + obj.hire_field + "<br>"
							+"<input type='hidden' id='hidden_hire' value='" + obj.hire_code + "'>";
							
							$('#jobdata').append(hirestr);
						});  
						
						$.each(jobdata,function(index,obj){
							console.log(obj.job_code);
							jobstr= "<input type='checkbox' value='" 
							+ obj.job_code + "' id='jobcheck'>" + obj.job_field + "<br>"
							+"<input type='hidden' id='hidden_job' value='" + obj.job_code + "'>";
							
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
   	 	}); 
	   	 
	   	 $('#hirejob_select_btn').click(function(){
	   		$('#hirejob_select_btn').attr('data-dismiss', '');
	   		
	   		 if($("input[id=hirecheck]:checked").val() == null || $("input[id=jobcheck]:checked").val() == null){
	   			alert('항목을 체크 해주세요.');
	   			$('#hire_field').val("");	
		   		$('#job_field').val("");
	   			$('#hire_code').val("");
		   		$('#job_code').val("");
	   		 } else {
	   			$('#hire_code').val($("input[id=hirecheck]:checked").val());	
		   		$('#job_code').val($("input[id=jobcheck]:checked").val());
	   			
		   		$('#hirejob_select_btn').attr('data-dismiss','modal');
	   		 }
	   	 });
	   	 
	   	var skill_containerIndex=1;
	
	   	$('#intro_plus').click(function(){
	   		if(skill_containerIndex =="5"){
		           $('#intro_plus').prop("disabled", true);
		           alert('추가불가');
		           skill_containerIndex = 5;
        	} else {
        		if(skill_containerIndex == "1"){
            		$('#intro_close').prop("disabled", false);
        		}
		   		$('#intro_plus').prop("disabled", false);
		        	var skillStr=
		        		
		        		"<tr id='tr" + skill_containerIndex + "'>"
				   		+	"<td>&nbsp;</td>"
				   		+   "<td><input type='text' class='form-control' id='intro_no' "
				   		+   "name='list[" + skill_containerIndex + "].intro_no' placeholder='자소서 항목을 입력해주세요'> "
						+   "<input type='text' class='form-control' id='intro_lim' "
						+   "name='list[" + skill_containerIndex + "].intro_lim' placeholder='글자 수'></td>" 
				   		+"</tr>";
				   		
			        $('#intro_after').after(skillStr);
			        console.log("plus : " + skill_containerIndex);
			        skill_containerIndex++;
		    }
	   		
	   		
	     });
	   		
		$('#intro_close').click(function(){
	        if(skill_containerIndex == "1"){
	        	$('#intro_close').prop("disabled", true);
	        	console.log(skill_containerIndex);
	        } else {
	        	if(skill_containerIndex != "4"){
	        		$('#intro_plus').prop("disabled", false);
	        	}
	        	console.log("- 되기전 : " + skill_containerIndex);
	        	skill_containerIndex--;
	        	var plus = "#tr" + skill_containerIndex + ""; 
		        $(plus).remove();
		        
		        if(skill_containerIndex == "1"){
	        		$('#intro_close').prop("disabled", true);
		        }
		        console.log("last : " + skill_containerIndex);
	        }
	        
	        /* 
	        
	        
	        if(skill_containerIndex > "-1" && skill_containerIndex < "7"){
		        $('#intro_plus').prop("disabled", false);
		    
		    } else {
	        	skill_containerIndex = 1;
	        }
	        console.log("close : " + skill_containerIndex); */
	     });
   });
</script>
    
<div id="Modal" class="modal fade" role="dialog">
		<!-- Modal content -->
		<div class="modal-dialog">
			<div class="container col-sm-12" style="background-color:white;">
					<div class="modal-header" style="text-align:center;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
         				<h4 class="modal-title">직무종류 및 채용형태</h4>
       				</div>
       				<!-- boardnum moviename genre director playdate price filesource -->
       				
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
         					<input id="hirejob_select_btn" type="button" class="btn btn-default" value="선택완료">
         					<button type="reset" class="btn btn-default" data-dismiss="modal">등록취소</button>
       				  </div>
       				  <br>
       						 </div>
       					 </div>
       				 </div>
			</div>	
		</div>	
	</div>
    
<div id="content">
	<div>
		<form action="employmentinsert.htm" method="post">
			<table class="table table-striped" style="width:75%" id="table">
				<tr>
					<td>
						채용 기간
					</td>
				
					<td>
						채용 시작일
						<input type="date" id="pick_start" name="pick_start">
					</td>
				</tr>
				<tr>
					<td>
					 &nbsp;
					</td>
					<td>
						채용 마감일
						<input type="date" id="pick_end" name="pick_end">
					</td>
				</tr>
				<tr>
					<td>
						직무종류 및 채용형태
					</td>
				
					<td>
						직무종류 
						<input type="text" id="hire_code" name="hire_code" readonly>
						채용형태
						<input type="text" id="job_code" name="job_code" readonly>
						
						<input type="button" class="btn btn-default" id="hirejob_select" data-toggle="modal" data-target="#Modal" value="선택"/>
						
					</td>
				</tr>
				<tr>
					<td>
						채용 인원
					</td>
					<td>
						<input type="text" id="pick_num" name="pick_num" value=""> &nbsp; 명
					</td>
				</tr>
				<tr>
					<td>
						지원자격
					</td>
					<td>
						<input type="text" id="pick_qulify" name="pick_qulify" value="">
					</td>
				</tr>
				<tr>
					<td>
						채용 내용
					</td>
					<td>
						<textarea id="pick_ctmt" name="pick_ctmt" rows="4" cols="50"></textarea>
					</td>
				</tr>
				<tr id="intro_after">
					<td>
						자소서 항목	/ 글자수
					</td>
					<td>
						<input type="text" class="form-control" id="intro_no" name="list[0].intro_no" placeholder="자소서 항목을 입력해주세요">
						<input type="text" class="form-control" id="intro_lim" name="list[0].intro_lim" placeholder="글자 수를 입력해 주세요">
					</td>
					<td>
						<input type="button" class="btn btn-default" id="intro_plus" value="+"/>
						<input type="button" class="btn btn-default" id="intro_close" value="x"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="btn btn-success" type="submit" value="등록하기">
						<input class="btn btn-success" type="reset" id="reset" name="reset" value="취소하기">
					</td>
				</tr>
			</table>
		</form>	
	</div>
</div>