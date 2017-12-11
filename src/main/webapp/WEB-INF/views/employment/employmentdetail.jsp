<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>
#Modal {
	width:100%;
	height:100%;
	font: 18px Montserrat, sans-serif;
	line-height: 1.8;
	
}

#aaaa{
	margin-top: 2%;
    margin-left: 13%;
    margin-right: 10%;
    
}
/* 
.table{
	margin-top:10px;
	margin-left:10%;
	margin-right:15%
	width:80%;
	text-align:center;
}
*/

.table th {
	background-color:#EAEAEA;
	font-size:14px;
	text-align:center;
}

.table td{
	font-size:14px;
	text-align: center;
}
 
.ul{
	text-align:center;
}

.navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: white;
      height: 100%;
    }
    
</style>

<script type="text/javascript">

		$(document).ready( function() {
			$('.modal').on('hidden.bs.modal', function (e) {
		        console.log('modal close');
		      $(this).find('form')[0].reset();
		    });
			
			//$('#Modal').modal('show');
			
			$(".nav-tabs a").click(function(){
		        $(this).tab('show');
		    });
			
			
		});

		google.charts.load("current", {packages:["corechart"]});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['Task', 'Hours per Day'],
	          ['TOEIC 600',     11],
	          ['TOEIC 700',      2],
	          ['TOEIC 800',  2],
	          ['TOEIC 900', 2]
	        ]);

	        var options = {
	          title: '토익 점수별 차트',
	          pieHole: 0.4,
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('chart2'));
	        chart.draw(data, options);
	    }
		
</script>

