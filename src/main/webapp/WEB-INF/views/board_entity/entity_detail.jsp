<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <!-- Bootstrap -->
        <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
       <link href="/resources/bootstrap/css/entityList.css" rel="stylesheet" type="text/css" />
       
       
       <!-- //////////////////////////////////////////////////////// -->

    </head>
                      <script>
   
                        $(function(){
                                               
                            $( "#list" ).click(function( event ) {
                                location.href='/community/notice';
                            });
                            $( "#modify" ).click(function( event ) {
                                location.href='entity_update';
                            });
                            $('#delete').click(function() { 
                            	var con = confirm("삭제 하시겠습니까 ? ");
                     	    	if (con == true) {
                     	    	 	var url="entity_delete.htm?entity_code="+${entitydto.entity_code};
                     	    	 	location.href=url;
                     	    	 	return url
                     	    	 	
                     	    	}
                            });
                            

                            $("#modify").click(function(){
                            	location.href='entity_update';
                            });
                            $( "#write" ).click(function( event ) {
                                location.href='/community/notice/edit';
                            });
                        });
                        
                        //////////////////////////////////////////////
                        
                        
             /*  댓글 처리 */
                        
                        /* 댓글 삭제*/
                      function deletereply(entity_code,  ){
                    		var json = {"seq": seq, "rno": rno};
                    		_data = JSON.stringify(json);
                    		
                    		$.ajax({
                     			type: "POST",
                     			url:  "replydelete.htm",
                     			contentType: "application/json; charset=utf-8",
                     			dataType: "json",
                     			data: _data,
                     		    success:function(data){ //callback  
                     		    	console.log(data);
                     		    
                     		    	$('#replylist').empty();
                     		    	
                    				$.each(data.list, function(index,obj){
                    					var opr="";
                    					opr += "<tr><td>작성자 : " + obj.writer + "</td><td>&nbsp;</td><td>작성일자 : ";
                    					opr += obj.regdate +"</td></tr><tr><td colspan='2'>"+obj.content;
                    					opr += "</td><td>";
                    					opr += "<a class='btn-del button' id='" + obj.rno + "' title='"+obj.rno+"' onclick='deletereply(" + seq + ", " + obj.rno + ")'>삭제</a></td></tr>";
                    					$('#replylist').append(opr);
                    					console.log(obj.rno)
                    				});
                     		     },
                     		    error:function(request,status,error){
                                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                }
                     		}); 
                    	}
                    	
                    	function replyinsert(){
                    		var json = {"seq":$('#seq').val(), "writer":$('#reply_writer').val(), "content":$('#reply_content').val()};
                    		_data = JSON.stringify(json);
                    		 $.ajax({
                     			type: "POST",
                     			url:  "replyinsert.htm",
                     			contentType: "application/json; charset=utf-8",
                     			data: _data,
                     		    success:function(data){ //callback  
                     		    	console.log(data);
                     		    
                     		    	$('#replylist').empty();
                     		    	$('#reply_writer').val("");
                     		    	$('#reply_content').val("");
                     		    	
                     		    	$.each(data.list, function(index,obj){
                    					var opr="";
                    					opr += "<tr><td>작성자 : " + obj.writer + "</td><td>&nbsp;</td><td>작성일자 : ";
                    					opr += obj.regdate +"</td></tr><tr><td colspan='2'>"+obj.content;
                    					opr += "</td><td>";
                    					opr += "<a class='btn-del button' id='" + obj.rno + "' title='"+obj.rno+"' onclick='deletereply(" + $('#seq').val() + ", " + obj.rno + ")'>삭제</a></td></tr>";
                    					$('#replylist').append(opr);
                    					console.log(obj.rno)
                    				});
                     		     },
                     		    error:function(request,status,error){
                                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                }
                     		     
                     		}); 
                    	}
                        
                    </script>
                    
        
        
                       
                   

	

        <!-- 좌우측의 공간 확보 -->
        <div class="content">
            <hr/>
            <div class="row">
                <div class="col-md-10">
                    <table class="table table-condensed">
                     
                        <thead>
                            <tr align="center">
                                <th width=10%>제목</th>
                               
                               
                              <td align="left"><input type="text" value="${entitydto.entity_title}" readonly></td>
           						
                                <td></td>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>작성일
                                </td>
                                <td>
                                <input type="text" value="${entitydto.entity_date}" readonly>
                               
                                </td>
                            </tr>
                            <tr>
                                <td>글쓴이
                                </td>
                                <td id="id">
                                <span id="">
                                <input type="text" value=" ${entitydto.username}" readonly>
                               </span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <p>
                                    <input type="text" value=" ${entitydto.entity_ctmt}" readonly>
                                    </p>
                        
                                </td>
                            </tr>
                            
                        </tbody>
                        
                    </table>
                    <table id="replylist">
				<%-- <c:forEach items="${list }" var="reply">
					<tr>
						<td>작성자 : ${reply.writer}</td>
						<td>&nbsp;</td>
						<td>작성일자 : ${reply.regdate}</td>
					</tr>
					<tr>
						<td colspan="2">
						${reply.content}
						</td>
						<td>
							<a class="btn-del button replydelete" title="${reply.rno}" onclick="deletereply(${notice.seq}, ${reply.rno})">삭제</a>
						</td>
					</tr>
				</c:forEach> --%>
				</table>
                    <table class="table table-condensed">
                        <tr>
                            <td>
                                <span class="form-inline" role="form">
                                    <p>
                                        <div class="form-group">
                                            <input type="text" id="replyUsername" name="replyParentName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="replyPassward" name="replyPassward" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <button type="button" id="replyInsert" name="replyInsert" class="btn btn-default">확인</button>
                                        </div>
                                    </p>
                                        <textarea id="replyCtmt" class="form-control col-lg-12" style="width:80%" rows="4"></textarea>
                                </span>
                            </td>
                        </tr>
                    </table>
                    <table class="table table-condensed">
                        <thead>
                            <tr style="width : 80%">
                                <td>
                                
                                    <span>
                                        <button type="button" id="list" class="btn btn-default">목록</button>
                                        <button type="button" onclick="location.href='entity_updateForm.htm?entity_code=${entitydto.entity_code}'" class="btn btn-default" >수정</button>
                                        <button type="button" id="delete" class="btn btn-default">삭제</button>
                                        <button type="button" id="write" class="btn btn-default">글쓰기</button>
                                        
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
                </div>
                