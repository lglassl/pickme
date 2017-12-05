<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="content">

<script type="text/javascript">

	function mode(){
		if($("input[type=radio][name=mode]:checked").val() == 'solo'){
			$('#formtag').css("display", "block");
			$('#formtag_comp').css("display", "none");
			$('#view').css("display", "none");
		}else if($("input[type=radio][name=mode]:checked").val() == 'comp'){
			$('#formtag_comp').css("display", "block");
			$('#formtag').css("display", "none");
			$('#view').css("display", "none");
		}
	}

	function check(){
		if($('#solo_name').val() == ""){
			alert("이름을 입력하세요");
			$('#solo_name').focus();
			return false;
		}
		if($('#solo_email').val() == ""){
			alert("이메일을 입력하세요");
			$('#solo_email').focus();
			return false;
		}
		$.ajax({
			type : "post",
			url : "member_solo_find.htm",
			data : 'solo_name='+$('#solo_name').val() + 
				'&solo_email='+$('#solo_email').val(),
			success : function(message){
				if(message.msg == 'ok'){
					$('#formtag').css("display", "none");
					$('#view').css("display", "block");
					$('#view').empty();
					$('#view').append('회원님의 아이디는 <span style="color:red;font-weight:bold">' + message.result + '</span> 입니다.');
				}else{
					$('#formtag').css("display", "none");
					$('#view').css("display", "block");
					$('#view').empty();
					$('#view').append('아이디가 없습니다.<br> 이름 & 이메일을 잘못 입력하셨거나, 회원이 아닙니다.');					
				}
			}		
		})
	}

	function check_comp(){
		if($('#comp_num').val() == ""){
			alert("사업자번호를 입력하세요");
			$('#comp_num').focus();
			return false;
		}
		if($('#comp_name').val() == ""){
			alert("기업이름을 입력하세요");
			$('#comp_name').focus();
			return false;
		}
		$.ajax({
			type : "post",
			url : "member_comp_find.htm",
			data : 'comp_num='+$('#comp_num').val() + 
				'&comp_name='+$('#comp_name').val(),
			success : function(message){
				if(message.msg == 'ok'){
					$('#formtag_comp').css("display", "none");
					$('#view').css("display", "block");
					$('#view').empty();
					$('#view').append('회원님의 아이디는 <span style="color:red;font-weight:bold">' + message.result + '</span> 입니다.');
				}else{
					$('#formtag_comp').css("display", "none");
					$('#view').css("display", "block");
					$('#view').empty();
					$('#view').append('아이디가 없습니다.<br> 이름 & 이메일을 잘못 입력하셨거나, 회원이 아닙니다.');					
				}
			}		
		})
	}
</script>

<div style="width:80%;margin:0 auto;padding-top:30px">
	<h2>아이디찾기</h2>
	<ul class="nav nav-pills nav-justified" role="tablist">
		<li class="active"><a href="/member_solo_find.htm">아이디찾기</a></li>
		<li><a href="/member_pwd_re.htm">비밀번호재설정</a></li>       
	</ul>
	
	<p style="margin:20px 0 10px 0">
		<input type="radio" value="solo" name="mode" onclick="mode()" checked >개인
		<input type="radio" value="comp" name="mode" onclick="mode()" >기업
	</p>
	
	<form id="formtag">
		<ul style="height:100px;padding:0px">
			<li style="float:left;width:70%">
				<p><input type="text" class="form-control" id="solo_name" placeholder="이름 입력"></p>
				<p><input type="text" class="form-control" id="solo_email" placeholder="이메일입력 ex)email@gmail.com"></p>
			</li>
			<li style="float:left;width:29%;margin-left:1%">
				<div>
					<input type="button" value="확인" class="btn btn-info" style="height:78px" onclick="check()">
				</div>
			</li>
		</ul>
	</form>
	
	<form style="display:none" id="formtag_comp">
		<ul style="height:100px;padding:0px">
			<li style="float:left;width:70%">
				<p><input type="text" class="form-control" id="comp_num" placeholder="111-22-33333"></p>
				<p><input type="text" class="form-control" id="comp_name" placeholder="OO소프트"></p>
			</li>
			<li style="float:left;width:29%;margin-left:1%">
				<div>
					<input type="button" value="확인" class="btn btn-info" style="height:78px" onclick="check_comp()">
				</div>
			</li>
		</ul>
	</form>
	
	<div style="margin-top:30px;text-align:center;font-size:20px">
		<p id="view" style="display:none"></p>
	</div>
</div>
</div>