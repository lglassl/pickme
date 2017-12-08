<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>

textarea{
margin: 0px; 
width: 58%; 
height: 100px;
}
.input input{
color:red;
}

.floating { 
position: fixed; 
top: 550px;
right: 55%; 
margin-right: -720px; 
text-align:center; 
width: 120px;


}

#aa{
border-top-left-radius: 20%;   
border-top-right-radius: 20px;
border-bottom-right-radius: 20px 10px;
border-bottom-left-radius: 30px;
border:2px solid #ff3535; 
border-radius: 5px;
}

</style>
<body>
  <div class="container">
  <div class="col-sm-2"></div>
  <div class="col-sm-8">
  
         <c:forEach items="${Cover2List }" var="Cover2List" varStatus="status">   
         <input type="hidden" name="#" value="${Cover2List.username}">
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
                        <textarea id="coverletterList2_resu_edit${status.index }" name="coverletterList2[${status.index }].resu_edit" rows="10" cols="92%" placeholder="첨삭내용을 입력하세요"></textarea>      
                     </div>
                  </div>
               </div>
               <hr color="#808080">
               <input type="hidden" id="pick_no" name="coverletterList2[${status.index }].pick_no" value="${Cover2List.pick_no }">
               <input type="hidden" id="pick_code" name="coverletterList2[${status.index }].pick_code" value="${Cover2List.pick_code }">
         </c:forEach>
</div>
</div>
<div class="col-sm-2">
<div class="floating"> 
<button id="aa" type="button" class="btn btn-warning" onclick="editComple()">등록하기(첨삭완료)</button>
</div>

</div>
</body>
<script type="text/javascript">
function editComple(){
 	$.ajax({
		type: "post",
		url:  "",
		cache: false,				
		data:'',
		 success:function(data){
			 	alert("업데이트 시켜서 첨삭상태를 변경시켰다면 이제 리스트에서 빠졌겠쥬??")
		    	location.href = "adminEditBoard.htm"; 
		     },
			error: function(){						
				alert('Error while request..');
			}
		});
 };

</script>
</html>