<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
			<div id="content">
		<label class="formprofile_name" for="formprofile">자기소개서</label>
				<div class="formprofile question_formcontainer" id="editDetail" class="col-lg-12">
				
			<c:forEach items="${Cover2}" var="co" varStatus="status">	
			<span id="${co.username}">유저네임</span><br>
			
					<input type="hidden" id="question_index" value="${status.index }">
						<div class="row formprofile_row">
							<div class="col-md-10 form-group formprofile_detail input">
								<label class="control-label profile_label" for="Cover2[${status.index }].intro_no"> 항목 ${status.index +1} </label>
								<div id="Cover2[${status.index }].intro_no">${co.intro_no }</div>
							</div>
							<div class="col-md-2 form-group formprofile_detail input">
							<div class="form-group formprofile_detail input">
								<textarea id="Cover2[${status.index }].resu_ctmt" name="Cover2[${status.index }].resu_ctmt" rows="10" cols="92%"></textarea>		
							</div>
						</div>
					</div>
					<hr color="#808080">
					<input type="hidden" id="pick_no" name="pick_no" value="${co.pick_no }">
					<input type="hidden" id="pick_code" name="pick_code" value="${co.pick_code }">
			</c:forEach>		
				</div>
				</div>
			
</body>
</html>