<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/resources/bootstrap/css/entityList.css" rel="stylesheet" type="text/css" />
                      <script>
   
                        $(function(){
                                               
                            $( "#list" ).click(function( event ) {
                                location.href='/qa_list.htm';
                            });
                            
                            <%--  
                            @JSP : qa_detail.jsp 
                            @Date : 2017-11-30
                            @Author : 오영진
                            @Desc : 게시글 수정창 이동
                         --%>
                            $( "#modify" ).click(function( event ) {
                                location.href='qa_update';
                            });
                            $('#delete').click(function() { 
                            	var con = confirm("삭제 하시겠습니까 ? ");
                     	    	if (con == true) {
                     	    	 	var url="qa_delete.htm?qa_code="+${qadto.qa_code};
                     	    	 	location.href=url;
                     	    	 	return url
                     	    	 	
                     	    	}
                            });
                            

                            $("#modify").click(function(){
                            	location.href='qa_update';
                            });
                           
                        });
                        
                        //////////////////////////////////////////////
                        
                        
             			/*  /////////////댓글 처리////////////// */
                        
                    
                    
            $(document).ready(function(){
                 
              
                 
                //댓글 저장
                $("#reply_save").click(function(){
                	
                    //널 검사
                    if($("#reply_writer").val().trim() == ""){
                        alert("이름을 입력하세요.");
                        $("#reply_writer").focus();
                        return false;
                    }
                     
                    if($("#reply_password").val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        $("#reply_password").focus();
                        return false;
                    }
                     
                    if($("#reply_content").val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#reply_content").focus();
                        return false; 
                    }
                     
                    var reply_content = $("#reply_content").val().replace("\n", "<br>"); //개행처리
                     
                    //값 셋팅
                    var objParams = {
                    		
                    		qa_code : ${qadto.qa_code},
                            qa_parent       : "0",  
                            qa_re_depth    : "0",
                            username   : $("#reply_writer").val(),
                            qa_re_pwd  : $("#reply_password").val(),
                            qa_re_ctmt   : reply_content
                            
                    }; 
                     
                    var reply_id;
                     
                    //ajax 호출
                    $.ajax({
                        url         :   "qa_re_insert.htm",
                       	dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, 
                        data        :   objParams,
                        success     :   function(retVal){
                        	 console.log("ajax 에서 id값 : " + reply_id);
                            if(retVal.code != "OK") {
                               
                            }else{
                                reply_id = retVal.qa_re_code;
                                console.log("ajax 에서 id값 : " + reply_id);
                            }
                             
                        },
                        error       :   function(request, status, error){
                        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                        	
                            console.log("AJAX_ERROR");
                        }
            
                    });
                     
                    var reply_area = $("#reply_area");
                     
                    var reply = 
                        '<tr reply_type="main">'+
                        '   <td width="870px">'+
                        reply_content+
                        '   </td>'+
                        '   <td width="100px">'+
                        $("#reply_writer").val()+
                        '   </td>'+
                        '   <td width="100px">'+
                        '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                        '   </td>'+
                        '   <td>'+
                        '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>'+
                        '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                        '   </td>'+
                        '</tr>';
                         
                     if($('#reply_area').contents().size()==0){
                         $('#reply_area').append(reply);
                     }else{
                         $('#reply_area tr:last').after(reply);
                     }
 
                    //댓글 초기화
                  
                    $("#reply_password").val("");
                    $("#reply_content").val("");
                     
                });
                 
                //댓글 삭제
                
                $("button[name='reply_del']").click(function(){//id값 바뀌기때문에 name값
                     
                    var check = false;
                    var reply_id = $(this).attr("reply_id");
                    console.log("값2 : " + reply_id);
                    var reply_password = "reply_password_"+reply_id;
                     
                    if($("#"+reply_password).val().trim() == ""){
                        alert("패스워드을 입력하세요.");
                        $("#"+reply_password).focus();
                        return false;
                    }
                     
                    var objParams = {
                            qa_re_pwd  : $("#"+reply_password).val(),
                            qa_re_code        : reply_id,
                            qa_code     : ${qadto.qa_code}
                    };
                     
                    //ajax 호출
                    $.ajax({
                        url         :   "qa_re_delete.htm",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                 alert(retVal);
                                check = true;
                                                                 
                            }
                             
                        },
                        error       :   function(request, status, error){
                            check = true;
                        }
                    });
                     
                    if(check){
                        //삭제하면서 하위 댓글도 삭제
                        var prevTr = $(this).parent().parent().next(); //댓글의 다음
                         
                        while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                            prevTr = prevTr.next();
                            prevTr.prev().remove();
                        }
                         
                        //마지막 리플 처리
                        if(prevTr.attr("reply_type") == undefined){
                            prevTr = $(this).parent().parent();
                            prevTr.remove();
                        }
                         
                        $(this).parent().parent().remove(); 
                    }
                     
               
 
                       /*      if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                 alert(retVal.code)
                                check = true;                          
                            } */
                        	 /*   alert(check);
                               console.log("체크성공")
                               var prevTr = $(this).parent().parent().next(); //댓글의 다음
                                
                               while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                                   prevTr = prevTr.next();
                                   prevTr.prev().remove();
                               }
                                
                               //마지막 리플 처리
                               if(prevTr.attr("reply_type") == undefined){
                                   prevTr = $(this).parent().parent();
                                   prevTr.remove();
                               }
                                
                               $(this).parent().parent().remove(); 
                             
                        }, */
                        
                    /*     	console.log(data);
                 		    
             		    	$('#replyList').empty();
             		    	
            				$.each(data.list, function(index,obj){
            					var opr="";
            					opr += "<tr><td>작성자 : " + obj.username + "</td><td>&nbsp;</td><td>작성일자 : ";
            					opr += obj.qa_date +"</td></tr><tr><td colspan='2'>"+obj.qa_ctmt;
            					opr += "</td><td>";
            					
            					/*  '    <tr> <td> +  <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>      '+
                        '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+</td></tr> */
            					
            				/*	
            					opr += "<tr><td> +  <button name="+'reply_del'+" reply_id = "+'reply_id'+">삭제</button>";
                               	opr += "<button name="+'reply_reply'+" reply_id = "+'reply_id'+">댓글</button>'+</td></tr>";
            					$('#replylist').append(opr);
            					console.log(obj.rno)
            				});
             		     },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                            
                        }
                    }); */
                     
                /*     if(check){
                        //삭제하면서 하위 댓글도 삭제
                        alert(check);
                        console.log("체크성공")
                        var prevTr = $(this).parent().parent().next(); //댓글의 다음
                         
                        while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                            prevTr = prevTr.next();
                            prevTr.prev().remove();
                        }
                         
                        //마지막 리플 처리
                        if(prevTr.attr("reply_type") == undefined){
                            prevTr = $(this).parent().parent();
                            prevTr.remove();
                        }
                         
                        $(this).parent().parent().remove(); 
                    } */
                    
                });
                 
                //대댓글 입력창
                $(document).on("click","button[name='reply_reply']",function(){ //동적 이벤트
                     
                    $("#reply_add").remove();
                     
                    var reply_id = $(this).attr("reply_id");
                    var last_check = false;//마지막 tr 체크
                     
                    //입력받는 창 등록
                     var replyEditor = 
                        '<tr id="reply_add" class="reply_reply">'+
                        '   <td width="870px">'+
                        '       <textarea name="reply_reply_content" rows="3" cols="50"></textarea>'+
                        '   </td>'+
                        '   <td width="100px">'+
                        '       <input type="text" name="reply_reply_writer" style="width:100%;" maxlength="10" placeholder="작성자"/>'+
                        '   </td>'+
                        '   <td width="100px">'+
                        '       <input type="password" name="reply_reply_password" style="width:100%;" maxlength="10" placeholder="패스워드"/>'+
                        '   </td>'+
                        '   <td>'+
                        '       <button name="reply_reply_save" reply_id="'+reply_id+'">등록</button>'+
                        '       <button name="reply_reply_cancel">취소</button>'+
                        '   </td>'+
                        '</tr>';
                         
                    var prevTr = $(this).parent().parent().next();
                     
                    //부모의 부모 다음이 sub이면 마지막 sub 뒤에 붙인다.
                    //마지막 리플 처리
                    if(prevTr.attr("reply_type") == undefined){
                        prevTr = $(this).parent().parent();
                    }else{
                        while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                            prevTr = prevTr.next();
                        }
                         
                        if(prevTr.attr("reply_type") == undefined){//next뒤에 tr이 없다면 마지막이라는 표시를 해주자
                            last_check = true;
                        }else{
                            prevTr = prevTr.prev();
                        }
                         
                    }
                     
                    if(last_check){//마지막이라면 제일 마지막 tr 뒤에 댓글 입력을 붙인다.
                        $('#reply_area tr:last').after(replyEditor);    
                    }else{
                        prevTr.after(replyEditor);
                    }
                     
                });
                 
                //대댓글 등록
                $(document).on("click","button[name='reply_reply_save']",function(){
                                         
                    var reply_reply_writer = $("input[name='reply_reply_writer']");
                    var reply_reply_password = $("input[name='reply_reply_password']");
                    var reply_reply_content = $("textarea[name='reply_reply_content']");
                    var reply_reply_content_val = reply_reply_content.val().replace("\n", "<br>"); //개행처리
                     
                    //널 검사
                    if(reply_reply_writer.val().trim() == ""){
                        alert("이름을 입력하세요.");
                        reply_reply_writer.focus();
                        return false;
                    }
                     
                    if(reply_reply_password.val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        reply_reply_password.focus();
                        return false;
                    }
                     
                    if(reply_reply_content.val().trim() == ""){
                        alert("내용을 입력하세요.");
                        reply_reply_content.focus();
                        return false;
                    }
                     
                    //값 셋팅
                    var objParams = {
                    		qa_code        : $("#board_id").val(),
                    		qa_parent       : "1", 
                    		qa_re_depth           : "1",
                    		username    : reply_reply_writer.val(),
                    		qa_re_pwd  : reply_reply_password.val(),
                    		qa_re_ctmt   : reply_reply_content_val
                    };
                     
                    var reply_id;
                     
                    //ajax 호출
                    $.ajax({
                        url         :   "qa_re_insert.htm",
                        dataType    :   "json",
                        contentType :   "application/json; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 								console.log("retVal : " + retVal);
                            if(retVal.code != "OK") {
                            	$("#replyarea"+reno).remove();

                            }else{
                                reply_id = retVal.reply_id;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                     
                    var reply = 
                        '<tr reply_type="sub">'+
                        '   <td width="870px"> → '+
                        reply_reply_content_val+
                        '   </td>'+
                        '   <td width="100px">'+
                        reply_reply_writer.val()+
                        '   </td>'+
                        '   <td width="100px">'+
                        '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                        '   </td>'+
                        '   <td>'+
                        '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>'+
                        '   </td>'+
                        '</tr>';
                         
                    var prevTr = $(this).parent().parent().prev();
                     
                    prevTr.after(reply);
                                         
                    $("#reply_add").remove();
                     
                });
                //대댓글 입력창 취소
                $(document).on("click","button[name='reply_reply_cancel']",function(){
                    $("#reply_add").remove();
                });
                 
        
            });
        </script>
                  
        <!-- 좌우측의 공간 확보 -->
        <div class="content">
		<div class="main_area">
            <hr/>
            <div class="row">
                <div class="col-md-10">
                    <table class="table table-striped">
						<tr align="center">
							<th style="width:20%">제목</th>
							<td align="left"><input type="text" value="${qadto.qa_title}" readonly></td>
						</tr>
						<tr>
							<th>작성일</th>
							<td><input type="text" value="${qadto.qa_date}" readonly></td>
						</tr>
						<tr>
							<th>글쓴이</th>
							<td id="id">
								<span id="">
                                <input type="text" value=" ${qadto.username}" readonly>
								</span>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><input type="text" value=" ${qadto.qa_ctmt}" readonly></td>
						</tr>
                    </table>
                 
		
            
                     <div align="center">
                 <table border="1" id="reply_area">
                <tr reply_type="all"><!-- 뒤에 댓글 붙이기 쉽게 선언 -->
                    <td colspan="4"></td>
                </tr>
                <!-- 댓글이 들어갈 공간 -->
                <c:forEach var="replyList" items="${replyList}" varStatus="status">
                
                    <tr reply_type="<c:if test="${replyList.qa_re_depth == '0'}">main</c:if><c:if test="${replyList.qa_re_depth == '1'}">sub</c:if>"><!-- 댓글의 depth 표시 -->
                        <td width="870px">
                            <c:if test="${replyList.qa_re_depth == '1'}"> → </c:if>${replyList.qa_re_ctmt}
                                   
                        </td>
                        <td width="100px">
                            ${replyList.username}
                        </td>
                        <td width="100px">
                            <input type="password" id="reply_password_${replyList.qa_re_code}" style="width:100px;" maxlength="10" placeholder="패스워드"/>
                           
                        </td>
                        <td>
                            <button name="reply_del" reply_id = "${replyList.qa_re_code}">삭제</button>
                            <c:if test="${replyList.qa_re_depth != '1'}">
                                <button name="reply_reply" reply_id = "${replyList.qa_re_code}">댓글</button><!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <table class="table table2">
                <tr>
                    <td width="500px">
                        이름: <input type="text" id="reply_writer" name="reply_writer" style="width:170px;" maxlength="10" placeholder="작성자"/>
                        패스워드: <input type="password" id="reply_password" name="reply_password" style="width:170px;" maxlength="10" placeholder="패스워드"/>
                        <button id="reply_save" name="reply_save">댓글 등록</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <textarea id="reply_content" style="width:100%" name="reply_content" rows="4" placeholder="댓글을 입력하세요."></textarea>
                    </td>
                </tr>
            </table>
            
				<div style="text-align:center">
					<button type="button" id="list" class="btn btn-default" onclick="location.href='qa_list.htm'">목록</button>
					<button type="button" onclick="location.href='qa_updateForm.htm?qa_code=${qadto.qa_code}'" class="btn btn-default" >수정</button>
					<button type="button" id="delete" class="btn btn-default">삭제</button>
					<button type="button" id="write" class="btn btn-default">글쓰기</button>
				</div>
                                        
                    
                    </div>
                </div>
                </div>
                </div>
			</div>