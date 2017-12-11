<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/bootstrap/css/adminEditDetail.css" rel="stylesheet"
	type="text/css">
<title>Insert title here</title>
</head>
<script type="text/javascript">


</script>
<body>
  <div class="container" id="content">
	  <div class="col-sm-2"></div>
	  <div class="col-sm-8">
		         <c:forEach items="${Cover2List }" var="Cover2List" varStatus="status">   
		         <input type="hidden" name="username" id="username" value="${Cover2List.username}">
		         <input type="hidden" name="pick_code" id="pick_code" value="${Cover2List.pick_code }">
		               <div class="question_formcontainer${status.index }">
		                  <input type="hidden" id="question_index" value="${status.index}">
		                  <div class="row formprofile_row">
		                     <div class="col-sm-7 form-group formprofile_detail input">
		                        <label class="control-label profile_label" for="coverletterList2.intro_no"> 항목 ${status.index +1} </label>
		                        <input id="coverletterList2.intro_no" name="coverletterList2[${status.index }].intro_no" value="${Cover2List.intro_no }" readonly style="background-color: transparent;">
		                     </div>
		                     <div class="col-sm-5 form-group formprofile_detail input">
		                        <label class="control-label profile_label" for="coverletterList2.intro_lim">글자 수</label>
		                        <input id="coverletterList2.intro_lim" name="coverletterList2[${status.index }].intro_lim" value="${Cover2List.intro_lim}" readonly style="background-color: transparent;">
		                     </div>
		                     <div class="form-group formprofile_detail input">
		                        <textarea id="coverletterList2_resu_ctmt${status.index }" name="coverletterList2[${status.index }].resu_ctmt" rows="10" cols="92%" readonly
		                        				value="${Cover2List.resu_ctmt}">${Cover2List.resu_ctmt}</textarea>      
		                     </div>
		                      <div class="form-group formprofile_detail input">
		                        <textarea id="coverletterList2_resu_edit${status.index }" name="coverletterList2[${status.index }].resu_edit" value="${Cover2List.resu_edit}" rows="10" cols="92%" readonly>${Cover2List.resu_edit}</textarea>      
		                     </div>
		                  </div>
		               </div>
		               <hr color="#808080">
		               <input type="hidden" id="username" name="coverletterList2[${status.index }].username" value="${Cover2List.username }">
		               <input type="hidden" id="pick_no" name="coverletterList2[${status.index }].pick_no" value="${Cover2List.pick_no }">
		               <input type="hidden" id="pick_code" name="coverletterList2[${status.index}].pick_code" value="${Cover2List.pick_code }">
		         </c:forEach>
		        </form> 
		</div>
		</div>
	
	<div class="col-sm-2">
	
</div>
</body>

</html>