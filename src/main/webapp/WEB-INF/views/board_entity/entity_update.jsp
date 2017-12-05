<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>                                             
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

    <head>
        <title>게시판</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
        <script type="text/javascript">
     /*    $(document).ready(function(){
            
        
             
            $("#list").click(function(){
                location.href = "entity_list.htm";
            });
             
            $("#saves").click(function(){
                 
                //널 검사
                if($("#entity_title").val().trim() == ""){
                    alert("제목2을 입력하세요.");
                    $("#entity_title").focus();
                    return false;
                }

            
               if($("#entity_ctmt").val().trim() == ""){
                    alert("내용를 입력하세요.");
                    $("#entity_ctmt").focus();
                    return false;
                } 
				
                
                 
                 
            });
             
        }); */
    </script>
       
    </head>
    

 
 <div id="content">

        <!-- 좌우측의 공간 확보 -->
     
            <hr/>
        
            <div class="row">
                <div class="col-md-10">
                    <form action="entity_update.htm" method="post" name="n" >
                    <table class="table table-condensed">
                     
                        <thead>
                        <tr>
                        <th><input type="hidden" id="entity_code" name="entity_code" value = "${entitydto.entity_code}">
                        	<input type="hidden" id="username" name="username" value = "${entitydto.username}">
                        	<input type="hidden" id="entity_date" name="entity_date" value = "${entitydto.entity_date}">
                        	
                        </th>
                        </tr>
                            <tr align="center">
                                <th width=10%><div> 제목: <input type="text" id="entity_title" name="entity_title" style="width:20%;" value="${entitydto.entity_title }"/>
                                작성자: <input type="text" id="username" name="username" style="width:170px;" maxlength="10" value="${entitydto.username}" readonly/></div>
                                </th>
                                <td></td>                   
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                    	<input type = "text" name="entity_ctmt" id="entity_ctmt" value="${entitydto.entity_ctmt}" style="height: 500px; width: 400px">
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
                                    	<input type="submit" id="saves" name="saves" >
                                        <!-- <button type="button" id="save" class="btn btn-default">저장</button> -->
                                        <button type="button" id="list" name="list" class="btn btn-default">목록</button>
                                      
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
                  </form>
                </div>
            </div>
          
            <hr/>
        </div>    