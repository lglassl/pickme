<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/member/address.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/member/emailcomp.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/member/ajax_image.js"></script>

<script type="text/javascript">
	
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
}

function del(){
	if (confirm("정말 탈퇴하시겠습니까? 탈퇴이후 같은 아이디 재사용 불가합니다.") == true){
		$.ajax({
			type : "post",
			url : "member_del_comp.htm",
			data : 'username='+$('#username').val(),
			dataType: "json",
			success : function(data){
				if(data.msg == 'success'){
					alert("완료했습니다.");
					location.href="/logout";
				}else{
					alert("실패했습니다.");
				}
			}
		});
	}else
		return;
}
</script>

<div class="main_area">
	<h2>기업정보확인</h2>
	<form action="" method="post" enctype="multipart/form-data">
		<input type="hidden" name="username" id="username" value="${dto.username}">
		<input type="hidden" name="comp_num" id="comp_num" value="${dto.comp_num}">
		<input type="hidden" name="comp_pp_email" id="comp_pp_email" value="${dto.comp_pp_email}">
		<input type="hidden" name="comp_pp_phone" id="comp_pp_phone" value="${dto.comp_pp_phone}">
		<input type="hidden" name="comp_addr" id="comp_addr" value="${dto.comp_addr}">
	<table class="table table-striped" style="margin-top:20px">
		<tr>
			<th>회사명</th>
			<td><input type="text" name="comp_name" id="comp_name" value="${dto.comp_name}"></td>
		</tr>
		<tr>
			<th>사업자등록번호</th>
			<td>
				<input type="text" id="comp_num1" style="width:70px" value="${dto.comp_num.substring(0,3)}">-
				<input type="text" id="comp_num2" style="width:70px" value="${dto.comp_num.substring(4,6)}">-
				<input type="text" id="comp_num3" style="width:70px" value="${dto.comp_num.substring(7)}" onblur="compNum()">
			</td>
		</tr>
		<tr>
			<th>설립연도</th>
			<td><input type="text" name="comp_year" id="comp_year" value="${dto.comp_year}"></td>
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
				<p class="uploadedList"><img src="/resources/bootstrap/upload/images/${dto.comp_logo}" name="orig" style="width:133px"></p>
			</td>
		</tr>
		<tr>
			<th>담당자이름</th>
			<td><input type="text" name="comp_pp_name" id="comp_pp_name" value="${dto.comp_pp_name}"></td>
		</tr>
		<tr>
			<th>담당자직책</th>
			<td><input type="text" name="comp_pp_job" id="comp_pp_job" value="${dto.comp_pp_job}"></td>
		</tr>
		<tr>
			<th>ID</th>
			<td><input type="text" value="${dto.username}" disabled>
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
				<input type="text" id="email1" style="width:100px" value="${email01}">@
				<input type="text" id="email2" style="width:100px" value="${email02}" onblur="compEmail()">
				<select id="email3" style="width:130px">
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
					<option value="02 " <c:if test="${dto.comp_pp_phone.substring(0,3) == 02 }">selected</c:if>>02</option>
					<option value="031" <c:if test="${dto.comp_pp_phone.substring(0,3) == 031}">selected</c:if>>031</option>
					<option value="032" <c:if test="${dto.comp_pp_phone.substring(0,3) == 032}">selected</c:if>>032</option>
					<option value="033" <c:if test="${dto.comp_pp_phone.substring(0,3) == 033}">selected</c:if>>033</option>
					<option value="041" <c:if test="${dto.comp_pp_phone.substring(0,3) == 041}">selected</c:if>>041</option>
					<option value="042" <c:if test="${dto.comp_pp_phone.substring(0,3) == 042}">selected</c:if>>042</option>
					<option value="043" <c:if test="${dto.comp_pp_phone.substring(0,3) == 043}">selected</c:if>>043</option>
					<option value="044" <c:if test="${dto.comp_pp_phone.substring(0,3) == 044}">selected</c:if>>044</option>
					<option value="051" <c:if test="${dto.comp_pp_phone.substring(0,3) == 051}">selected</c:if>>051</option>
					<option value="052" <c:if test="${dto.comp_pp_phone.substring(0,3) == 052}">selected</c:if>>052</option>
					<option value="053" <c:if test="${dto.comp_pp_phone.substring(0,3) == 053}">selected</c:if>>053</option>
					<option value="054" <c:if test="${dto.comp_pp_phone.substring(0,3) == 054}">selected</c:if>>054</option>
					<option value="055" <c:if test="${dto.comp_pp_phone.substring(0,3) == 055}">selected</c:if>>055</option>
					<option value="061" <c:if test="${dto.comp_pp_phone.substring(0,3) == 061}">selected</c:if>>061</option>
					<option value="062" <c:if test="${dto.comp_pp_phone.substring(0,3) == 062}">selected</c:if>>062</option>
					<option value="063" <c:if test="${dto.comp_pp_phone.substring(0,3) == 063}">selected</c:if>>063</option>
					<option value="064" <c:if test="${dto.comp_pp_phone.substring(0,3) == 064}">selected</c:if>>064</option>
					<option value="070" <c:if test="${dto.comp_pp_phone.substring(0,3) == 070}">selected</c:if>>070</option>
				</select>-
				<input type="text" style="width:70px" id="comp_pp_phone2" value="${dto.comp_pp_phone.substring(3,7)}">-
				<input type="text" style="width:70px" id="comp_pp_phone3" value="${dto.comp_pp_phone.substring(7)}" onblur="compPhone()">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" id="zipcode" value="${zipcode}" style="width:70px" disabled>
				<a href="javascript:sample6_execDaumPostcode()" class="btn btn-info btn-sm">우편번호검색</a>
				<input type="text" id="addr1" value="${addr01}" style="width:300px" disabled>
			</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td><input type="text" id="addr2" value="${addr02}" style="width:400px" onblur="compAddr()"></td>
		</tr>
		<tr>
			<th>사원수</th>
			<td><input type="text" name="comp_count" id="comp_count" value="${dto.comp_count}"></td>
		</tr>
		
	</table>
	<div style="text-align:center">
		<input type="submit" class="btn btn-success" onclick="return dataCheck()">
		<input type="button" value="회원탈퇴" class="btn btn-danger" onclick="del()">
	</div>
	</form>
</div>
</div>