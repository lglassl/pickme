<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/member/address.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/member/email.js"></script>

<script type="text/javascript">

	function join(){
		if($('#solo_name').val() == ""){
			alert("이름을 입력하세요");
			$('#solo_name').focus();
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
			url : "member_update_fb.htm",
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
					alert("수정완료했습니다.");
					location.href="/home.htm";
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
	<h2>개인정보확인</h2>
	<form>
	<table class="table table-striped" style="margin-top:20px">
		<tr>
			<th>이름</th>
			<td><input type="text" id="solo_name" value="${dto.solo_name}"></td>
		</tr>
		<tr>
			<th>ID</th>
			<td><input type="text" id="username" value="${dto.username}" disabled>
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="text" id="year" style="width:60px" value="${dto.solo_birth.substring(0,4)}">년
				<input type="text" id="month" style="width:40px" value="${dto.solo_birth.substring(4,6)}">월
				<input type="text" id="day" style="width:40px" value="${dto.solo_birth.substring(6,8)}">일
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<c:choose>
					<c:when test="${gender == male}">
						<input type="radio" value="male" name="gender" checked>남
						<input type="radio" value="female" name="gender">여
					</c:when>
					<c:otherwise>
						<input type="radio" value="male" name="gender">남
						<input type="radio" value="female" name="gender" checked>여
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>E-mail</th>
			<td>				
				<input type="text" id="email1" style="width:100px" value="${email01}">@
				<input type="text" id="email2" style="width:100px" value="${email02}">
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
			<th>핸드폰번호</th>
			<td>
				<select id="cphone1">
					<option value="010" <c:if test="${dto.solo_cphone.substring(0,3) == 010}">selected</c:if>>010</option>
					<option value="011" <c:if test="${dto.solo_cphone.substring(0,3) == 011}">selected</c:if>>011</option>
					<option value="016" <c:if test="${dto.solo_cphone.substring(0,3) == 016}">selected</c:if>>016</option>
					<option value="017" <c:if test="${dto.solo_cphone.substring(0,3) == 017}">selected</c:if>>017</option>
					<option value="018" <c:if test="${dto.solo_cphone.substring(0,3) == 018}">selected</c:if>>018</option>
					<option value="019" <c:if test="${dto.solo_cphone.substring(0,3) == 019}">selected</c:if>>019</option>
				</select>-
				<input type="text" id="cphone2" style="width:70px" value="${dto.solo_cphone.substring(3,7)}">-
				<input type="text" id="cphone3" style="width:70px" value="${dto.solo_cphone.substring(7,11)}">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" id="zipcode" style="width:70px" value="${zipcode}" disabled>
				<a href="javascript:sample6_execDaumPostcode()" class="btn btn-info btn-sm">우편번호검색</a>
				<input type="text" id="addr1" style="width:400px" value="${addr01}" disabled>
			</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td><input type="text" id="addr2" style="width:200px" value="${addr02}"></td>
		</tr>
		
	</table>
	<div style="text-align:center">
		<input type="button" value="수정" class="btn btn-success" onclick="join()">
	</div>
	</form>
</div>
</div>