<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="content">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/member/address.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/member/email.js"></script>
<script src="/resources/bootstrap/js/member/facebook.js"></script>

<script type="text/javascript">
	$(function(){
		$('#dialog').dialog({
			autoOpen : false,
		    modal: true,
			show : {
				effect : "blind",
				duration : 1000
			}		
		})
		
		$('#pre').click(function(){
			$('#dialog').dialog("close");
			location.href="/home.htm";
		});
	})
	
	function idCheck(){
		if($('#username').val() == ""){
			alert("아이디를 입력하세요");
			$('#username').focus();
			return false;
		}
		$.ajax({
			type : "post",
			url : "idCheckSolo.htm",
			data : 'username='+$('#username').val(),
			success : function(message){
				if(message.msg == 'no'){
					$('#view').empty();
					$('#view').append('사용할수 없는 아이디입니다.');
				}else{
					$('#view').empty();
					$('#view').append('사용가능한 아이디입니다.');					
				}
			}
		})
	}

	function join(){
		if($('#solo_name').val() == ""){
			alert("이름을 입력하세요");
			$('#solo_name').focus();
			return false;
		}
		if($('#username').val() == ""){
			alert("아이디를 입력하세요");
			$('#username').focus();
			return false;
		}
		if($('#view').text() != "사용가능한 아이디입니다."){
			alert('아이디 중복체크를 하시거나, 다른 아이디를 입력하세요');
			$('#username').focus();
			return false;			
		}
		if($('#password').val() == ""){
			alert("비밀번호를 입력하세요");
			$('#password').focus();
			return false;
		}
		if($('#passcf').val() == ""){
			alert("비밀번호 확인을 입력하세요");
			$('#passcf').focus();
			return false;
		}
		if($('#passcf').val() != $('#password').val()){
			alert("비밀번호와 확인칸이 다릅니다");
			$('#passcf').focus();
			return false;
		}
		if($('#year').val() == ""){
			alert("연도를 입력하세요");
			$('#year').focus();
			return false;
		}
		if($('#month').val() == ""){
			alert("월을 입력하세요");
			$('#month').focus();
			return false;
		}
		if($('#day').val() == ""){
			alert("날짜를 입력하세요");
			$('#day').focus();
			return false;
		}
		if($('#email1').val() == ""){
			alert("이메일주소를 입력하세요");
			$('#email1').focus();
			return false;
		}
		if($('#email2').val() == ""){
			alert("이메일주소를 입력하세요");
			$('#email2').focus();
			return false;
		}
		if($('#cphone1').val() == ""){
			alert("전화번호를 입력하세요");
			$('#cphone1').focus();
			return false;
		}
		if($('#cphone2').val() == ""){
			alert("전화번호를 입력하세요");
			$('#cphone2').focus();
			return false;
		}
		if($('#cphone3').val() == ""){
			alert("전화번호를 입력하세요");
			$('#cphone3').focus();
			return false;
		}
		if($('#addr1').val() == ""){
			alert("주소를 입력하세요");
			$('#addr1').focus();
			return false;
		}
		if($('#addr2').val() == ""){
			alert("주소를 입력하세요");
			$('#addr2').focus();
			return false;
		}
		$.ajax({
			type : "post",
			url : "join_sole.htm",
			data : 'solo_name='+$('#solo_name').val() + 
					'&username='+$('#username').val() + 
					'&password='+$('#password').val() +  
					'&solo_birth='+$('#year').val() + $('#month').val() + $('#day').val() +  
					'&solo_gender='+$("input[type=radio][name=gender]:checked").val() +  
					'&solo_email='+$('#email1').val() + '@' + $('#email2').val() +  
					'&solo_cphone='+$('#cphone1').val() + $('#cphone2').val() + $('#cphone3').val() +  
					'&solo_addr='+$('#zipcode').val() + '/' +$('#addr1').val() + '-' + $('#addr2').val(),
			dataType: "json",
			success : function(data){
				if(data.msg == 'success'){
					$('#dialog').dialog("open");
				}else{
					alert("실패했습니다.");
				}
			}
		});
	}
</script>

<style>
.ui-dialog .ui-dialog-titlebar-close { display: none; position: absolute; right: .3em; top: 50%; width: 19px; margin: -10px 0 0 0; padding: 1px; height: 18px; }
</style>

<div style="width:80%;margin:0 auto;padding-top:30px">
	<h2>개인회원가입</h2>
	<ul class="nav nav-pills nav-justified" role="tablist">
		<li class="active"><a href="/join_solo.htm">개인회원가입</a></li>
		<li><a href="/join_comp.htm">기업회원가입</a></li>       
	</ul>
	<div style="margin-top:20px">
		<a href="javascript:login()" class="btn btn-default">페이스북으로 가입하기</a>
	</div>
	<form>
	<table class="table table-striped" style="margin-top:20px">
		<tr>
			<th>이름</th>
			<td><input type="text" id="solo_name" placeholder="홍길동"></td>
		</tr>
		<tr>
			<th>ID</th>
			<td><input type="text" id="username" placeholder="myid">
			<input type="button" value="아이디 중복확인" class="btn btn-danger btn-sm" onclick="idCheck()">
			<p id="view"></p>
			</td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="password" id="password"></td>
		</tr>
		<tr>
			<th>PW확인</th>
			<td><input type="password" id="passcf"></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="text" id="year" style="width:60px" placeholder="1980">년
				<input type="text" id="month" style="width:40px" placeholder="01">월
				<input type="text" id="day" style="width:40px" placeholder="01">일
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" value="male" name="gender" checked>남
				<input type="radio" value="female" name="gender">여
			</td>
		</tr>
		<tr>
			<th>E-mail</th>
			<td>
				<input type="text" id="email1" style="width:20%" placeholder="emailId">@
				<input type="text" id="email2" style="width:20%" placeholder="gmail.com">
				<select id="email3" style="width:20%">
					<option value="">직접입력</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="nate.com">nate.com</option>
					<option value="daum.net">daum.net</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>핸드폰번호</th>
			<td>
				<select id="cphone1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>-
				<input type="text" id="cphone2" style="width:70px" placeholder="1234">-
				<input type="text" id="cphone3" style="width:70px" placeholder="5678">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" id="zipcode" style="width:70px" disabled>
				<a href="javascript:sample6_execDaumPostcode()" class="btn btn-info btn-sm">우편번호검색</a>
				<input type="text" id="addr1" style="width:60%" disabled>
			</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td><input type="text" id="addr2" style="width:70%"></td>
		</tr>
		
	</table>
	<div style="text-align:center">
		<input type="button" value="확인" class="btn btn-success" onclick="join()">
		<input type="reset" class="btn btn-danger">
	</div>
	</form>
	
	<div id="dialog">
		<div>
			<h2>가입을 축하드립니다.</h2>
			<p>입력하신 메일주소로 인증메일이 발송되었습니다. 버튼을 클릭하시어 인증을 하셔야 회원으로 활동 가능합니다.</p>
		</div>
		<input type="button" id="pre" value="확인">
	</div>
</div>
</div>