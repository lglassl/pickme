<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 
   @JSP : main.jsp 
   @Date : 2017-11-28
   @Author : 임혜성
   @Desc : 메인 채용 공고
--%>
<style>
#company_pick {
	float: left;
	margin-left: 40px;
	margin-bottom: 40px;
	width: 150px;
	height: 180px;
	border: 0 ridge;
	border-radius: 20px;
	box-shadow: 10px 15px 5px gray;
	text-align: center;
	background-color: white;
}

.company_logo {
	height: 40%;
	position: relative;
}

.company_pick_btn {
	padding: 0 0 0 0;
	position: relative;
	width: 50%;
	float: left;
	height: 40px;
}

.company_intro {
	padding: 0 0 0 0;
	position: relative;
	width: 50%;
	float: left;
	height: 40px;
}

#logo_image {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	width: 40px;
}

#btn {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	width: 70%;
	height: 70%;
	/* 내리고 사이즈 */
	width: 90%;
	text-align: center;
	height: 30px;
	line-height: 26px;
	padding: 0px;
	font-size: 70%;
}

.js-load {
    display: none;
}
.js-load.active {
    display: block;
}
.is_comp.js-load:after {
    display: none;
}
.btn-wrap, .lists, .main {
    display: block;
}
.main {
    max-width: 640px;
    margin: 0 auto;
}
.lists {
    margin-bottom: 4rem;
}

.btn-wrap {
    text-align: center;
}
.button{
	float: left;
	margin-left: 200px;
}
</style>

<script>
$(window).on('load', function () {
    load('#js-load', '4');
    $("#js-btn-wrap .button").on("click", function () {
    	console.log("buttn");
        load('#js-load', '4', '#js-btn-wrap');
    })
});
 
function load(id, cnt, btn) {
	console.log("id : "+ id + "cnt : "+ cnt+"btn : "+btn);
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
        girls_total_cnt = girls_length;
        $('.button').hide();
    }
    console.log("list : "+girls_list+", length : "+girls_length);
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}

/* 필터 더 보기  */
function filterMore(id, cnt, btn) {
	id = '#'+id;
	btn = '#'+btn;
	console.log("id : "+ id + "cnt : "+ cnt+"btn : "+btn);
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
        girls_total_cnt = girls_length;
        $('.button').hide();
    }
    console.log("list : "+girls_list+", length : "+girls_length+", total : "+girls_total_cnt);
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}

function like(userName, pickCode, index){
	var likeData = {
			"username" : userName,
			"pick_code" : pickCode
		};
	json_data = JSON.stringify(likeData);
	console.log(userName+"ssssss");
	$.ajax({
		type : "post",
		url : 'likeAjax.htm', 
		data : json_data,
		contentType: "application/json; charset=utf-8",
		dataType : "json",
		success : function(likeAjax){
			console.log(likeAjax.likeResult);
			console.log('aaa');
			var img = "";
			if(likeAjax.likeResult == 1){
				console.log("delete"+img);
				img = "<img src='/resources/image/blue_check.png' style='width: 30px'>";
			}else{
				console.log("insert"+img);
				img = "<img src='/resources/image/check.png' style='width: 30px'>";
			}
			
			$('#like'+index).html(img);
		}
	});
}

