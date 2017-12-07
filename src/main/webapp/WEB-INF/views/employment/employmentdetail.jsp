<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   <script type="text/javascript">
   
   $(function(){
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
   });
    </script>
    
<div id="Modal2" class="modal fade lg" role="dialog">
		<!-- Modal content -->
		<div class="modal-dialog">
			<div class="container col-sm-12" style="background-color:white;">
				<form name="insertmodalform" action="d_fileupload.do" method="post" enctype="multipart/form-data">
					<div class="modal-header" style="text-align:center;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
         				<h4 class="modal-title">일단은 채용정보만 띄워보자잉~~</h4>
       				</div>
       				<!-- boardnum moviename genre director playdate price filesource -->
       				
       				<div>
       					<a href="#first"><input type="button" value="first로 가기" data-target="#first"></a>
       					<a href="#second"><input type="button" value="2rd로 가기" data-target="#second"></a>
       					<input type="button" value="3rd로 가기">
       				</div>
       				
       				
       			<div class="row" id="first">
					<div class="col-sm-12">
       					<div class="modal-body col-sm-12"> 
							<table class="col-sm-12">
								<tr>
									<th class="col-sm-3" style="text-align:center">
										채용 시작일
									</th>
									<th class="col-sm-3" style="text-align:center">
										채용 마감일
									</th>
									<th class="col-sm-3" style="text-align:center">
										채용 인원
									</th>
									<th class="col-sm-3" style="text-align:center">
										&nbsp; 
									</th>
								</tr>
								<tr>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										<input type="button" value="지원하기">
									</td>
								</tr>
								<tr>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										<input type="button" value="지원하기">
									</td>
								</tr>
								<tr>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										<input type="button" value="지원하기">
									</td>
								</tr>
								<tr>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										<input type="button" value="지원하기">
									</td>
								</tr>
								<tr>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										2012-12-22
									</td>
									<td style="text-align:center">
										<input type="button" value="지원하기">
									</td>
								</tr>
								
							</table>				
					</div>
					<div class="row" style="text-align:center;" id="second">
						<div class=" col-sm-12">
         					<input type="button" class="btn btn-default" value="선택완료" onclick="">
         					<button type="reset" class="btn btn-default" data-dismiss="modal">등록취소</button>
       				  </div>
       				  <br>
       				 </div>
       				 </div>
       				 </div>
				</form>	
			</div>	
		</div>	
	</div>
    
<div id="content">
	<div>
		<form action="" method="post">
			<input type="button" class="btn btn-default" id="addbtn" data-toggle="modal" data-target="#Modal2" value="모달띄워보장">
		</form>	
	</div>
</div>