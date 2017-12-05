<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="content">

<script type="text/javascript">

	function mode(){
		if($("input[type=radio][name=mode]:checked").val() == 'solo'){
			$('#formtag').css("display", "block");
			$('#formtag_comp').css("display", "none");
		}else if($("input[type=radio][name=mode]:checked").val() == 'comp'){
			$('#formtag_comp').css("display", "block");
			$('#formtag').css("display", "none");
		}
	}

	function check(){
		if($('#username').val() == ""){
			alert("아이디를 입력하세요");
			$('#username').focus();
			return false;
		}
		if($('#solo_email').val() == ""){
			alert("이메일을 입력하세요");
			$('#solo_email').focus();
			return false;
		}
		$.ajax({
			type : "post",
			url : "member_pwd_re.htm",
			data : 'username='+$('#username').val() + 
				'&solo_email='+$('#solo_email').val(),
			success : function(message){
				if(message.msg == 'ok'){
					alert('메일이 전송되었습니다.');
					location.href="/home.htm";
				}else{
					alert('아이디&이메일이 일치하지 않거나 없는 회원입니다.');
					$('form')[0].reset();
				}
			}		
		})
	}

	function check_comp(){
		if($('#usernameComp').val() == ""){
			alert("아이디를 입력하세요");
			$('#usernameComp').focus();
			return false;
		}
		if($('#comp_pp_email').val() == ""){
			alert("이메일을 입력하세요");
			$('#comp_pp_email').focus();
			return false;
		}
		$.ajax({
			type : "post",
			url : "member_pwd_comp.htm",
			data : 'username='+$('#usernameComp').val() + 
				'&comp_pp_email='+$('#comp_pp_email').val(),
			success : function(message){
				if(message.msg == 'ok'){
					alert('메일이 전송되었습니다.');
					location.href="/home.htm";
				}else{
					alert('아이디&이메일이 일치하지 않거나 없는 회원입니다.');
					$('form')[0].reset();
				}
			}		
		})
	}
</script>

<div style="width:80%;margin:0 auto;padding-top:30px">
	<h2>비밀번호재설정</h2>
	<ul class="nav nav-pills nav-justified" role="tablist">
		<li><a href="/member_solo_find.htm">아이디찾기</a></li>
		<li class="active"><a href="/member_pwd_re.htm">비밀번호재설정</a></li>       
	</ul>
	
	<h4 style="margin-top:20px">아이디와 이메일을 입력하시면 임시 비밀번호가 전송됩니다</h4>
	
	<p style="margin:20px 0 10px 0">
		<input type="radio" value="solo" name="mode" onclick="mode()" checked >개인
		<input type="radio" value="comp" name="mode" onclick="mode()" >기업
	</p>
	
	<form id="formtag">
		<ul style="height:100px;padding:0px">
			<li style="float:left;width:70%">
				<p><input type="text" class="form-control" name="username" id="username" placeholder="아이디 입력"></p>
				<p><input type="text" class="form-control" name="solo_email" id="solo_email" placeholder="이메일입력 ex)email@gmail.com"></p>
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
				<p><input type="text" class="form-control" name="username" id="usernameComp" placeholder="아이디 입력"></p>
				<p><input type="text" class="form-control" name="solo_email" id="comp_pp_email" placeholder="이메일입력 ex)email@gmail.com"></p>
			</li>
			<li style="float:left;width:29%;margin-left:1%">
				<div>
					<input type="button" value="확인" class="btn btn-info" style="height:78px" onclick="check_comp()">
				</div>
			</li>
		</ul>
	</form>
</div>
</div>