function filter(job_field, username){
	/* console.log(job_field); */
	
	var filterData = {
		"job_field" : job_field,
		"username" : username,
		"comp_name" : $('#pickSearch').val()
	}
	
	$.ajax({
		type : "POST",
		url : "filterSearch.htm",
		data : filterData,
		datatype : "json",
		success : function(data){
			
			var filter = "";
			var main="<div id='js-load'>"+
				  "<ul class='lists'>";
			$.each(data.userComPpList, function(index1, cList){
				$.each(data.filterCompPickInfoList, function(index2, uList){
					if(cList.username == uList.username){
									
						filter += "<li class='lists__item js-load'>";
						filter += "<div id='company_pick'>" +
						"<div class='company_logo'>"+
							"<img id='logo_image' src="+cList.comp_logo+">" +
						"</div>" +
						"<div style='height: 20%'>" +
		                	"<div>"+cList.comp_name+ " " +uList.pick_start +"</div>"+
		                  	"<div>"+uList.pick_apply_num+ " 명 작성중!</div>" +
	               		"</div>" +
		               	"<div class='row' style='height: 22%; margin: 0'>" +
		                	"<div class='company_pick_btn col-sm-6'>" +
		                    	"<a href='comp_pick.htm' id='btn' type='button' class='btn btn-info'>채용공고</a>" +
		                  	"</div>" +
		                 	"<div class='company_intro col-sm-6'>"+
		                     	"<a href='#' id='btn' type='button' class='btn btn-info'>자기소개서</a>"+
		                  	"</div>"+
		               	"</div>";

		               var check=0;
		               $.each(data.listLike, function(index3, lList){
		            	  console.log("코드 검사"+lList.pick_code+", "+uList.pick_code);
		                  if(lList.pick_code == uList.pick_code){		
		                	  filter +="<div style='height: 23%;'>"+
			                        "<a href='#' id='like"+index2+"' onclick=like('jung',"+uList.pick_code+","+index2+")><img src='/resources/image/check.png'style='width: 30px'>"+
			                        "</a>"+
			                     "</div>";
		                	  check = 1;
		                  }
		               });
		               console.log("check"+check);
		               if(check == 0){
		               filter += "<div style='height: 23%;'>"+
		                  	"<a href='#' id='like"+index2+"' onclick=like('jung',"+uList.pick_code+","+index2+")><img src='/resources/image/blue_check.png'style='width: 30px'>"+
		                     "</a>"+
		                  "</div>";
		               }
		            filter += "</div>";
		            filter += "</li>";
					}
				});
			});
			main += filter+
				"</ul>"+
				"<div id='js-btn-wrap' class='btn-wrap'>"+
		 		"<a type='button' id='bttn' href='javascript:;' class='button btn-info'>더보기</a>"+	
		 		"</div>"+
		 		"</div>";
		 	console.log(main);
			$('#filtering').html(main);
			/* $('#filtering').html(filter); */
		}
	})
	
}

</script>

