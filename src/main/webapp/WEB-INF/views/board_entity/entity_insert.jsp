<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

    <head>
        <title>게시판</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
        <script type="text/javascript">
        $(document).ready(function(){
            
        
             
            $("#list").click(function(){
                location.href = "entity_list.htm";
            });
             
            $("#save").click(function(){
                 
                //널 검사
                if($("#entity_title").val().trim() == ""){
                    alert("제목을 입력하세요.");
                    $("#entity_title").focus();
                    return false;
                }
                 
                if($("#username").val().trim() == ""){
                    alert("작성자를 입력하세요.");
                    $("#username").focus();
                    return false;
                }
                
            
               if($("#entity_ctmt").val().trim() == ""){
                    alert("내용를 입력하세요.");
                    $("#entity_ctmt").focus();
                    return false;
                } 

                $.ajax({
         			type: "post",
         			url:  "entity_insert.htm",
         			cache: false,				
         			data:'entity_title=' + $("#entity_title").val() + "&username=" + $("#username").val() + "&entity_ctmt=" + $("#entity_ctmt").val(),
         		    success:function(data){ //callback  
         		    	
         		    	location.href = "entity_list.htm"; 
         		         
         		     },
         			error: function(){						
         				alert('Error while request..'	);
         			}
         		});
                 
                 
            });
             
        });
    </script>
       
    </head>
    

 
 <div id="content">

        <!-- 좌우측의 공간 확보 -->
     
            <hr/>
            <div class="row">
                <div class="col-md-10">
                    <table class="table table-condensed">
                     
                        <thead>
                            <tr align="center">
                                <th width=10%><div> 제목: <input type="text" id="entity_title" name="entity_title" style="width:20%;" value=""/>
                                작성자: <input type="text" id="username" name="username" style="width:170px;" maxlength="10" value=""/></div>
           						
                                </th>

                                <td></td>                   
                            </tr>
                        </thead>
                        <tbody>
                            
                            <tr>
                                
                            </tr>
                            <tr>
                                <td>
                    	<textarea rows="30" cols="80" name="entity_ctmt" id="entity_ctmt"></textarea>
                         
                    </td>
                            </tr>
                            
                        </tbody>
                        
                    </table>
                     <table id="commentTable" class="table table-condensed"></table>
                   
                    <table class="table table-condensed">
                        <thead>
                            <tr style="width : 80%">
                                <td>
                                    <span>
                                        <button type="save" id="save" class="btn btn-default">등록</button>
                                        <button type="button" id="list" name="list" class="btn btn-default">목록</button>
                                      
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
                
                </div>
            </div>
            <hr/>
        </div>    
			