<!-- <div id="Modal" class="modal fade" role="dialog">
	Modal content
	<div class="modal-dialog" id="aaaa"> -->
		<div class="container" style="background-color: white;">
			  
				<div class="modal-header" style="text-align:center;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
	         		<img src="" alt="${Detail_Compinfo.comp_logo}">
         			<h2 class="modal-title">${Detail_Compinfo.comp_name}</h2>
       			</div>
			  <ul class="nav nav-pills nav-justified">
			    <li class="active"><a data-toggle="pill" href="#menu1"><strong>채용정보</strong></a></li>
			    <li><a data-toggle="pill" href="#menu2"><strong>지원자 분석</strong></a></li>
			  </ul>
			
			  <div class="tab-content">
			  
			     <div id="menu1" class="tab-pane fade in active table-bordered" style="margin-top:20px; border:2px; text-size:20px;">
			    	<div class="container-fluid text-center">    
					  <div class="row content">
					    <div class="col-sm-1 sidenav">

					    </div>
					    <div class="col-sm-10 text-left" id="compinfo">
					      <h4><strong>&nbsp;기업정보 &nbsp;</strong></h4>
					   	  <hr>
					      <table class="table table-bordered">
						    <thead>
						      <tr>
						        <th>기업명</th>
						        <td>${Detail_Compinfo.comp_name}</td>
						        <th>담당자명</th>
						        <td>${Detail_UserComp.comp_pp_name}</td>
						      </tr>
						    </thead>
						    <tbody>
						      <tr>
						        <th>설립연도</th>
						        <td>${Detail_Compinfo.comp_year }</td>
						        <th>담당자 E-mail</th>
						        <td>${Detail_UserComp.comp_pp_email}</td>
						      </tr>
						      <tr>
						        <th>사원수</th>
						        <td>${Detail_Compinfo.comp_count} &nbsp;명</td>
						        <th>담당자 직책</th>
						        <td>${Detail_UserComp.comp_pp_job}</td>
						      </tr>
						      <tr>
						        <th>기업주소</th>
						        <td>${Detail_Compinfo.comp_addr}</td>
						        <th>인사계 번호</th>
						        <td>${Detail_UserComp.comp_pp_phone}</td>
						      </tr>
						    </tbody>
						  </table>
					    
					     
						  <br>
					      <h4><strong>&nbsp;채용정보&nbsp;</strong></h4>
					      <hr>
					      <table class="table col-sm-12">
					     	 <tr>
					      		<th>채용기간</th>
					      		<td>
					      			<p>${Detail_CompPick.pick_start} &nbsp;-&nbsp; ${Detail_CompPick.pick_end}</p>
					      		</td>
					      	</tr>
					      </table>
					      <table class="table col-sm-12">
					      	<tr>
					      		<th>기업</th>
					      		<th>채용직무</th>
					      		<th>채용형태</th>
					      		<th>채용인원</th>
					      	</tr>
					      	<tr>
					      		<td> ${Detail_Compinfo.comp_name} </td>
					      		<td> ${Detail_CompPick.job_field} </td>
					      		<td> ${Detail_CompPick.hire_field}</td>
					      		<td> ${Detail_CompPick.pick_num} &nbsp;명</td>
					      	</tr>
					      </table>
					      <table class="table col-sm-12">
					      	<tr>
					      		<th> 채용내용 </th>
					      	</tr>
					      	<tr>
					      		<td>
					      			<p> 
										${Detail_CompPick.pick_ctmt}
								  	</p>
					      		</td>
					      	</tr>
					      </table>
					      
					      <br>
					      <hr>
					      <div id="pickinfo"> 
					      	<h4><strong>&nbsp;채용공고&nbsp;</strong></h4>
					      </div>
					      <hr>
					      <p>ddddddddddddddddddddalsdjfhjkasdfjkandsfjkanㅁㅇㄴ려ㅔㅁㄴㅇ퍄부뒢배두ㅐㅂ두패베푸ㅐ베두패버누ㅐㅑ베ㅓ래ㅑㅂ도려재ㅗ햊웊
					      ㄴ애허ㅜ넝후ㅐ더후배데두ㅐ[붕체ㅐ주유ㅐㅑ부애풍내푿[퍄ㅐ부아ㅐ부애ㅑㅜㅐㅓ누차ㅐㅜㅑㅐ배ㅜㅐㅐ바우ㅏㅣㅜ앻부ㅑㅐㅜㅐㅑ우매ㅑ우ㅐ무채ㅑ주ㅐ[ㅜ애ㅑ메ㅜㅐㅑㅁ냐ㅓ뷰]]]ㅁ어ㅐㅜㅁ
					      ㅁ아ㅐㅜ머웊맹루ㅐㅞ우퍄퍼타루머아롭뎌ㅑ럼알뎌ㅑ저아ㅗ뎢러우ㅕ9ㄷㅈ래ㅑㅓㅇ녀ㅗㅈㄱ러ㅜㅏㅕㅅㄱㄷ허ㅑㅜㅏㅑ더래이배ㅑㅓ라;ㅜ미버ㅐㄻㄷ랴ㅐㅓ우ㅏ
					      ㅇ내ㅓㄷ재ㅑㄹ어ㅜ댜래어ㅟ댖ㄿ대러우ㅏㄷ래ㅜ어ㅏㅣ펑너ㅜㄴ어ㅏㅍ
					      ㄴㅇ뤄ㅏㅣㄴ우러ㅏㅜㅁㄴ아ㅓ리ㅜ마ㅓㅣㅇㄴ룸
					      ㄴㅇㄹ머니아풔냥퓨ㅑ주펒두파저ㅜ퍼ㅏㄴ푸어파ㅓㄴ우퍼
					      ㅇ퍼누아ㅓㅣ푸마ㅓ워ㅏ누어ㅏ푸ㅏㅓㅣㅁㄴ워ㅏㅜㅁㄴ아ㅓ풔ㅏㅁㄴ웊
					      ㅁㄴㅇ패ㅜㅁㄴ이
					      </p>
						  
					      
					    </div>
					    <div class="col-sm-1 sidenav">
					      
					   </div>
					 </div>
				</div>
			 </div>
			<div id="menu2" class="tab-pane fade table-bordered" style="margin-top:20px; border:2px;">
			 	<div class="container-fluid text-center">   
					  <div class="row content">
					    <div class="col-sm-1 sidenav">
					      <p><a href="#">1</a></p>
					      <p><a href="#">2</a></p>
					      <p><a href="#">3</a></p>
					    </div>
					    <div class="col-sm-10 text-left"> 
					   	  
					   	  <div id="chart2" style=" width:900px; height:450px; align: center; background-color: none;">
					   	  
					   	  </div>
					   	  
					    </div>
					    <div class="col-sm-1 sidenav">
					      
					   </div>
					 </div>
				</div>
			 
				</div>	
			 </div>

			<!-- Footer -->
			<footer class="container-fluid text-center">
			  <a href="#aaaa" title="To Top">
			    <span class="glyphicon glyphicon-chevron-up"></span>
			  </a>
			  <br>
			  <p><a href="home.htm">PICK ME</a></p>
			</footer>
		</div>
<!-- 	</div>
</div> -->