<div id="content">
	<div class="container">
		<h2>Vertical Button Group</h2>
		<p>Use the .btn-group-vertical class to create a vertical button
			group:</p>
		<div style="text-align: right; width: 82%;">
			<input type="text" id="pickSearch">
			<button type="button" class="btn btn-info" onclick="filter(1,'jung')">검색</button>
		</div>
		<div class="row">
			<div class="btn-group-vertical col-sm-2" style="float: left;">
				<a href="home.htm" type="button" id="manage" class="btn btn-primary" >전체</a>
				<input type="button" id="manage" class="btn btn-primary" value="경영,사무" onclick="filter(this.value, 'jung')">
				<input type="button" id="marketing" class="btn btn-primary" value="마케팅,무역,유통" onclick="filter(this.value, 'jung')">
				<input type="button" id="sales" class="btn btn-primary" value="영업,고객상담" onclick="filter(this.value, 'jung')">
				<input type="button" id="it" class="btn btn-primary" value="IT,인터넷" onclick="filter(this.value, 'jung')">
				<input type="button" id="r&d" class="btn btn-primary" value="연구개발,설계" onclick="filter(this.value, 'jung')">
				<input type="button" id="produce" class="btn btn-primary" value="생산,제조" onclick="filter(this.value, 'jung')">
				<input type="button" id="professions" class="btn btn-primary" value="전문,특수직" onclick="filter(this.value, 'jung')">
				<input type="button" id="design" class="btn btn-primary" value="디자인" onclick="filter(this.value, 'jung')">
				<input type="button" id="media" class="btn btn-primary" value="미디어" onclick="filter(this.value, 'jung')">
				<input type="button" id="service" class="btn btn-primary" value="서비스" onclick="filter(this.value, 'jung')">
				<input type="button" id="construction" class="btn btn-primary" value="건설" onclick="javascript:filter(this.value, 'jung');filterMore(this.id, 2);">

			</div>
			<div class="col-sm-10">
		<!-----------------
		  	 각 채용공고 (foreach문)
		  ----------------->
				 <div id="filtering">
				 <div id="js-load">
   				  <ul class="lists">
					<!-- 공고정보 -->
					<c:set var="compPickList" value="${compPickList}"/>	
					<!-- 기업회원정보 -->
					<c:set var="userComPpList" value="${userComPpList}"/>
					<!-- 회원 좋아요 여부 -->
					<c:set var="listLike" value="${listLike}"/>	
					<c:forEach var="i" begin="0" end="${fn:length(userComPpList)-1}" step="1">
						<c:forEach var="j" begin="0" end="${fn:length(compPickList)-1}" step="1">
						<c:if test="${userComPpList.get(i).getUsername() eq compPickList.get(j).getUsername()}">
							<li class="lists__item js-load">
							<div id="company_pick"> 
								<div class="company_logo">
									<img id="logo_image" src="${userComPpList.get(i).getComp_logo()}">
								</div>
								<div style="height: 20%">
									<div>${userComPpList.get(i).getComp_name()} ${compPickList.get(j).getPick_start()}</div>
									<div>${compPickList.get(j).getPick_apply_num()}명 작성중!</div>
								</div>
								<div class="row" style="height: 22%; margin: 0">
									<div class="company_pick_btn col-sm-6">
										<a href="comp_pick.htm" id="btn" type="button"
											class="btn btn-info">채용공고</a>
									</div>
									<div class="company_intro col-sm-6">
										<a href="#" id="btn" type="button" class="btn btn-info">자기소개서</a>
									</div>
								</div>
								<c:set var="likeCheck" value="0"/>
								<c:forEach var="listLike" items="${listLike}">
									<c:if test="${listLike.getPick_code() eq  compPickList.get(j).getPick_code()}">
										<div style="height: 23%;">
											<a href='#' id="like${j}" onclick="like('jung', ${compPickList.get(j).getPick_code()}, ${j})">
												<img src="/resources/image/check.png"style="width: 30px">
											</a>
											<c:set var="likeCheck" value="1"/>
										</div>
									</c:if>
								</c:forEach>
								<c:if test="${likeCheck != 1}">
									<div style="height: 23%;">
										<a href='#' id="like${j}" onclick="like('jung', ${compPickList.get(j).getPick_code()}, ${j})">
											<img src="/resources/image/blue_check.png"style="width: 30px">
										</a>
										<c:set var="likeCheck" value="0"/>
									</div>
								</c:if>
							</div>
						   </li>
						</c:if>
						</c:forEach>
					</c:forEach>
					</ul>
					<div id="js-btn-wrap" class="btn-wrap"> 
				 		<a type="button" href="javascript:;" class="button btn-info">더보기</a>
				 	</div>
				 </div>	<!-- js-load -->
  				</div>	<!-- filtering -->
				<%-- <br>
				<!-- 페이징 처리 -->
				<div style="width: 85%; margin: 0 auto; float: left;">
					<c:set var="pagesize" value="${page}" />
					<c:set var="cpage" value="${cpage}" />
					<div align="center">
						<c:if test="${cpage>0}">
							<ul class="pager">
								<li><a
									href="home.htm?cp=${cpage-1}&ps=${pagesize}">Previous</a></li>
								<li><a
									href="home.htm?cp=${cpage+1}&ps=${pagesize}">Next</a></li>
							</ul>
						</c:if>
					</div>
				</div> --%>
			</div>
		</div>
	</div>
</div>