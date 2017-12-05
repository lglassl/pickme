<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="content">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/member/address.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/member/emailcomp.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/member/ajax_image.js"></script>

<script type="text/javascript">

	function idCheck(){
		if($('#username').val() == ""){
				alert("아이디를 입력하세요");
				$('#username').focus();
				return false;
		}
		
		$.ajax({
			type : "post",
			url : "idCheckComp.htm",
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
	
	function compNum(){
		$('#comp_num').val($('#comp_num1').val() + "-" + $('#comp_num2').val() + "-" + $('#comp_num3').val());
	}
	
	function compEmail(){
		$('#comp_pp_email').val($('#email1').val() + '@' + $('#email2').val());
	}
	
	function compPhone(){
		$('#comp_pp_phone').val($('#comp_pp_phone1').val() + $('#comp_pp_phone2').val() + $('#comp_pp_phone3').val());
	}
	
	function compAddr(){
		$('#comp_addr').val($('#zipcode').val() + "/" + $('#addr1').val() + "-" + $('#addr2').val());
	}
	
	function dataCheck(){
		if($('#comp_name').val() == ""){
			alert("회사명을 입력하세요");
			$('#comp_name').focus();
			return false;
		}
		if($('#comp_num1').val() == ""){
			alert("사업자등록번호를 입력하세요");
			$('#comp_num1').focus();
			return false;
		}
		if($('#comp_num2').val() == ""){
			alert("사업자등록번호를 입력하세요");
			$('#comp_num2').focus();
			return false;
		}
		if($('#comp_num3').val() == ""){
			alert("사업자등록번호를 입력하세요");
			$('#comp_num3').focus();
			return false;
		}
		if($('#comp_year').val() == ""){
			alert("설립연도를 입력하세요");
			$('#comp_year').focus();
			return false;
		}
		if($('#comp_pp_name').val() == ""){
			alert("담당자이름을 입력하세요");
			$('#comp_pp_name').focus();
			return false;
		}
		if($('#comp_pp_job').val() == ""){
			alert("담당자 직챌을 입력하세요");
			$('#comp_pp_job').focus();
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
		if($('#comp_pp_phone2').val() == ""){
			alert("전화번호를 입력하세요");
			$('#comp_pp_phone2').focus();
			return false;
		}
		if($('#comp_pp_phone3').val() == ""){
			alert("전화번호를 입력하세요");
			$('#comp_pp_phone3').focus();
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
		if($('#comp_count').val() == ""){
			alert("사원수를 입력하세요");
			$('#comp_count').focus();
			return false;
		}
	}
</script>

<div class="main_area">
	<h2>기업회원가입</h2>
	<ul class="nav nav-pills nav-justified" role="tablist">
		<li><a href="/join_solo.htm">개인회원가입</a></li>
		<li class="active"><a href="/join_comp.htm">기업회원가입</a></li>       
	</ul>
	<form action="" method="post" enctype="multipart/form-data">
		<input type="hidden" name="comp_num" id=comp_num>
		<input type="hidden" name="comp_pp_email" id="comp_pp_email">
		<input type="hidden" name="comp_pp_phone" id="comp_pp_phone">
		<input type="hidden" name="comp_addr" id="comp_addr">
	<table class="table table-striped" style="margin-top:20px">
		<tr>
			<th>회사명</th>
			<td><input type="text" name="comp_name" id="comp_name" placeholder="OO소프트"></td>
		</tr>
		<tr>
			<th>사업자등록번호</th>
			<td>
				<input type="text" id="comp_num1" style="width:70px" placeholder="111">-
				<input type="text" id="comp_num2" style="width:70px" placeholder="22">-
				<input type="text" id="comp_num3" style="width:70px" placeholder="33333" onblur="compNum()">
			</td>
		</tr>
		<tr>
			<th>설립연도</th>
			<td><input type="text" name="comp_year" id="comp_year" placeholder="1900"></td>
		</tr>
		<tr>
			<th>기업로고이미지</th>
			<td>
				<input type="file" id="file" name="file" onchange="fileAjax(this)">
			</td>
		</tr>
		<tr>
			<th>이미지확인</th>
			<td style="height:150px">
				<p class="uploadedList">*이미지파일 업로드시 해당 이미지가 보여집니다</p>
			</td>
		</tr>
		<tr>
			<th>담당자이름</th>
			<td><input type="text" name="comp_pp_name" id="comp_pp_name" placeholder="홍길동"></td>
		</tr>
		<tr>
			<th>담당자직책</th>
			<td><input type="text" name="comp_pp_job" id="comp_pp_job" placeholder="팀장"></td>
		</tr>
		<tr>
			<th>ID</th>
			<td><input type="text" name="username" id="username" placeholder="myId">
			<input type="button" value="아이디 중복확인" class="btn btn-danger btn-sm" onclick="idCheck()">
			<p id="view"></p>
			</td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="password" name="password" id="password"></td>
		</tr>
		<tr>
			<th>PW확인</th>
			<td><input type="password" name="passcf" id="passcf"></td>
		</tr>
		<tr>
			<th>E-mail</th>
			<td>
				<input type="text" id="email1" style="width:20%" placeholder="emailID">@
				<input type="text" id="email2" style="width:20%" placeholder="gmail.com" onblur="compEmail()">
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
			<th>전화번호</th>
			<td>
				<select id="comp_pp_phone1">
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
					<option value="033">033</option>
					<option value="041">041</option>
					<option value="042">042</option>
					<option value="043">043</option>
					<option value="044">044</option>
					<option value="051">051</option>
					<option value="052">052</option>
					<option value="053">053</option>
					<option value="054">054</option>
					<option value="055">055</option>
					<option value="061">061</option>
					<option value="062">062</option>
					<option value="063">063</option>
					<option value="064">064</option>
					<option value="070">070</option>
				</select>-
				<input type="text" style="width:70px" id="comp_pp_phone2" placeholder="1234">-
				<input type="text" style="width:70px" id="comp_pp_phone3" placeholder="5678" onblur="compPhone()">
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
			<td><input type="text" id="addr2" style="width:70%" onblur="compAddr()"></td>
		</tr>
		<tr>
			<th>사원수</th>
			<td><input type="text" name="comp_count" id="comp_count" placeholder="500"></td>
		</tr>
		
	</table>
	<div style="text-align:center">
		<input type="submit" class="btn btn-success" onclick="return dataCheck()">
		<input type="reset" class="btn btn-danger">
	</div>
	</form>
</div>
</div>